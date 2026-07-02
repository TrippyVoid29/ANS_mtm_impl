`timescale 1ns / 1ps

module tANS_encoder_fsm_256 #(
    parameter int R = 4,
    parameter int L = 256
)(
    input  logic       clk,
    input  logic       rst_n,
    
    input  logic       start_init,
    input  logic       start_encode,
    input  logic [1:0] symbol_in,
    input  logic       symbol_valid,
    
    output logic       bit_out,
    output logic       bit_valid,
    output logic       ready,
    output logic [8:0] final_state,
    output logic [32:0] bitstream
);

    localparam int STEP = 163; 

    typedef enum logic [2:0] {
        IDLE,            
        INIT_SPREAD,     
        INIT_ENCODE,     
        READY,           
        ENC_RENORM,      
        ENC_UPDATE       
    } state_t;
    
    state_t current_state;

    (* ram_style = "block" *)
    logic [1:0] spread_table [0:L-1];
    
    (* ram_style = "block" *)
    logic [8:0] encode_table [0:R-1][0:(L/2)-1]; 
    
    logic [7:0] freq [0:R-1];
    assign freq[0] = 128; 
    assign freq[1] = 64;  
    assign freq[2] = 32;  
    assign freq[3] = 32;  

    logic [7:0] pos;          
    logic [2:0] sym_idx;      
    logic [7:0] freq_cnt;     
    logic [8:0] init_idx;     
    
    logic [7:0] counters [0:R-1]; 
    
    logic [8:0] state;             
    logic [1:0] current_symbol;    
    logic [15:0] target_limit;     
    logic [32:0] bitstream_reg;    

    assign final_state = state;
    assign bitstream = bitstream_reg;

    always_ff @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            current_state <= IDLE;
            pos           <= 0;
            sym_idx       <= 0;
            freq_cnt      <= 0;
            init_idx      <= 0;
            state         <= L; 
            bit_valid      <= 0;
            ready          <= 0;
            bitstream_reg  <= 0;
            for(int i=0; i<R; i++) counters[i] <= 0;
        end else begin
            bit_valid <= 1'b0;
            
            case (current_state)
                IDLE: begin
                    if (start_init) begin
                        current_state <= INIT_SPREAD;
                        pos           <= 0;
                        sym_idx       <= 0;
                        freq_cnt      <= 0;
                    end
                end
                
                INIT_SPREAD: begin
                    if (sym_idx < R) begin
                        if (freq_cnt < freq[sym_idx]) begin
                            spread_table[pos] <= sym_idx;
                            pos <= (pos + STEP) & (L - 1); 
                            freq_cnt <= freq_cnt + 1;
                        end else begin
                            sym_idx <= sym_idx + 1;
                            freq_cnt <= 0;
                        end
                    end else begin
                        current_state <= INIT_ENCODE; 
                        init_idx <= 0;
                    end
                end
                
                INIT_ENCODE: begin
                    if (init_idx < L) begin
                        logic [1:0] s = spread_table[init_idx];
                        logic [7:0] c = counters[s];
                        
                        encode_table[s][c] <= init_idx + L; 
                        
                        counters[s]        <= c + 1;
                        init_idx           <= init_idx + 1;
                    end else begin
                        current_state <= READY;
                        ready         <= 1'b1;
                    end
                end
                
                READY: begin
                    if (start_encode && symbol_valid) begin
                        current_symbol <= symbol_in;
                        ready          <= 1'b0;
                        target_limit   <= (freq[symbol_in] << 1); 
                        current_state  <= ENC_RENORM;
                    end
                end
                
                ENC_RENORM: begin
                    if (state >= target_limit) begin
                        bit_out       <= state[0]; 
                        bit_valid     <= 1'b1;
                        bitstream_reg <= {bitstream_reg[31:0], state[0]};
                        state         <= state >> 1;
                    end else begin
                        current_state <= ENC_UPDATE;
                    end
                end
                
                ENC_UPDATE: begin
                    logic [7:0] c_freq;
                    c_freq = freq[current_symbol]; 
                    
                    state <= encode_table[current_symbol][state & (c_freq - 1)];
                    
                    current_state <= READY;
                    ready         <= 1'b1;
                end
            endcase
        end
    end

endmodule