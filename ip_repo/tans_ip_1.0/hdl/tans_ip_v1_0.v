
`timescale 1 ns / 1 ps

	module tans_ip_v1_0 #
	(
		// Users to add parameters here

		// User parameters ends
		// Do not modify the parameters beyond this line


		// Parameters of Axi Slave Bus Interface S00_AXI
		parameter integer C_S00_AXI_DATA_WIDTH	= 32,
		parameter integer C_S00_AXI_ADDR_WIDTH	= 4
	)
	(
		// Users to add ports here
input  wire        start_init,
input  wire        start_encode,
input  wire        start_decode,
input  wire [1:0]  symbol_in,
input  wire        symbol_valid,
		// User ports ends
		// Do not modify the ports beyond this line


		// Ports of Axi Slave Bus Interface S00_AXI
		input wire  s00_axi_aclk,
		input wire  s00_axi_aresetn,
		input wire [C_S00_AXI_ADDR_WIDTH-1 : 0] s00_axi_awaddr,
		input wire [2 : 0] s00_axi_awprot,
		input wire  s00_axi_awvalid,
		output wire  s00_axi_awready,
		input wire [C_S00_AXI_DATA_WIDTH-1 : 0] s00_axi_wdata,
		input wire [(C_S00_AXI_DATA_WIDTH/8)-1 : 0] s00_axi_wstrb,
		input wire  s00_axi_wvalid,
		output wire  s00_axi_wready,
		output wire [1 : 0] s00_axi_bresp,
		output wire  s00_axi_bvalid,
		input wire  s00_axi_bready,
		input wire [C_S00_AXI_ADDR_WIDTH-1 : 0] s00_axi_araddr,
		input wire [2 : 0] s00_axi_arprot,
		input wire  s00_axi_arvalid,
		output wire  s00_axi_arready,
		output wire [C_S00_AXI_DATA_WIDTH-1 : 0] s00_axi_rdata,
		output wire [1 : 0] s00_axi_rresp,
		output wire  s00_axi_rvalid,
		input wire  s00_axi_rready
	);
// Instantiation of Axi Bus Interface S00_AXI
	tans_ip_v1_0_S00_AXI # ( 
		.C_S_AXI_DATA_WIDTH(C_S00_AXI_DATA_WIDTH),
		.C_S_AXI_ADDR_WIDTH(C_S00_AXI_ADDR_WIDTH)
	) tans_ip_v1_0_S00_AXI_inst (
		.S_AXI_ACLK(s00_axi_aclk),
		.S_AXI_ARESETN(s00_axi_aresetn),
		.S_AXI_AWADDR(s00_axi_awaddr),
		.S_AXI_AWPROT(s00_axi_awprot),
		.S_AXI_AWVALID(s00_axi_awvalid),
		.S_AXI_AWREADY(s00_axi_awready),
		.S_AXI_WDATA(s00_axi_wdata),
		.S_AXI_WSTRB(s00_axi_wstrb),
		.S_AXI_WVALID(s00_axi_wvalid),
		.S_AXI_WREADY(s00_axi_wready),
		.S_AXI_BRESP(s00_axi_bresp),
		.S_AXI_BVALID(s00_axi_bvalid),
		.S_AXI_BREADY(s00_axi_bready),
		.S_AXI_ARADDR(s00_axi_araddr),
		.S_AXI_ARPROT(s00_axi_arprot),
		.S_AXI_ARVALID(s00_axi_arvalid),
		.S_AXI_ARREADY(s00_axi_arready),
		.S_AXI_RDATA(s00_axi_rdata),
		.S_AXI_RRESP(s00_axi_rresp),
		.S_AXI_RVALID(s00_axi_rvalid),
		.S_AXI_RREADY(s00_axi_rready)
	);

	// Add user logic here
// ================= ENCODER =================
wire        enc_bit_out;
wire        enc_bit_valid;
wire        enc_ready;
wire [8:0]  enc_final_state;
wire [32:0] enc_bitstream;

// ================= DECODER =================
wire [1:0]  dec_symbol_out;
wire        dec_symbol_valid;
wire        dec_ready;

// ENCODER
tANS_encoder_fsm_256 #(
    .R(4),
    .L(256)
) encoder_inst (
    .clk(s00_axi_aclk),
    .rst_n(s00_axi_aresetn),

    .start_init(start_init),
    .start_encode(start_encode),
    .symbol_in(symbol_in),
    .symbol_valid(symbol_valid),

    .bit_out(enc_bit_out),
    .bit_valid(enc_bit_valid),
    .ready(enc_ready),
    .final_state(enc_final_state),
    .bitstream(enc_bitstream)
);

// DECODER
tANS_decoder_fsm_256 #(
    .R(4),
    .L(256)
) decoder_inst (
    .clk(s00_axi_aclk),
    .rst_n(s00_axi_aresetn),

    .start_init(start_init),
    .start_decode(start_decode),
    .encoded_state(enc_final_state),
    .bitstream(enc_bitstream),
    .data_length(16'd256),

    .symbol_out(dec_symbol_out),
    .symbol_valid(dec_symbol_valid),
    .ready(dec_ready)
);
	// User logic ends

	endmodule
