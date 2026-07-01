`timescale 1ns / 1ps

module tb_tANS_decoder_fsm_256;

    logic clk;
    logic rst_n;

    logic        start_init;
    logic        start_decode;
    logic [8:0]  start_state;
    logic [15:0] data_length;

    logic        pop_bit;
    logic        bit_in;
    logic        lifo_empty;

    logic [1:0]  symbol_out;
    logic        symbol_valid;
    logic        ready;

    int received_symbols;
    int bit_index;
    int bit_count;
    logic [7:0] bitstream_data;

    tANS_decoder_fsm_256 #(
        .R(4),
        .L(256)
    ) dut (
        .clk(clk),
        .rst_n(rst_n),
        .start_init(start_init),
        .start_decode(start_decode),
        .start_state(start_state),
        .data_length(data_length),
        .pop_bit(pop_bit),
        .bit_in(bit_in),
        .lifo_empty(lifo_empty),
        .symbol_out(symbol_out),
        .symbol_valid(symbol_valid),
        .ready(ready)
    );

    initial begin
        clk = 0;
        forever #5 clk = ~clk;
    end

    always_ff @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            received_symbols <= 0;
            bit_index        <= 0;
            bit_in           <= 1'b0;
        end else begin
            if (symbol_valid) begin
                received_symbols <= received_symbols + 1;
                $display("[%0t] Zdekodowano symbol: %0d", $time, symbol_out);
            end

            if (pop_bit && bit_index < bit_count) begin
                bit_in    <= bitstream_data[bit_index];
                bit_index <= bit_index + 1;
            end else if (pop_bit) begin
                bit_in <= 1'b0;
            end
        end
    end

    assign lifo_empty = (bit_index >= bit_count);

    initial begin
        $display("=== Rozpoczecie symulacji dekodera tANS (L=256) ===");

        rst_n        = 0;
        start_init   = 0;
        start_decode = 0;
        start_state  = 0;
        data_length  = 0;
        bit_count    = 0;
        bitstream_data = 8'b10100101;

        #20 rst_n = 1;
        #10;

        $display("[%0t] Rozpoczecie budowy tabel dekodera...", $time);
        start_init = 1;
        #10 start_init = 0;

        wait(ready == 1'b1);
        $display("[%0t] Inicjalizacja zakonczona. Uklad gotowy (READY).", $time);

        bit_count = 8;

        $display("[%0t] Uruchamianie dekodowania z poczatkowym stanem %0d", $time, start_state);
        @(negedge clk);
        start_state  = 9'd100;
        data_length  = 4;
        start_decode = 1;
        @(negedge clk);
        start_decode = 0;

        wait(ready == 1'b1);

        #20;
        if (received_symbols == data_length) begin
            $display("[%0t] === Symulacja zakonczona sukcesem ===", $time);
        end else begin
            $display("[%0t] === Symulacja zakonczona z bledem: oczekiwano %0d symboli, otrzymano %0d ===",
                     $time, data_length, received_symbols);
        end

        $finish;
    end

endmodule
