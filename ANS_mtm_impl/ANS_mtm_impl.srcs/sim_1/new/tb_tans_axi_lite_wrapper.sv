`timescale 1ns / 1ps

module tb_tans_axi_lite_wrapper;

    localparam int SYMBOL_WIDTH      = 8;
    localparam int STATE_WIDTH       = 16;
    localparam int TABLE_ADDR_WIDTH  = 10;
    localparam int EMIT_BITS_WIDTH   = 8;
    localparam int AXI_DATA_WIDTH    = 32;
    localparam int AXI_ADDR_WIDTH    = 13;

    localparam logic [AXI_ADDR_WIDTH-1:0] ADDR_CTRL       = 13'h0000;
    localparam logic [AXI_ADDR_WIDTH-1:0] ADDR_STATUS     = 13'h0004;
    localparam logic [AXI_ADDR_WIDTH-1:0] ADDR_SYMBOL     = 13'h0008;
    localparam logic [AXI_ADDR_WIDTH-1:0] ADDR_STATE_IN   = 13'h000C;
    localparam logic [AXI_ADDR_WIDTH-1:0] ADDR_STATE_OUT  = 13'h0010;
    localparam logic [AXI_ADDR_WIDTH-1:0] ADDR_BITS_OUT   = 13'h0014;
    localparam logic [AXI_ADDR_WIDTH-1:0] ADDR_NBITS_OUT  = 13'h0018;
    localparam logic [AXI_ADDR_WIDTH-1:0] TABLE_BASE      = 13'h1000;

    logic clk;
    logic rst_n;

    logic [AXI_ADDR_WIDTH-1:0]     s_axi_awaddr;
    logic [2:0]                    s_axi_awprot;
    logic                          s_axi_awvalid;
    logic                          s_axi_awready;
    logic [AXI_DATA_WIDTH-1:0]     s_axi_wdata;
    logic [(AXI_DATA_WIDTH/8)-1:0] s_axi_wstrb;
    logic                          s_axi_wvalid;
    logic                          s_axi_wready;
    logic [1:0]                    s_axi_bresp;
    logic                          s_axi_bvalid;
    logic                          s_axi_bready;
    logic [AXI_ADDR_WIDTH-1:0]     s_axi_araddr;
    logic [2:0]                    s_axi_arprot;
    logic                          s_axi_arvalid;
    logic                          s_axi_arready;
    logic [AXI_DATA_WIDTH-1:0]     s_axi_rdata;
    logic [1:0]                    s_axi_rresp;
    logic                          s_axi_rvalid;
    logic                          s_axi_rready;

    tans_axi_lite_wrapper #(
        .SYMBOL_WIDTH(SYMBOL_WIDTH),
        .STATE_WIDTH(STATE_WIDTH),
        .TABLE_ADDR_WIDTH(TABLE_ADDR_WIDTH),
        .EMIT_BITS_WIDTH(EMIT_BITS_WIDTH),
        .C_S_AXI_DATA_WIDTH(AXI_DATA_WIDTH),
        .C_S_AXI_ADDR_WIDTH(AXI_ADDR_WIDTH)
    ) dut (
        .S_AXI_ACLK    (clk),
        .S_AXI_ARESETN (rst_n),
        .S_AXI_AWADDR  (s_axi_awaddr),
        .S_AXI_AWPROT  (s_axi_awprot),
        .S_AXI_AWVALID (s_axi_awvalid),
        .S_AXI_AWREADY (s_axi_awready),
        .S_AXI_WDATA   (s_axi_wdata),
        .S_AXI_WSTRB   (s_axi_wstrb),
        .S_AXI_WVALID  (s_axi_wvalid),
        .S_AXI_WREADY  (s_axi_wready),
        .S_AXI_BRESP   (s_axi_bresp),
        .S_AXI_BVALID  (s_axi_bvalid),
        .S_AXI_BREADY  (s_axi_bready),
        .S_AXI_ARADDR  (s_axi_araddr),
        .S_AXI_ARPROT  (s_axi_arprot),
        .S_AXI_ARVALID (s_axi_arvalid),
        .S_AXI_ARREADY (s_axi_arready),
        .S_AXI_RDATA   (s_axi_rdata),
        .S_AXI_RRESP   (s_axi_rresp),
        .S_AXI_RVALID  (s_axi_rvalid),
        .S_AXI_RREADY  (s_axi_rready)
    );

    always #5 clk = ~clk;

    task automatic axi_write(input [AXI_ADDR_WIDTH-1:0] addr, input [31:0] data);
        begin
            @(negedge clk);
            s_axi_awaddr  = addr;
            s_axi_awvalid = 1'b1;
            s_axi_wdata   = data;
            s_axi_wstrb   = 4'hF;
            s_axi_wvalid  = 1'b1;
            s_axi_bready  = 1'b1;

            wait (s_axi_awready && s_axi_wready);
            @(negedge clk);
            s_axi_awvalid = 1'b0;
            s_axi_wvalid  = 1'b0;

            wait (s_axi_bvalid);
            @(negedge clk);
            s_axi_bready  = 1'b0;
        end
    endtask

    task automatic axi_read(input [AXI_ADDR_WIDTH-1:0] addr, output [31:0] data);
        begin
            @(negedge clk);
            s_axi_araddr  = addr;
            s_axi_arvalid = 1'b1;
            s_axi_rready  = 1'b1;

            wait (s_axi_arready);
            @(negedge clk);
            s_axi_arvalid = 1'b0;

            wait (s_axi_rvalid);
            data = s_axi_rdata;
            @(negedge clk);
            s_axi_rready = 1'b0;
        end
    endtask

    initial begin
        logic [31:0] rd;
        logic [AXI_ADDR_WIDTH-1:0] table_addr;
        int unsigned table_index;

        clk = 1'b0;
        rst_n = 1'b0;

        s_axi_awaddr  = '0;
        s_axi_awprot  = 3'b000;
        s_axi_awvalid = 1'b0;
        s_axi_wdata   = '0;
        s_axi_wstrb   = 4'h0;
        s_axi_wvalid  = 1'b0;
        s_axi_bready  = 1'b0;
        s_axi_araddr  = '0;
        s_axi_arprot  = 3'b000;
        s_axi_arvalid = 1'b0;
        s_axi_rready  = 1'b0;

        repeat (5) @(posedge clk);
        rst_n = 1'b1;
        repeat (2) @(posedge clk);

        // symbol = 65 ('A'), state_in = 100 => state_in[1:0] = 2'b00
        // table index = {8'd65, 2'b00} = 260, AXI address = 0x1000 + 260*4 = 0x1410
        table_index = {8'd65, 2'b00};
        table_addr  = TABLE_BASE + (table_index << 2);

        axi_write(table_addr, {16'd1234, 8'b10101010, 3'b000, 5'd4});
        axi_write(ADDR_SYMBOL,   32'd65);
        axi_write(ADDR_STATE_IN, 32'd100);
        axi_write(ADDR_CTRL,     32'h0000_0001); // start

        do begin
            axi_read(ADDR_STATUS, rd);
        end while (rd[1] == 1'b0); // wait done_sticky

        axi_read(ADDR_STATE_OUT, rd);
        if (rd[15:0] !== 16'd1234) $error("wrong STATE_OUT: %0d", rd[15:0]);

        axi_read(ADDR_BITS_OUT, rd);
        if (rd[7:0] !== 8'b10101010) $error("wrong BITS_OUT: %b", rd[7:0]);

        axi_read(ADDR_NBITS_OUT, rd);
        if (rd[4:0] !== 5'd4) $error("wrong NBITS_OUT: %0d", rd[4:0]);

        $display("TEST PASSED: AXI-Lite wrapper works for one tANS step.");
        #50;
        $finish;
    end

endmodule
