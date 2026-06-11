`timescale 1ns / 1ps

module tans_axi_lite_wrapper #(
    parameter int SYMBOL_WIDTH      = 8,
    parameter int STATE_WIDTH       = 16,
    parameter int TABLE_ADDR_WIDTH  = 10,
    parameter int EMIT_BITS_WIDTH   = 8,

    // 0x0000-0x00FF: control/status registers
    // 0x1000-...   : tANS table, 32-bit word per entry
    parameter int C_S_AXI_DATA_WIDTH = 32,
    parameter int C_S_AXI_ADDR_WIDTH = 13
)(
    input  logic                              S_AXI_ACLK,
    input  logic                              S_AXI_ARESETN,

    input  logic [C_S_AXI_ADDR_WIDTH-1:0]     S_AXI_AWADDR,
    input  logic [2:0]                        S_AXI_AWPROT,
    input  logic                              S_AXI_AWVALID,
    output logic                              S_AXI_AWREADY,

    input  logic [C_S_AXI_DATA_WIDTH-1:0]     S_AXI_WDATA,
    input  logic [(C_S_AXI_DATA_WIDTH/8)-1:0] S_AXI_WSTRB,
    input  logic                              S_AXI_WVALID,
    output logic                              S_AXI_WREADY,

    output logic [1:0]                        S_AXI_BRESP,
    output logic                              S_AXI_BVALID,
    input  logic                              S_AXI_BREADY,

    input  logic [C_S_AXI_ADDR_WIDTH-1:0]     S_AXI_ARADDR,
    input  logic [2:0]                        S_AXI_ARPROT,
    input  logic                              S_AXI_ARVALID,
    output logic                              S_AXI_ARREADY,

    output logic [C_S_AXI_DATA_WIDTH-1:0]     S_AXI_RDATA,
    output logic [1:0]                        S_AXI_RRESP,
    output logic                              S_AXI_RVALID,
    input  logic                              S_AXI_RREADY
);

    localparam int TABLE_DEPTH = (1 << TABLE_ADDR_WIDTH);

    localparam logic [31:0] ADDR_CTRL        = 32'h0000_0000; // W: bit0=start pulse, bit1=clear done
    localparam logic [31:0] ADDR_STATUS      = 32'h0000_0004; // R: bit0=busy, bit1=done_sticky
    localparam logic [31:0] ADDR_SYMBOL      = 32'h0000_0008; // R/W
    localparam logic [31:0] ADDR_STATE_IN    = 32'h0000_000C; // R/W
    localparam logic [31:0] ADDR_STATE_OUT   = 32'h0000_0010; // R
    localparam logic [31:0] ADDR_BITS_OUT    = 32'h0000_0014; // R
    localparam logic [31:0] ADDR_NBITS_OUT   = 32'h0000_0018; // R
    localparam logic [31:0] ADDR_TABLE_ADDR  = 32'h0000_001C; // R, debug
    localparam logic [31:0] ADDR_TABLE_DATA  = 32'h0000_0020; // R, debug: currently selected table data

    localparam logic [31:0] TABLE_BASE_ADDR  = 32'h0000_1000;
    localparam logic [31:0] TABLE_BYTES      = TABLE_DEPTH * 4;

    // AXI response constants
    localparam logic [1:0] AXI_RESP_OKAY = 2'b00;

    logic [SYMBOL_WIDTH-1:0]     symbol_reg;
    logic [STATE_WIDTH-1:0]      state_in_reg;

    logic                        core_start;
    logic                        core_busy;
    logic                        core_done;
    logic [STATE_WIDTH-1:0]      core_state_out;
    logic [31:0]                 core_bits_out;
    logic [4:0]                  core_nbits_out;
    logic [TABLE_ADDR_WIDTH-1:0] core_table_addr;
    logic [31:0]                 core_table_data;
    logic                        done_sticky;

    logic [31:0] table_mem [0:TABLE_DEPTH-1];

    // Address decode helpers
    wire [31:0] wr_addr32 = {{(32-C_S_AXI_ADDR_WIDTH){1'b0}}, S_AXI_AWADDR};
    wire [31:0] rd_addr32 = {{(32-C_S_AXI_ADDR_WIDTH){1'b0}}, S_AXI_ARADDR};

    wire [31:0] wr_table_offset = wr_addr32 - TABLE_BASE_ADDR;
    wire [31:0] rd_table_offset = rd_addr32 - TABLE_BASE_ADDR;

    wire wr_table_sel = (wr_addr32 >= TABLE_BASE_ADDR) && (wr_addr32 < (TABLE_BASE_ADDR + TABLE_BYTES));
    wire rd_table_sel = (rd_addr32 >= TABLE_BASE_ADDR) && (rd_addr32 < (TABLE_BASE_ADDR + TABLE_BYTES));

    wire [TABLE_ADDR_WIDTH-1:0] wr_table_index = wr_table_offset[TABLE_ADDR_WIDTH+1:2];
    wire [TABLE_ADDR_WIDTH-1:0] rd_table_index = rd_table_offset[TABLE_ADDR_WIDTH+1:2];

    function automatic [31:0] apply_wstrb(
        input [31:0] old_data,
        input [31:0] new_data,
        input [3:0]  wstrb
    );
        int b;
        begin
            apply_wstrb = old_data;
            for (b = 0; b < 4; b++) begin
                if (wstrb[b]) begin
                    apply_wstrb[b*8 +: 8] = new_data[b*8 +: 8];
                end
            end
        end
    endfunction

    wire [31:0] symbol_wr_word = apply_wstrb(
        {{(32-SYMBOL_WIDTH){1'b0}}, symbol_reg},
        S_AXI_WDATA,
        S_AXI_WSTRB
    );

    wire [31:0] state_in_wr_word = apply_wstrb(
        {{(32-STATE_WIDTH){1'b0}}, state_in_reg},
        S_AXI_WDATA,
        S_AXI_WSTRB
    );

    // Core table read path. The existing core waits one cycle after setting table_addr,
    // so this registered read is compatible with BRAM-style latency.
    always_ff @(posedge S_AXI_ACLK) begin
        core_table_data <= table_mem[core_table_addr];
    end

    tans_encoder_core #(
        .SYMBOL_WIDTH(SYMBOL_WIDTH),
        .STATE_WIDTH(STATE_WIDTH),
        .TABLE_ADDR_WIDTH(TABLE_ADDR_WIDTH),
        .EMIT_BITS_WIDTH(EMIT_BITS_WIDTH)
    ) u_core (
        .clk        (S_AXI_ACLK),
        .rst_n      (S_AXI_ARESETN),
        .start      (core_start),
        .busy       (core_busy),
        .done       (core_done),
        .symbol     (symbol_reg),
        .state_in   (state_in_reg),
        .state_out  (core_state_out),
        .bits_out   (core_bits_out),
        .nbits_out  (core_nbits_out),
        .table_addr (core_table_addr),
        .table_data (core_table_data)
    );

    // Simple AXI-Lite write channel.
    // This version accepts AW and W in the same transaction window, which is the common Vivado template style.
    always_ff @(posedge S_AXI_ACLK) begin
        if (!S_AXI_ARESETN) begin
            S_AXI_AWREADY <= 1'b0;
            S_AXI_WREADY  <= 1'b0;
            S_AXI_BVALID  <= 1'b0;
            S_AXI_BRESP   <= AXI_RESP_OKAY;

            symbol_reg    <= '0;
            state_in_reg  <= '0;
            core_start    <= 1'b0;
            done_sticky   <= 1'b0;
        end else begin
            core_start    <= 1'b0;
            S_AXI_AWREADY <= 1'b0;
            S_AXI_WREADY  <= 1'b0;

            if (core_done) begin
                done_sticky <= 1'b1;
            end

            if (!S_AXI_BVALID && S_AXI_AWVALID && S_AXI_WVALID) begin
                S_AXI_AWREADY <= 1'b1;
                S_AXI_WREADY  <= 1'b1;
                S_AXI_BVALID  <= 1'b1;
                S_AXI_BRESP   <= AXI_RESP_OKAY;

                if (wr_table_sel) begin
                    table_mem[wr_table_index] <= apply_wstrb(
                        table_mem[wr_table_index],
                        S_AXI_WDATA,
                        S_AXI_WSTRB
                    );
                end else begin
                    unique case (wr_addr32)
                        ADDR_CTRL: begin
                            // bit0: start one operation, bit1: clear sticky done
                            if (S_AXI_WDATA[1]) begin
                                done_sticky <= 1'b0;
                            end
                            if (S_AXI_WDATA[0] && !core_busy) begin
                                core_start  <= 1'b1;
                                done_sticky <= 1'b0;
                            end
                        end

                        ADDR_SYMBOL: begin
                            symbol_reg <= symbol_wr_word[SYMBOL_WIDTH-1:0];
                        end

                        ADDR_STATE_IN: begin
                            state_in_reg <= state_in_wr_word[STATE_WIDTH-1:0];
                        end

                        default: begin
                            // Read-only or unmapped register: ignore writes, return OKAY.
                        end
                    endcase
                end
            end else if (S_AXI_BVALID && S_AXI_BREADY) begin
                S_AXI_BVALID <= 1'b0;
            end
        end
    end

    // Simple AXI-Lite read channel.
    always_ff @(posedge S_AXI_ACLK) begin
        if (!S_AXI_ARESETN) begin
            S_AXI_ARREADY <= 1'b0;
            S_AXI_RVALID  <= 1'b0;
            S_AXI_RRESP   <= AXI_RESP_OKAY;
            S_AXI_RDATA   <= '0;
        end else begin
            S_AXI_ARREADY <= 1'b0;

            if (!S_AXI_RVALID && S_AXI_ARVALID) begin
                S_AXI_ARREADY <= 1'b1;
                S_AXI_RVALID  <= 1'b1;
                S_AXI_RRESP   <= AXI_RESP_OKAY;

                if (rd_table_sel) begin
                    S_AXI_RDATA <= table_mem[rd_table_index];
                end else begin
                    unique case (rd_addr32)
                        ADDR_CTRL:       S_AXI_RDATA <= 32'h0000_0000;
                        ADDR_STATUS:     S_AXI_RDATA <= {30'd0, done_sticky, core_busy};
                        ADDR_SYMBOL:     S_AXI_RDATA <= {{(32-SYMBOL_WIDTH){1'b0}}, symbol_reg};
                        ADDR_STATE_IN:   S_AXI_RDATA <= {{(32-STATE_WIDTH){1'b0}}, state_in_reg};
                        ADDR_STATE_OUT:  S_AXI_RDATA <= {{(32-STATE_WIDTH){1'b0}}, core_state_out};
                        ADDR_BITS_OUT:   S_AXI_RDATA <= core_bits_out;
                        ADDR_NBITS_OUT:  S_AXI_RDATA <= {27'd0, core_nbits_out};
                        ADDR_TABLE_ADDR: S_AXI_RDATA <= {{(32-TABLE_ADDR_WIDTH){1'b0}}, core_table_addr};
                        ADDR_TABLE_DATA: S_AXI_RDATA <= core_table_data;
                        default:         S_AXI_RDATA <= 32'h0000_0000;
                    endcase
                end
            end else if (S_AXI_RVALID && S_AXI_RREADY) begin
                S_AXI_RVALID <= 1'b0;
            end
        end
    end

endmodule
