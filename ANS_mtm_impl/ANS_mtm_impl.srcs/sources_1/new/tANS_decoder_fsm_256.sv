`timescale 1ns / 1ps

module tANS_decoder_fsm_256 #(
    parameter int R = 4,
    parameter int L = 256
)(
    input  logic        clk,
    input  logic        rst_n,
    
    input  logic        start_init,
    input  logic        start_decode,
    input  logic [8:0]  start_state,
    input  logic [15:0] data_length,
    
    output logic        pop_bit,
    input  logic        bit_in,
    input  logic        lifo_empty,
    
    output logic [1:0]  symbol_out,
    output logic        symbol_valid,
    output logic        ready
);

    localparam int STEP = 163; 

    typedef enum logic [2:0] {
        IDLE,
        INIT_SPREAD,
        INIT_ENCODE,
        READY,
        DEC_EMIT,
        DEC_RENORM,
        DEC_WAIT_BIT,
        DEC_UPDATE
    } state_t;
    
    state_t current_state;

    (* ram_style = "block" *) logic [1:0] spread_table [0:L-1];
    (* ram_style = "block" *) logic [8:0] next_state_tbl [0:L-1];
    (* ram_style = "block" *) logic [2:0] nb_bits_tbl  [0:L-1];
    
    logic [7:0] freq [0:R-1];
    assign freq[0] = 128; 
    assign freq[1] = 64;  
    assign freq[2] = 32;  
    assign freq[3] = 32;  

    logic [7:0] pos;
    logic [1:0] sym_idx;
    logic [7:0] freq_cnt;
    logic [8:0] init_idx;
    
    logic [7:0] counters [0:R-1];
    
    logic [8:0] state;
    logic [15:0] len_cnt;
    logic [2:0] bits_to_read;
    logic [2:0] bits_read_cnt;

    always_ff @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            current_state <= IDLE;
            pos           <= 0;
            sym_idx       <= 0;
            freq_cnt      <= 0;
            init_idx      <= 0;
            state         <= 0;
            len_cnt       <= 0;
            symbol_valid  <= 0;
            pop_bit       <= 0;
            ready         <= 0;
            for(int i=0; i<R; i++) counters[i] <= 0;
        end else begin
            symbol_valid <= 1'b0;
            pop_bit      <= 1'b0;
            
            case (current_state)
                IDLE: begin
                    if (start_init) begin
                        current_state <= INIT_SPREAD;
                        pos           <= 0;
                        sym_idx       <= 0;
                        freq_cnt      <= 0;
                        init_idx      <= 0;
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
                    end
                end
                
                INIT_ENCODE: begin
                    if (init_idx < L) begin
                        logic [1:0] s = spread_table[init_idx];
                        logic [7:0] f_s = freq[s];
                        logic [7:0] c = counters[s];
                        logic [8:0] x_base = f_s + c; 
                        
                        next_state_tbl[init_idx] <= x_base;
                        counters[s] <= c + 1;
                        
                        if (f_s == 128) nb_bits_tbl[init_idx] <= 1; 
                        else if (f_s == 64) nb_bits_tbl[init_idx] <= 2;
                        else if (f_s == 32) nb_bits_tbl[init_idx] <= 3;
                        
                        init_idx <= init_idx + 1;
                    end else begin
                        current_state <= READY; 
                        ready <= 1'b1;
                    end
                end
                
                READY: begin
                    if (start_decode) begin
                        state         <= start_state;
                        len_cnt       <= data_length;
                        ready         <= 1'b0;
                        if (data_length > 0) begin
                            current_state <= DEC_EMIT;
                        end
                    end
                end
                
                DEC_EMIT: begin
                    logic [7:0] state_idx = state[7:0]; 
                    
                    symbol_out    <= spread_table[state_idx];
                    symbol_valid  <= 1'b1;
                    len_cnt       <= len_cnt - 1;
                    
                    bits_to_read  <= nb_bits_tbl[state_idx];
                    bits_read_cnt <= 0;
                    
                    state <= next_state_tbl[state_idx];
                    
                    current_state <= DEC_RENORM;
                end
                
                DEC_RENORM: begin
                    if (bits_read_cnt < bits_to_read && !lifo_empty) begin
                        pop_bit       <= 1'b1;       
                        current_state <= DEC_WAIT_BIT;
                    end else begin
                        current_state <= DEC_UPDATE; 
                    end
                end
                
                DEC_WAIT_BIT: begin
                    state         <= (state << 1) | bit_in;
                    bits_read_cnt <= bits_read_cnt + 1;
                    current_state <= DEC_RENORM;
                end
                
                DEC_UPDATE: begin
                    if (len_cnt == 0) begin
                        current_state <= READY;
                        ready         <= 1'b1;
                    end else begin
                        current_state <= DEC_EMIT;
                    end
                end
            endcase
        end
    end

endmodule