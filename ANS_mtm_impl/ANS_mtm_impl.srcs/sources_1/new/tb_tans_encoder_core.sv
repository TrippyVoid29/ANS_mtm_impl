`timescale 1ns / 1ps

module tb_tans_encoder_core;

    localparam int SYMBOL_WIDTH     = 8;
    localparam int STATE_WIDTH      = 16;
    localparam int TABLE_ADDR_WIDTH = 10;
    localparam int EMIT_BITS_WIDTH  = 8;
    localparam int TABLE_DEPTH      = 1 << TABLE_ADDR_WIDTH;

    logic clk;
    logic rst_n;

    logic start;
    logic busy;
    logic done;

    logic [SYMBOL_WIDTH-1:0] symbol;
    logic [STATE_WIDTH-1:0]  state_in;

    logic [STATE_WIDTH-1:0] state_out;
    logic [31:0]            bits_out;
    logic [4:0]             nbits_out;

    logic [TABLE_ADDR_WIDTH-1:0] table_addr;
    logic [31:0]                 table_data;

    logic [31:0] table_mem [0:TABLE_DEPTH-1];

    tans_encoder_core #(
        .SYMBOL_WIDTH(SYMBOL_WIDTH),
        .STATE_WIDTH(STATE_WIDTH),
        .TABLE_ADDR_WIDTH(TABLE_ADDR_WIDTH),
        .EMIT_BITS_WIDTH(EMIT_BITS_WIDTH)
    ) dut (
        .clk(clk),
        .rst_n(rst_n),

        .start(start),
        .busy(busy),
        .done(done),

        .symbol(symbol),
        .state_in(state_in),

        .state_out(state_out),
        .bits_out(bits_out),
        .nbits_out(nbits_out),

        .table_addr(table_addr),
        .table_data(table_data)
    );

    assign table_data = table_mem[table_addr];

    always #5 clk = ~clk;

    initial begin
        clk      = 1'b0;
        rst_n    = 1'b0;
        start    = 1'b0;
        symbol   = '0;
        state_in = '0;

        for (int i = 0; i < TABLE_DEPTH; i++) begin
            table_mem[i] = 32'd0;
        end

        /*
            Test:
            symbol = 65, czyli ASCII 'A'
            state_in = 100

            Przy TABLE_ADDR_WIDTH = 10:
            table_addr = {symbol[7:0], state_in[1:0]}
            state_in[1:0] = 2'b00
            table_addr = {8'd65, 2'b00}
        */

        table_mem[{8'd65, 2'b00}] = {
            16'd1234,       // next_state
            8'b10101010,    // bits_out
            3'b000,         // reserved
            5'd4            // nbits_out
        };

        #20;
        rst_n = 1'b1;

        #10;
        symbol   = 8'd65;
        state_in = 16'd100;

        #10;
        start = 1'b1;

        #10;
        start = 1'b0;

        wait(done == 1'b1);

        #10;

        $display("table_addr = %0d", table_addr);
        $display("state_out  = %0d", state_out);
        $display("bits_out   = %b", bits_out);
        $display("nbits_out  = %0d", nbits_out);

        if (table_addr !== {8'd65, 2'b00}) begin
            $error("ERROR: wrong table_addr");
        end

        if (state_out !== 16'd1234) begin
            $error("ERROR: wrong state_out");
        end

        if (bits_out[7:0] !== 8'b10101010) begin
            $error("ERROR: wrong bits_out");
        end

        if (nbits_out !== 5'd4) begin
            $error("ERROR: wrong nbits_out");
        end

        $display("TEST PASSED");

        #20;
        $finish;
    end

endmodule