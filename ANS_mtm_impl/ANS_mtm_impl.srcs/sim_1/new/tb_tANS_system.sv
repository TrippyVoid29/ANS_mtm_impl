`timescale 1ns / 1ps

module tb_tANS_system;

    // ==========================================
    // 1. SYGNA£Y GLOBALNE
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

    // ==========================================
    // 3. INTERFEJS DEKODERA
    // ==========================================
    logic        start_init_dec;
    logic        start_decode;
    logic [8:0]  start_state_dec;
    logic [15:0] data_length_dec;
    
    logic        pop_bit_dec;
    logic        bit_in_dec;
    logic        lifo_empty_dec;
    
    logic [1:0]  symbol_out_dec;
    logic        symbol_valid_dec;
    logic        ready_dec;

    // ==========================================
    // 4. STRUKTURY TESTOWE (WIRTUALNA PAMIÊÆ)
    // ==========================================
    // LIFO (Last-In-First-Out) do przechowywania skompresowanych bitów
    logic bitstream_lifo [$]; 
    
    // Tablice do przechowywania orygina³u i odkodowanych danych
    logic [1:0] original_data [];
    logic [1:0] decoded_data [$];

    // ==========================================
    // 5. INSTANCJONOWANIE MODU£ÓW (DUT)
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
        .final_state(final_state_enc)
    );

    tANS_decoder_fsm_256 #(.R(4), .L(256)) DUT_DECODER (
        .clk(clk),
        .rst_n(rst_n),
        .start_init(start_init_dec),
        .start_decode(start_decode),
        .start_state(start_state_dec),
        .data_length(data_length_dec),
        .pop_bit(pop_bit_dec),
        .bit_in(bit_in_dec),
        .lifo_empty(lifo_empty_dec),
        .symbol_out(symbol_out_dec),
        .symbol_valid(symbol_valid_dec),
        .ready(ready_dec)
    );

    // ==========================================
    // 6. GENERATOR ZEGARA I LOGIKA PAMIÊCI LIFO
    // ==========================================
    initial begin
        clk = 0;
        forever #5 clk = ~clk; // Zegar 100 MHz (okres 10 ns)
    end

    // Nagrywanie bitów z enkodera (Push)
    always_ff @(posedge clk) begin
        if (bit_valid_enc) begin
            bitstream_lifo.push_back(bit_out_enc);
            $display("   [ENKODER] Wypchnal bit: %b", bit_out_enc);
        end
    end

    // Wydawanie bitów do dekodera (Pop)
    // U¿ywamy zbocza opadaj¹cego, aby unikn¹æ hazardu (Race Condition) ze stanem FSM
    always_ff @(negedge clk) begin
        if (pop_bit_dec) begin
            if (bitstream_lifo.size() > 0) begin
                bit_in_dec <= bitstream_lifo.pop_back();
                $display("   [DEKODER] Pobral bit. LIFO zmalalo do: %0d", bitstream_lifo.size());
            end else begin
                $display("   [!!! ERROR !!!] Dekoder zada bitu z pustego LIFO!");
            end
        end
    end
    
    // Asynchroniczna flaga pustoœci LIFO
    assign lifo_empty_dec = (bitstream_lifo.size() == 0);

    // Przechwytywanie zdekodowanych symboli
    always_ff @(posedge clk) begin
        if (symbol_valid_dec) begin
            decoded_data.push_back(symbol_out_dec);
            $display("   [DEKODER] Zdekodowal znak o wartosci: %0d", symbol_out_dec);
        end
    end

    // ==========================================
    // 7. G£ÓWNY SCENARIUSZ TESTOWY
    // ==========================================
    initial begin
        $display("\n==============================================");
        $display("   START TESTU SYSTEMOWEGO tANS (L=256)");
        $display("==============================================\n");

        // Dane do przetestowania (0=A, 1=B, 2=C, 3=D)
        // Dla tANS LIFO, znaki odzyskaj¹ siê odwrotnie do podania!
        // Wiêc jeœli podamy {0, 2, 1, 3}, powinniœmy odzyskaæ {3, 1, 2, 0}.
        original_data = new[6];
        original_data = '{0, 2, 1, 3, 0, 0}; // {A, C, B, D, A, A}

        // Inicjalizacja sygna³ów
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

        // Czekamy na gotowoœæ (Enkoder buduje 2 tablice, dekoder 1, wiêc czekamy na enkodera)
        wait(ready_enc && ready_dec);
        $display("[Czas: %0t] Moduly gotowe. Poczatek kompresji...", $time);

        // --- FAZA 2: ENKODOWANIE ---
        for (int i = 0; i < original_data.size(); i++) begin
            send_symbol_to_encoder(original_data[i]);
        end

        // Czekamy chwilê po ostatnim znaku na wypchniêcie resztek z FSM
        #50;
        wait(ready_enc);
        
        $display("\n[Czas: %0t] KOMPRESJA ZAKONCZONA.", $time);
        $display("Rozmiar LIFO: %0d bitow.", bitstream_lifo.size());
        $display("Stan koncowy do przekazania: %0d", final_state_enc);

        // --- FAZA 3: DEKODOWANIE ---
        $display("\n[Czas: %0t] Start dekompresji...", $time);
        @(negedge clk);
        start_state_dec = final_state_enc;
        data_length_dec = original_data.size();
        start_decode = 1;
        @(negedge clk);
        start_decode = 0;

        // Czekamy na zakoñczenie dekompresji
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
            
            wait(!ready_enc); // Czekamy a¿ uk³ad zajmie siê symbolem
        end
    endtask

    task verify_results();
        int errors = 0;
        int max_len = original_data.size();
        
        $write("Oryginal (wyslany)    : ");
        for(int i=0; i<max_len; i++) $write("%0d ", original_data[i]);
        $display("");
        
        $write("Odkodowany (odebrany) : ");
        // Wyœwietlamy odebrane bity (nale¿y pamiêtaæ o naturze LIFO tANS - bity wracaj¹ od ty³u!)
        for(int i=0; i<max_len; i++) $write("%0d ", decoded_data[max_len-1-i]);
        $display("\n");
        
        // Pêtla sprawdzaj¹ca
        for(int i=0; i<max_len; i++) begin
            if (original_data[i] !== decoded_data[max_len-1-i]) begin
                $display("B³¹d na indeksie %0d: Oczekiwano %0d, otrzymano %0d", i, original_data[i], decoded_data[max_len-1-i]);
                errors++;
            end
        end
        
        if (errors == 0)
            $display("-> TEST ZALICZONY BEZBLEDNIE! (Bit-perfect match)");
        else
            $display("-> TEST OBLANY. Znaleziono %0d bledow.", errors);
    endtask

endmodule