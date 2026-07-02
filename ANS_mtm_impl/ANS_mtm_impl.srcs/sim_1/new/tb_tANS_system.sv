`timescale 1ns / 1ps

module tb_tANS_system;

    // ==========================================
    // 1. SYGNA�Y GLOBALNE
    // ==========================================
    logic clk;
    logic rst_n;

    // ==========================================
    // 2. INTERFEJS ENKODERA
    // ==========================================
    logic       start_init_enc;
    logic       start_encode;
    logic [1:0] symbol_in_enc;
    logic       symbol_valid_enc;
    
    logic       bit_out_enc;
    logic       bit_valid_enc;
    logic       ready_enc;
    logic [8:0] final_state_enc;
    logic [32:0] bitstream_enc;

    // ==========================================
    // 3. INTERFEJS DEKODERA
    // ==========================================
    logic        start_init_dec;
    logic        start_decode;
    logic [15:0] data_length_dec;
    
    logic [1:0]  symbol_out_dec;
    logic        symbol_valid_dec;
    logic        ready_dec;

    // ==========================================
    // 4. STRUKTURY TESTOWE
    // ==========================================
    // Tablice do przechowywania oryginału i odkodowanych danych
    logic [1:0] original_data [];
    logic [1:0] decoded_data [$];

    // ==========================================
    // 5. INSTANCJONOWANIE MODU��W (DUT)
    // ==========================================
    tANS_encoder_fsm_256 #(.R(4), .L(256)) DUT_ENCODER (
        .clk(clk),
        .rst_n(rst_n),
        .start_init(start_init_enc),
        .start_encode(start_encode),
        .symbol_in(symbol_in_enc),
        .symbol_valid(symbol_valid_enc),
        .bit_out(bit_out_enc),
        .bit_valid(bit_valid_enc),
        .ready(ready_enc),
        .final_state(final_state_enc),
        .bitstream(bitstream_enc)
    );

    tANS_decoder_fsm_256 #(.R(4), .L(256)) DUT_DECODER (
        .clk(clk),
        .rst_n(rst_n),
        .start_init(start_init_dec),
        .start_decode(start_decode),
        .encoded_state(final_state_enc),
        .bitstream(bitstream_enc),
        .data_length(data_length_dec),
        .symbol_out(symbol_out_dec),
        .symbol_valid(symbol_valid_dec),
        .ready(ready_dec)
    );

    // ==========================================
    // 6. GENERATOR ZEGARA
    // ==========================================
    initial begin
        clk = 0;
        forever #5 clk = ~clk; // Zegar 100 MHz (okres 10 ns)
    end

    // Logowanie bitów z enkodera
    always_ff @(posedge clk) begin
        if (bit_valid_enc) begin
            $display("   [ENKODER] Wypchnal bit: %b", bit_out_enc);
        end
    end

    // Przechwytywanie zdekodowanych symboli
    always_ff @(posedge clk) begin
        if (symbol_valid_dec) begin
            decoded_data.push_back(symbol_out_dec);
            $display("   [DEKODER] Zdekodowal znak o wartosci: %0d", symbol_out_dec);
        end
    end

    // ==========================================
    // 7. G��WNY SCENARIUSZ TESTOWY
    // ==========================================
    initial begin
        $display("\n==============================================");
        $display("   START TESTU SYSTEMOWEGO tANS (L=256)");
        $display("==============================================\n");

        // Dane do przetestowania (0=A, 1=B, 2=C, 3=D)
        // Dla tANS LIFO, znaki odzyskaj� si� odwrotnie do podania!
        // Wi�c je�li podamy {0, 2, 1, 3}, powinni�my odzyska� {3, 1, 2, 0}.
        original_data = new[6];
        original_data = '{0, 2, 1, 3, 0, 0}; // {A, C, B, D, A, A}

        // Inicjalizacja sygna��w
        rst_n = 0;
        start_init_enc = 0; start_encode = 0; symbol_valid_enc = 0;
        start_init_dec = 0; start_decode = 0;
        #25 rst_n = 1;

        // --- FAZA 1: INICJALIZACJA ---
        $display("\n[Czas: %0t] Budowa tabel w obu modulach...", $time);
        @(negedge clk);
        start_init_enc = 1;
        start_init_dec = 1;
        @(negedge clk);
        start_init_enc = 0;
        start_init_dec = 0;

        // Czekamy na gotowo�� (Enkoder buduje 2 tablice, dekoder 1, wi�c czekamy na enkodera)
        wait(ready_enc && ready_dec);
        $display("[Czas: %0t] Moduly gotowe. Poczatek kompresji...", $time);

        // --- FAZA 2: ENKODOWANIE ---
        for (int i = 0; i < original_data.size(); i++) begin
            send_symbol_to_encoder(original_data[i]);
        end

        // Czekamy chwil� po ostatnim znaku na wypchni�cie resztek z FSM
        #50;
        wait(ready_enc);
        
        $display("\n[Czas: %0t] KOMPRESJA ZAKONCZONA.", $time);
        $display("Bitstream enkodera: %0d", bitstream_enc);
        $display("Stan koncowy do przekazania: %0d", final_state_enc);

        // --- FAZA 3: DEKODOWANIE ---
        $display("\n[Czas: %0t] Start dekompresji...", $time);
        @(negedge clk);
        data_length_dec = original_data.size();
        start_decode = 1;
        @(negedge clk);
        start_decode = 0;

        // Czekamy na zako�czenie dekompresji
        wait(ready_dec);
        $display("\n[Czas: %0t] DEKOMPRESJA ZAKONCZONA.", $time);

        // --- FAZA 4: WERYFIKACJA ---
        $display("\n==============================================");
        $display("WYNIKI TESTU WERYFIKACYJNEGO:");
        verify_results();
        $display("==============================================\n");

        $finish;
    end

    // ==========================================
    // 8. ZADANIA POMOCNICZE (TASKS)
    // ==========================================
    task send_symbol_to_encoder(input logic [1:0] sym);
        begin
            wait(ready_enc);
            @(negedge clk);
            symbol_in_enc = sym;
            symbol_valid_enc = 1;
            start_encode = 1;
            
            @(negedge clk);
            symbol_valid_enc = 0;
            start_encode = 0;
            
            wait(!ready_enc); // Czekamy a� uk�ad zajmie si� symbolem
        end
    endtask

    task verify_results();
        int errors = 0;
        int max_len = original_data.size();
        
        $write("Oryginal (wyslany)    : ");
        for(int i=0; i<max_len; i++) $write("%0d ", original_data[i]);
        $display("");
        
        $write("Odkodowany (odebrany) : ");
        // Kolejność odczytu jest odwrotna do kolejności wejściowej w tym tANS-owym dekoderze
        for(int i=0; i<max_len; i++) $write("%0d ", decoded_data[max_len-1-i]);
        $display("\n");
        
        // Pętla sprawdzająca
        for(int i=0; i<max_len; i++) begin
            if (original_data[i] !== decoded_data[max_len-1-i]) begin
                $display("Błąd na indeksie %0d: Oczekiwano %0d, otrzymano %0d", i, original_data[i], decoded_data[max_len-1-i]);
                errors++;
            end
        end
        
        if (errors == 0)
            $display("-> TEST ZALICZONY BEZBLEDNIE! (Bit-perfect match)");
        else
            $display("-> TEST OBLANY. Znaleziono %0d bledow.", errors);
    endtask

endmodule