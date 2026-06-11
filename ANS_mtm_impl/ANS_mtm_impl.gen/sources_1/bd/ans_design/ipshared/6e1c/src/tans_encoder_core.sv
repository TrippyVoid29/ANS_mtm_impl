`timescale 1ns / 1ps

module tans_encoder_core #(
    parameter int SYMBOL_WIDTH     = 8,
    parameter int STATE_WIDTH      = 16,
    parameter int TABLE_ADDR_WIDTH = 10,
    parameter int EMIT_BITS_WIDTH  = 8
)(
    input  logic clk,
    input  logic rst_n,

    input  logic start,
    output logic busy,
    output logic done,

    input  logic [SYMBOL_WIDTH-1:0] symbol,
    input  logic [STATE_WIDTH-1:0]  state_in,

    output logic [STATE_WIDTH-1:0]  state_out,
    output logic [31:0]             bits_out,
    output logic [4:0]              nbits_out,

    output logic [TABLE_ADDR_WIDTH-1:0] table_addr,
    input  logic [31:0]                  table_data
);

    localparam int STATE_INDEX_WIDTH = TABLE_ADDR_WIDTH - SYMBOL_WIDTH;

    typedef enum logic [2:0] {
        IDLE,
        SET_ADDR,
        TABLE_LOOKUP,
        UPDATE_OUTPUTS,
        FINISH
    } fsm_state_t;

    fsm_state_t current_state;

    generate
        if (TABLE_ADDR_WIDTH <= SYMBOL_WIDTH) begin : PARAM_ERROR
            initial begin
                $error("TABLE_ADDR_WIDTH must be greater than SYMBOL_WIDTH");
            end
        end
    endgenerate

    /*
        Format pojedynczego wpisu table_data:

        [31:16] next_state
        [15:8]  bits_out
        [7:5]   reserved
        [4:0]   nbits_out
    */

    always_ff @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            current_state <= IDLE;

            busy       <= 1'b0;
            done       <= 1'b0;

            table_addr <= '0;
            state_out  <= '0;
            bits_out   <= '0;
            nbits_out  <= '0;
        end else begin
            case (current_state)

                IDLE: begin
                    busy <= 1'b0;
                    done <= 1'b0;

                    if (start) begin
                        busy <= 1'b1;
                        current_state <= SET_ADDR;
                    end
                end

                SET_ADDR: begin
                    /*
                        Adres tablicy tANS jest tworzony na podstawie:
                        - symbolu wejœciowego,
                        - czêœci aktualnego stanu kodera.

                        Dla domyœlnych parametrów:
                        SYMBOL_WIDTH = 8
                        TABLE_ADDR_WIDTH = 10
                        STATE_INDEX_WIDTH = 2

                        table_addr = {symbol[7:0], state_in[1:0]}
                    */
                    table_addr <= {
                        symbol,
                        state_in[STATE_INDEX_WIDTH-1:0]
                    };

                    current_state <= TABLE_LOOKUP;
                end

                TABLE_LOOKUP: begin
                    /*
                        Jeden cykl oczekiwania na dane z tablicy.
                        Dziêki temu modu³ pasuje zarówno do prostej pamiêci ROM,
                        jak i póŸniejszej pamiêci blokowej BRAM.
                    */
                    current_state <= UPDATE_OUTPUTS;
                end

                UPDATE_OUTPUTS: begin
                    state_out <= table_data[31:16];
                    bits_out  <= {{(32-EMIT_BITS_WIDTH){1'b0}}, table_data[15:8]};
                    nbits_out <= table_data[4:0];

                    current_state <= FINISH;
                end

                FINISH: begin
                    busy <= 1'b0;
                    done <= 1'b1;

                    current_state <= IDLE;
                end

                default: begin
                    current_state <= IDLE;
                end

            endcase
        end
    end

endmodule