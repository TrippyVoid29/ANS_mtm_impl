`timescale 1ns / 1ps

module tb_tANS_encoder_fsm_256;

    logic clk;
    logic rst_n;

    logic       start_init;
    logic       start_encode;
    logic [1:0] symbol_in;
    logic       symbol_valid;

    logic       bit_out;
    logic       bit_valid;
    logic       ready;

    tANS_encoder_fsm_256 #(
        .R(4),
        .L(256)
    ) dut (
        .clk(clk),
        .rst_n(rst_n),
        .start_init(start_init),
        .start_encode(start_encode),
        .symbol_in(symbol_in),
        .symbol_valid(symbol_valid),
        .bit_out(bit_out),
        .bit_valid(bit_valid),
        .ready(ready)
    );

    initial begin
        clk = 0;
        forever #5 clk = ~clk;
    end

    initial begin
        $display("=== Rozpoczecie symulacji tANS (L=256) ===");
        
        rst_n        = 0;
        start_init   = 0;
        start_encode = 0;
        symbol_in    = 0;
        symbol_valid = 0;

        #20 rst_n = 1;
        #10;
        
        $display("[%0t] Rozpoczecie budowy tabel (Step Algorithm)...", $time);
        start_init = 1;
        #10 start_init = 0;

        wait(ready == 1'b1);
        $display("[%0t] Inicjalizacja zakonczona. Uklad gotowy (READY).", $time);
        #10; 


        encode_symbol(2'd0, "A"); // 1 znak
        encode_symbol(2'd2, "C"); // 2 znak
        encode_symbol(2'd1, "B"); // 3 znak
        encode_symbol(2'd3, "D"); // 4 znak

        #50;
        $display("[%0t] === Symulacja zakonczona sukcesem ===", $time);
        $finish;
    end


    task encode_symbol(input logic [1:0] sym_val, input string sym_name);
        begin
            wait(ready == 1'b1);
            
            $display("[%0t] Wysylam symbol: %s (wartosc: %0d)", $time, sym_name, sym_val);
            
            @(negedge clk);
            symbol_in    = sym_val;
            symbol_valid = 1;
            start_encode = 1;
            
            @(negedge clk); 
            start_encode = 0;
            symbol_valid = 0;
            
            wait(ready == 1'b0);
        end
    endtask


    always @(posedge clk) begin
        if (bit_valid) begin
            $display("    -> Wypchnieto bit: %b (czas: %0t)", bit_out, $time);
        end
    end

endmodule