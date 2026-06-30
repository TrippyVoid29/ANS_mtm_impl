module automatic tANS_behavioral_tb;

  parameter int R = 4;
  parameter int L = 16;
  
  typedef enum logic [1:0] {A, B, C, D} symbol_t;
  

  symbol_t symbol_table[L];
  int      next_state[L];
  int      nb_bits[L];
  

  function void build_tables();
    int freq[symbol_t];
    int sum_freq = 0;
    symbol_t states[$]; 
    
    int buckets[symbol_t][$];
    int counters[symbol_t];
  

    freq[A] = int'(0.500 * L);
    freq[B] = int'(0.250 * L);
    freq[C] = int'(0.125 * L);
    freq[D] = int'(0.125 * L);
    
    sum_freq = freq[A] + freq[B] + freq[C] + freq[D];
    while(sum_freq < L) begin
      freq[A]++;
      sum_freq++;
    end
    
    for(int i=0; i<freq[A]; i++) states.push_back(A);
    for(int i=0; i<freq[B]; i++) states.push_back(B);
    for(int i=0; i<freq[C]; i++) states.push_back(C);
    for(int i=0; i<freq[D]; i++) states.push_back(D);
    
    for(int i=0; i<L; i++) begin
      symbol_table[i] = states[i];
    end
    
    counters[A] = 0; counters[B] = 0; counters[C] = 0; counters[D] = 0;
    
    for(int i=0; i<L; i++) begin
      buckets[symbol_table[i]].push_back(i);
    end
    
    for(int i=0; i<L; i++) begin
      symbol_t s = symbol_table[i];
      int j = counters[s];
      counters[s]++;
      
      next_state[i] = buckets[s][j % buckets[s].size()] + L / 2;
      
      nb_bits[i] = ($clog2(L) - 1 > 0) ? $clog2(L) - 1 : 0;
    end
  endfunction

  // -------------------------
  // ENCODER
  // -------------------------
  function void tANS_encode(
    input  symbol_t data[],
    output int      out_state,
    output int      bitstream[$]
  );
    int state = L;
    int states_for_symbol[$];
    int state_idx;
    
    bitstream.delete(); 
    
    foreach(data[i]) begin
      symbol_t symbol = data[i];
      states_for_symbol.delete();
      

      for(int k=0; k<L; k++) begin
        if (symbol_table[k] == symbol) begin
          states_for_symbol.push_back(k);
        end
      end
      
      state_idx = states_for_symbol[state % states_for_symbol.size()];
      
      while (state >= (1 << (nb_bits[state_idx] + 1))) begin
        bitstream.push_back(state & 1);
        state = state >> 1;
      end
      
      state = next_state[state_idx];
    end
    
    out_state = state;
  endfunction

  // -------------------------
  // DECODER
  // -------------------------
  function void tANS_decode(
    input  int      start_state,
    input  int      bitstream[$],
    input  int      length_data,
    output symbol_t output_data[]
  );
    int state = start_state;
    int bit_val;

    int local_bitstream[$] = bitstream; 
    
    output_data = new[length_data];
    
    for(int i=0; i<length_data; i++) begin
      symbol_t symbol = symbol_table[state % L];
      output_data[i] = symbol;
      
      while (state < (1 << nb_bits[state % L]) && local_bitstream.size() > 0) begin
        bit_val = local_bitstream.pop_front();
        state = (state << 1) | bit_val;
      end
      
      state = next_state[state % L];
    end
  endfunction

  // -------------------------
  // (TESTBENCH)
  // -------------------------
  initial begin

    symbol_t data[] = '{A, C, B, D, A, A};
    symbol_t decoded[];
    int final_state;
    int bits[$];
    
    $display("=== Symulacja behawioralna algorytmu tANS ===");
    
    // init
    build_tables();
    
    // encode
    tANS_encode(data, final_state, bits);
    
    // decode
    tANS_decode(final_state, bits, data.size(), decoded);
    
    // -------------------------
    // printing in console
    // -------------------------
    $write("Original : ");
    foreach(data[i]) $write("%s ", data[i].name());
    $display("");
    
    $write("Decoded  : ");
    foreach(decoded[i]) $write("%s ", decoded[i].name());
    $display("");
    
    $write("Bitstream: [");
    foreach(bits[i]) begin
      $write("%0d", bits[i]);
      if(i < bits.size()-1) $write(", ");
    end
    $display("]");
    
    $display("Final state: %0d", final_state);
    $display("=============================================");
    
    $finish;
  end

endmodule