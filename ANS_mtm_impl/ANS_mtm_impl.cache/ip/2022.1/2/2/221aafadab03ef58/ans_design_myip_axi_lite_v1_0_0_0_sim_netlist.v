// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2022.1 (win64) Build 3526262 Mon Apr 18 15:48:16 MDT 2022
// Date        : Thu Jun 11 16:13:34 2026
// Host        : DESKTOP-223A9C1 running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode funcsim -rename_top decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix -prefix
//               decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_ ans_design_myip_axi_lite_v1_0_0_0_sim_netlist.v
// Design      : ans_design_myip_axi_lite_v1_0_0_0
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7z010clg400-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "ans_design_myip_axi_lite_v1_0_0_0,myip_axi_lite_v1_0,{}" *) (* DowngradeIPIdentifiedWarnings = "yes" *) (* IP_DEFINITION_SOURCE = "package_project" *) 
(* X_CORE_INFO = "myip_axi_lite_v1_0,Vivado 2022.1" *) 
(* NotValidForBitStream *)
module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix
   (s00_axi_aclk,
    s00_axi_aresetn,
    s00_axi_awaddr,
    s00_axi_awprot,
    s00_axi_awvalid,
    s00_axi_awready,
    s00_axi_wdata,
    s00_axi_wstrb,
    s00_axi_wvalid,
    s00_axi_wready,
    s00_axi_bresp,
    s00_axi_bvalid,
    s00_axi_bready,
    s00_axi_araddr,
    s00_axi_arprot,
    s00_axi_arvalid,
    s00_axi_arready,
    s00_axi_rdata,
    s00_axi_rresp,
    s00_axi_rvalid,
    s00_axi_rready);
  (* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 s00_axi_aclk CLK" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME s00_axi_aclk, ASSOCIATED_BUSIF s00_axi, ASSOCIATED_RESET s00_axi_aresetn, FREQ_HZ 100000000, FREQ_TOLERANCE_HZ 0, PHASE 0.0, CLK_DOMAIN ans_design_processing_system7_0_0_FCLK_CLK0, INSERT_VIP 0" *) input s00_axi_aclk;
  (* X_INTERFACE_INFO = "xilinx.com:signal:reset:1.0 s00_axi_aresetn RST" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME s00_axi_aresetn, POLARITY ACTIVE_LOW, INSERT_VIP 0" *) input s00_axi_aresetn;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s00_axi AWADDR" *) input [3:0]s00_axi_awaddr;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s00_axi AWPROT" *) input [2:0]s00_axi_awprot;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s00_axi AWVALID" *) input s00_axi_awvalid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s00_axi AWREADY" *) output s00_axi_awready;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s00_axi WDATA" *) input [31:0]s00_axi_wdata;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s00_axi WSTRB" *) input [3:0]s00_axi_wstrb;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s00_axi WVALID" *) input s00_axi_wvalid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s00_axi WREADY" *) output s00_axi_wready;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s00_axi BRESP" *) output [1:0]s00_axi_bresp;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s00_axi BVALID" *) output s00_axi_bvalid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s00_axi BREADY" *) input s00_axi_bready;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s00_axi ARADDR" *) input [3:0]s00_axi_araddr;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s00_axi ARPROT" *) input [2:0]s00_axi_arprot;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s00_axi ARVALID" *) input s00_axi_arvalid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s00_axi ARREADY" *) output s00_axi_arready;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s00_axi RDATA" *) output [31:0]s00_axi_rdata;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s00_axi RRESP" *) output [1:0]s00_axi_rresp;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s00_axi RVALID" *) output s00_axi_rvalid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s00_axi RREADY" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME s00_axi, DATA_WIDTH 32, PROTOCOL AXI4LITE, FREQ_HZ 100000000, ID_WIDTH 0, ADDR_WIDTH 4, AWUSER_WIDTH 0, ARUSER_WIDTH 0, WUSER_WIDTH 0, RUSER_WIDTH 0, BUSER_WIDTH 0, READ_WRITE_MODE READ_WRITE, HAS_BURST 0, HAS_LOCK 0, HAS_PROT 1, HAS_CACHE 0, HAS_QOS 0, HAS_REGION 0, HAS_WSTRB 1, HAS_BRESP 1, HAS_RRESP 1, SUPPORTS_NARROW_BURST 0, NUM_READ_OUTSTANDING 8, NUM_WRITE_OUTSTANDING 8, MAX_BURST_LENGTH 1, PHASE 0.0, CLK_DOMAIN ans_design_processing_system7_0_0_FCLK_CLK0, NUM_READ_THREADS 4, NUM_WRITE_THREADS 4, RUSER_BITS_PER_BYTE 0, WUSER_BITS_PER_BYTE 0, INSERT_VIP 0" *) input s00_axi_rready;

  wire \<const0> ;
  wire s00_axi_aclk;
  wire [3:0]s00_axi_araddr;
  wire s00_axi_aresetn;
  wire s00_axi_arready;
  wire s00_axi_arvalid;
  wire [3:0]s00_axi_awaddr;
  wire s00_axi_awvalid;
  wire s00_axi_bready;
  wire s00_axi_bvalid;
  wire [15:0]\^s00_axi_rdata ;
  wire s00_axi_rready;
  wire s00_axi_rvalid;
  wire [31:0]s00_axi_wdata;
  wire s00_axi_wready;
  wire [3:0]s00_axi_wstrb;
  wire s00_axi_wvalid;

  assign s00_axi_awready = s00_axi_wready;
  assign s00_axi_bresp[1] = \<const0> ;
  assign s00_axi_bresp[0] = \<const0> ;
  assign s00_axi_rdata[31] = \<const0> ;
  assign s00_axi_rdata[30] = \<const0> ;
  assign s00_axi_rdata[29] = \<const0> ;
  assign s00_axi_rdata[28] = \<const0> ;
  assign s00_axi_rdata[27] = \<const0> ;
  assign s00_axi_rdata[26] = \<const0> ;
  assign s00_axi_rdata[25] = \<const0> ;
  assign s00_axi_rdata[24] = \<const0> ;
  assign s00_axi_rdata[23] = \<const0> ;
  assign s00_axi_rdata[22] = \<const0> ;
  assign s00_axi_rdata[21] = \<const0> ;
  assign s00_axi_rdata[20] = \<const0> ;
  assign s00_axi_rdata[19] = \<const0> ;
  assign s00_axi_rdata[18] = \<const0> ;
  assign s00_axi_rdata[17] = \<const0> ;
  assign s00_axi_rdata[16] = \<const0> ;
  assign s00_axi_rdata[15:0] = \^s00_axi_rdata [15:0];
  assign s00_axi_rresp[1] = \<const0> ;
  assign s00_axi_rresp[0] = \<const0> ;
  GND GND
       (.G(\<const0> ));
  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_myip_axi_lite_v1_0 inst
       (.S_AXI_BVALID_reg(s00_axi_bvalid),
        .s00_axi_aclk(s00_axi_aclk),
        .s00_axi_araddr(s00_axi_araddr),
        .s00_axi_aresetn(s00_axi_aresetn),
        .s00_axi_arready(s00_axi_arready),
        .s00_axi_arvalid(s00_axi_arvalid),
        .s00_axi_awaddr(s00_axi_awaddr),
        .s00_axi_awvalid(s00_axi_awvalid),
        .s00_axi_bready(s00_axi_bready),
        .s00_axi_rdata(\^s00_axi_rdata ),
        .s00_axi_rready(s00_axi_rready),
        .s00_axi_rvalid(s00_axi_rvalid),
        .s00_axi_wdata(s00_axi_wdata[15:0]),
        .s00_axi_wready(s00_axi_wready),
        .s00_axi_wstrb(s00_axi_wstrb[1:0]),
        .s00_axi_wvalid(s00_axi_wvalid));
endmodule

module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_myip_axi_lite_v1_0
   (s00_axi_wready,
    s00_axi_arready,
    s00_axi_rdata,
    S_AXI_BVALID_reg,
    s00_axi_rvalid,
    s00_axi_aclk,
    s00_axi_wdata,
    s00_axi_wstrb,
    s00_axi_awaddr,
    s00_axi_aresetn,
    s00_axi_awvalid,
    s00_axi_wvalid,
    s00_axi_araddr,
    s00_axi_arvalid,
    s00_axi_bready,
    s00_axi_rready);
  output s00_axi_wready;
  output s00_axi_arready;
  output [15:0]s00_axi_rdata;
  output S_AXI_BVALID_reg;
  output s00_axi_rvalid;
  input s00_axi_aclk;
  input [15:0]s00_axi_wdata;
  input [1:0]s00_axi_wstrb;
  input [3:0]s00_axi_awaddr;
  input s00_axi_aresetn;
  input s00_axi_awvalid;
  input s00_axi_wvalid;
  input [3:0]s00_axi_araddr;
  input s00_axi_arvalid;
  input s00_axi_bready;
  input s00_axi_rready;

  wire S_AXI_BVALID_reg;
  wire s00_axi_aclk;
  wire [3:0]s00_axi_araddr;
  wire s00_axi_aresetn;
  wire s00_axi_arready;
  wire s00_axi_arvalid;
  wire [3:0]s00_axi_awaddr;
  wire s00_axi_awvalid;
  wire s00_axi_bready;
  wire [15:0]s00_axi_rdata;
  wire s00_axi_rready;
  wire s00_axi_rvalid;
  wire [15:0]s00_axi_wdata;
  wire s00_axi_wready;
  wire [1:0]s00_axi_wstrb;
  wire s00_axi_wvalid;

  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_myip_axi_lite_v1_0_S00_AXI myip_axi_lite_v1_0_S00_AXI_inst
       (.S_AXI_BVALID_reg_0(S_AXI_BVALID_reg),
        .s00_axi_aclk(s00_axi_aclk),
        .s00_axi_araddr(s00_axi_araddr),
        .s00_axi_aresetn(s00_axi_aresetn),
        .s00_axi_arready(s00_axi_arready),
        .s00_axi_arvalid(s00_axi_arvalid),
        .s00_axi_awaddr(s00_axi_awaddr),
        .s00_axi_awvalid(s00_axi_awvalid),
        .s00_axi_bready(s00_axi_bready),
        .s00_axi_rdata(s00_axi_rdata),
        .s00_axi_rready(s00_axi_rready),
        .s00_axi_rvalid(s00_axi_rvalid),
        .s00_axi_wdata(s00_axi_wdata),
        .s00_axi_wready(s00_axi_wready),
        .s00_axi_wstrb(s00_axi_wstrb),
        .s00_axi_wvalid(s00_axi_wvalid));
endmodule

module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_myip_axi_lite_v1_0_S00_AXI
   (s00_axi_wready,
    s00_axi_arready,
    s00_axi_rdata,
    S_AXI_BVALID_reg_0,
    s00_axi_rvalid,
    s00_axi_aclk,
    s00_axi_wdata,
    s00_axi_wstrb,
    s00_axi_awaddr,
    s00_axi_aresetn,
    s00_axi_awvalid,
    s00_axi_wvalid,
    s00_axi_araddr,
    s00_axi_arvalid,
    s00_axi_bready,
    s00_axi_rready);
  output s00_axi_wready;
  output s00_axi_arready;
  output [15:0]s00_axi_rdata;
  output S_AXI_BVALID_reg_0;
  output s00_axi_rvalid;
  input s00_axi_aclk;
  input [15:0]s00_axi_wdata;
  input [1:0]s00_axi_wstrb;
  input [3:0]s00_axi_awaddr;
  input s00_axi_aresetn;
  input s00_axi_awvalid;
  input s00_axi_wvalid;
  input [3:0]s00_axi_araddr;
  input s00_axi_arvalid;
  input s00_axi_bready;
  input s00_axi_rready;

  wire S_AXI_ARREADY0;
  wire S_AXI_AWREADY0;
  wire S_AXI_BVALID_i_1_n_0;
  wire S_AXI_BVALID_reg_0;
  wire \S_AXI_RDATA[10]_i_1_n_0 ;
  wire \S_AXI_RDATA[11]_i_1_n_0 ;
  wire \S_AXI_RDATA[12]_i_1_n_0 ;
  wire \S_AXI_RDATA[13]_i_1_n_0 ;
  wire \S_AXI_RDATA[14]_i_1_n_0 ;
  wire \S_AXI_RDATA[15]_i_1_n_0 ;
  wire \S_AXI_RDATA[1]_i_1_n_0 ;
  wire \S_AXI_RDATA[1]_i_2_n_0 ;
  wire \S_AXI_RDATA[2]_i_1_n_0 ;
  wire \S_AXI_RDATA[3]_i_1_n_0 ;
  wire \S_AXI_RDATA[4]_i_1_n_0 ;
  wire \S_AXI_RDATA[5]_i_1_n_0 ;
  wire \S_AXI_RDATA[6]_i_1_n_0 ;
  wire \S_AXI_RDATA[7]_i_1_n_0 ;
  wire \S_AXI_RDATA[8]_i_1_n_0 ;
  wire \S_AXI_RDATA[9]_i_1_n_0 ;
  wire S_AXI_RVALID_i_1_n_0;
  wire core_start;
  wire done_sticky;
  wire done_sticky_i_3_n_0;
  wire p_0_in;
  wire [7:7]p_1_in;
  wire s00_axi_aclk;
  wire [3:0]s00_axi_araddr;
  wire s00_axi_aresetn;
  wire s00_axi_arready;
  wire s00_axi_arvalid;
  wire [3:0]s00_axi_awaddr;
  wire s00_axi_awvalid;
  wire s00_axi_bready;
  wire [15:0]s00_axi_rdata;
  wire s00_axi_rready;
  wire s00_axi_rvalid;
  wire [15:0]s00_axi_wdata;
  wire s00_axi_wready;
  wire [1:0]s00_axi_wstrb;
  wire s00_axi_wvalid;
  wire [15:0]state_in_reg;
  wire \state_in_reg[15]_i_1_n_0 ;
  wire \state_in_reg[7]_i_1_n_0 ;
  wire [7:0]symbol_reg;
  wire \symbol_reg[7]_i_2_n_0 ;
  wire u_core_n_1;
  wire u_core_n_2;
  wire u_core_n_3;

  LUT2 #(
    .INIT(4'h2)) 
    S_AXI_ARREADY_i_1
       (.I0(s00_axi_arvalid),
        .I1(s00_axi_rvalid),
        .O(S_AXI_ARREADY0));
  FDRE S_AXI_ARREADY_reg
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .D(S_AXI_ARREADY0),
        .Q(s00_axi_arready),
        .R(p_0_in));
  (* SOFT_HLUTNM = "soft_lutpair1" *) 
  LUT3 #(
    .INIT(8'h20)) 
    S_AXI_AWREADY_i_2
       (.I0(s00_axi_wvalid),
        .I1(S_AXI_BVALID_reg_0),
        .I2(s00_axi_awvalid),
        .O(S_AXI_AWREADY0));
  FDRE S_AXI_AWREADY_reg
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .D(S_AXI_AWREADY0),
        .Q(s00_axi_wready),
        .R(p_0_in));
  LUT4 #(
    .INIT(16'h5C50)) 
    S_AXI_BVALID_i_1
       (.I0(s00_axi_bready),
        .I1(s00_axi_wvalid),
        .I2(S_AXI_BVALID_reg_0),
        .I3(s00_axi_awvalid),
        .O(S_AXI_BVALID_i_1_n_0));
  FDRE S_AXI_BVALID_reg
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .D(S_AXI_BVALID_i_1_n_0),
        .Q(S_AXI_BVALID_reg_0),
        .R(p_0_in));
  LUT5 #(
    .INIT(32'h02000000)) 
    \S_AXI_RDATA[10]_i_1 
       (.I0(s00_axi_araddr[2]),
        .I1(s00_axi_araddr[1]),
        .I2(s00_axi_araddr[0]),
        .I3(s00_axi_araddr[3]),
        .I4(state_in_reg[10]),
        .O(\S_AXI_RDATA[10]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'h02000000)) 
    \S_AXI_RDATA[11]_i_1 
       (.I0(s00_axi_araddr[2]),
        .I1(s00_axi_araddr[1]),
        .I2(s00_axi_araddr[0]),
        .I3(s00_axi_araddr[3]),
        .I4(state_in_reg[11]),
        .O(\S_AXI_RDATA[11]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'h02000000)) 
    \S_AXI_RDATA[12]_i_1 
       (.I0(s00_axi_araddr[2]),
        .I1(s00_axi_araddr[1]),
        .I2(s00_axi_araddr[0]),
        .I3(s00_axi_araddr[3]),
        .I4(state_in_reg[12]),
        .O(\S_AXI_RDATA[12]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'h02000000)) 
    \S_AXI_RDATA[13]_i_1 
       (.I0(s00_axi_araddr[2]),
        .I1(s00_axi_araddr[1]),
        .I2(s00_axi_araddr[0]),
        .I3(s00_axi_araddr[3]),
        .I4(state_in_reg[13]),
        .O(\S_AXI_RDATA[13]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'h02000000)) 
    \S_AXI_RDATA[14]_i_1 
       (.I0(s00_axi_araddr[2]),
        .I1(s00_axi_araddr[1]),
        .I2(s00_axi_araddr[0]),
        .I3(s00_axi_araddr[3]),
        .I4(state_in_reg[14]),
        .O(\S_AXI_RDATA[14]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'h02000000)) 
    \S_AXI_RDATA[15]_i_1 
       (.I0(s00_axi_araddr[2]),
        .I1(s00_axi_araddr[1]),
        .I2(s00_axi_araddr[0]),
        .I3(s00_axi_araddr[3]),
        .I4(state_in_reg[15]),
        .O(\S_AXI_RDATA[15]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hBBC0000088C00000)) 
    \S_AXI_RDATA[1]_i_1 
       (.I0(state_in_reg[1]),
        .I1(s00_axi_araddr[2]),
        .I2(done_sticky),
        .I3(s00_axi_araddr[3]),
        .I4(\S_AXI_RDATA[1]_i_2_n_0 ),
        .I5(symbol_reg[1]),
        .O(\S_AXI_RDATA[1]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair2" *) 
  LUT2 #(
    .INIT(4'h1)) 
    \S_AXI_RDATA[1]_i_2 
       (.I0(s00_axi_araddr[0]),
        .I1(s00_axi_araddr[1]),
        .O(\S_AXI_RDATA[1]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h000000A0000000C0)) 
    \S_AXI_RDATA[2]_i_1 
       (.I0(state_in_reg[2]),
        .I1(symbol_reg[2]),
        .I2(s00_axi_araddr[3]),
        .I3(s00_axi_araddr[0]),
        .I4(s00_axi_araddr[1]),
        .I5(s00_axi_araddr[2]),
        .O(\S_AXI_RDATA[2]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h000000A0000000C0)) 
    \S_AXI_RDATA[3]_i_1 
       (.I0(state_in_reg[3]),
        .I1(symbol_reg[3]),
        .I2(s00_axi_araddr[3]),
        .I3(s00_axi_araddr[0]),
        .I4(s00_axi_araddr[1]),
        .I5(s00_axi_araddr[2]),
        .O(\S_AXI_RDATA[3]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h000000A0000000C0)) 
    \S_AXI_RDATA[4]_i_1 
       (.I0(state_in_reg[4]),
        .I1(symbol_reg[4]),
        .I2(s00_axi_araddr[3]),
        .I3(s00_axi_araddr[0]),
        .I4(s00_axi_araddr[1]),
        .I5(s00_axi_araddr[2]),
        .O(\S_AXI_RDATA[4]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h000000A0000000C0)) 
    \S_AXI_RDATA[5]_i_1 
       (.I0(state_in_reg[5]),
        .I1(symbol_reg[5]),
        .I2(s00_axi_araddr[3]),
        .I3(s00_axi_araddr[0]),
        .I4(s00_axi_araddr[1]),
        .I5(s00_axi_araddr[2]),
        .O(\S_AXI_RDATA[5]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h000000A0000000C0)) 
    \S_AXI_RDATA[6]_i_1 
       (.I0(state_in_reg[6]),
        .I1(symbol_reg[6]),
        .I2(s00_axi_araddr[3]),
        .I3(s00_axi_araddr[0]),
        .I4(s00_axi_araddr[1]),
        .I5(s00_axi_araddr[2]),
        .O(\S_AXI_RDATA[6]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h000000A0000000C0)) 
    \S_AXI_RDATA[7]_i_1 
       (.I0(state_in_reg[7]),
        .I1(symbol_reg[7]),
        .I2(s00_axi_araddr[3]),
        .I3(s00_axi_araddr[0]),
        .I4(s00_axi_araddr[1]),
        .I5(s00_axi_araddr[2]),
        .O(\S_AXI_RDATA[7]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair2" *) 
  LUT5 #(
    .INIT(32'h02000000)) 
    \S_AXI_RDATA[8]_i_1 
       (.I0(s00_axi_araddr[2]),
        .I1(s00_axi_araddr[1]),
        .I2(s00_axi_araddr[0]),
        .I3(s00_axi_araddr[3]),
        .I4(state_in_reg[8]),
        .O(\S_AXI_RDATA[8]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'h02000000)) 
    \S_AXI_RDATA[9]_i_1 
       (.I0(s00_axi_araddr[2]),
        .I1(s00_axi_araddr[1]),
        .I2(s00_axi_araddr[0]),
        .I3(s00_axi_araddr[3]),
        .I4(state_in_reg[9]),
        .O(\S_AXI_RDATA[9]_i_1_n_0 ));
  FDRE \S_AXI_RDATA_reg[0] 
       (.C(s00_axi_aclk),
        .CE(S_AXI_ARREADY0),
        .D(u_core_n_2),
        .Q(s00_axi_rdata[0]),
        .R(p_0_in));
  FDRE \S_AXI_RDATA_reg[10] 
       (.C(s00_axi_aclk),
        .CE(S_AXI_ARREADY0),
        .D(\S_AXI_RDATA[10]_i_1_n_0 ),
        .Q(s00_axi_rdata[10]),
        .R(p_0_in));
  FDRE \S_AXI_RDATA_reg[11] 
       (.C(s00_axi_aclk),
        .CE(S_AXI_ARREADY0),
        .D(\S_AXI_RDATA[11]_i_1_n_0 ),
        .Q(s00_axi_rdata[11]),
        .R(p_0_in));
  FDRE \S_AXI_RDATA_reg[12] 
       (.C(s00_axi_aclk),
        .CE(S_AXI_ARREADY0),
        .D(\S_AXI_RDATA[12]_i_1_n_0 ),
        .Q(s00_axi_rdata[12]),
        .R(p_0_in));
  FDRE \S_AXI_RDATA_reg[13] 
       (.C(s00_axi_aclk),
        .CE(S_AXI_ARREADY0),
        .D(\S_AXI_RDATA[13]_i_1_n_0 ),
        .Q(s00_axi_rdata[13]),
        .R(p_0_in));
  FDRE \S_AXI_RDATA_reg[14] 
       (.C(s00_axi_aclk),
        .CE(S_AXI_ARREADY0),
        .D(\S_AXI_RDATA[14]_i_1_n_0 ),
        .Q(s00_axi_rdata[14]),
        .R(p_0_in));
  FDRE \S_AXI_RDATA_reg[15] 
       (.C(s00_axi_aclk),
        .CE(S_AXI_ARREADY0),
        .D(\S_AXI_RDATA[15]_i_1_n_0 ),
        .Q(s00_axi_rdata[15]),
        .R(p_0_in));
  FDRE \S_AXI_RDATA_reg[1] 
       (.C(s00_axi_aclk),
        .CE(S_AXI_ARREADY0),
        .D(\S_AXI_RDATA[1]_i_1_n_0 ),
        .Q(s00_axi_rdata[1]),
        .R(p_0_in));
  FDRE \S_AXI_RDATA_reg[2] 
       (.C(s00_axi_aclk),
        .CE(S_AXI_ARREADY0),
        .D(\S_AXI_RDATA[2]_i_1_n_0 ),
        .Q(s00_axi_rdata[2]),
        .R(p_0_in));
  FDRE \S_AXI_RDATA_reg[3] 
       (.C(s00_axi_aclk),
        .CE(S_AXI_ARREADY0),
        .D(\S_AXI_RDATA[3]_i_1_n_0 ),
        .Q(s00_axi_rdata[3]),
        .R(p_0_in));
  FDRE \S_AXI_RDATA_reg[4] 
       (.C(s00_axi_aclk),
        .CE(S_AXI_ARREADY0),
        .D(\S_AXI_RDATA[4]_i_1_n_0 ),
        .Q(s00_axi_rdata[4]),
        .R(p_0_in));
  FDRE \S_AXI_RDATA_reg[5] 
       (.C(s00_axi_aclk),
        .CE(S_AXI_ARREADY0),
        .D(\S_AXI_RDATA[5]_i_1_n_0 ),
        .Q(s00_axi_rdata[5]),
        .R(p_0_in));
  FDRE \S_AXI_RDATA_reg[6] 
       (.C(s00_axi_aclk),
        .CE(S_AXI_ARREADY0),
        .D(\S_AXI_RDATA[6]_i_1_n_0 ),
        .Q(s00_axi_rdata[6]),
        .R(p_0_in));
  FDRE \S_AXI_RDATA_reg[7] 
       (.C(s00_axi_aclk),
        .CE(S_AXI_ARREADY0),
        .D(\S_AXI_RDATA[7]_i_1_n_0 ),
        .Q(s00_axi_rdata[7]),
        .R(p_0_in));
  FDRE \S_AXI_RDATA_reg[8] 
       (.C(s00_axi_aclk),
        .CE(S_AXI_ARREADY0),
        .D(\S_AXI_RDATA[8]_i_1_n_0 ),
        .Q(s00_axi_rdata[8]),
        .R(p_0_in));
  FDRE \S_AXI_RDATA_reg[9] 
       (.C(s00_axi_aclk),
        .CE(S_AXI_ARREADY0),
        .D(\S_AXI_RDATA[9]_i_1_n_0 ),
        .Q(s00_axi_rdata[9]),
        .R(p_0_in));
  LUT3 #(
    .INIT(8'h3A)) 
    S_AXI_RVALID_i_1
       (.I0(s00_axi_arvalid),
        .I1(s00_axi_rready),
        .I2(s00_axi_rvalid),
        .O(S_AXI_RVALID_i_1_n_0));
  FDRE S_AXI_RVALID_reg
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .D(S_AXI_RVALID_i_1_n_0),
        .Q(s00_axi_rvalid),
        .R(p_0_in));
  FDRE core_start_reg
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .D(u_core_n_1),
        .Q(core_start),
        .R(1'b0));
  LUT6 #(
    .INIT(64'hFFFFFFFFFFFFFFDF)) 
    done_sticky_i_3
       (.I0(s00_axi_awvalid),
        .I1(S_AXI_BVALID_reg_0),
        .I2(s00_axi_wvalid),
        .I3(s00_axi_awaddr[0]),
        .I4(s00_axi_awaddr[1]),
        .I5(s00_axi_awaddr[2]),
        .O(done_sticky_i_3_n_0));
  FDRE done_sticky_reg
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .D(u_core_n_3),
        .Q(done_sticky),
        .R(p_0_in));
  LUT4 #(
    .INIT(16'h0080)) 
    \state_in_reg[15]_i_1 
       (.I0(s00_axi_wstrb[1]),
        .I1(s00_axi_awaddr[2]),
        .I2(s00_axi_awaddr[3]),
        .I3(\symbol_reg[7]_i_2_n_0 ),
        .O(\state_in_reg[15]_i_1_n_0 ));
  LUT4 #(
    .INIT(16'h0080)) 
    \state_in_reg[7]_i_1 
       (.I0(s00_axi_wstrb[0]),
        .I1(s00_axi_awaddr[2]),
        .I2(s00_axi_awaddr[3]),
        .I3(\symbol_reg[7]_i_2_n_0 ),
        .O(\state_in_reg[7]_i_1_n_0 ));
  FDRE \state_in_reg_reg[0] 
       (.C(s00_axi_aclk),
        .CE(\state_in_reg[7]_i_1_n_0 ),
        .D(s00_axi_wdata[0]),
        .Q(state_in_reg[0]),
        .R(p_0_in));
  FDRE \state_in_reg_reg[10] 
       (.C(s00_axi_aclk),
        .CE(\state_in_reg[15]_i_1_n_0 ),
        .D(s00_axi_wdata[10]),
        .Q(state_in_reg[10]),
        .R(p_0_in));
  FDRE \state_in_reg_reg[11] 
       (.C(s00_axi_aclk),
        .CE(\state_in_reg[15]_i_1_n_0 ),
        .D(s00_axi_wdata[11]),
        .Q(state_in_reg[11]),
        .R(p_0_in));
  FDRE \state_in_reg_reg[12] 
       (.C(s00_axi_aclk),
        .CE(\state_in_reg[15]_i_1_n_0 ),
        .D(s00_axi_wdata[12]),
        .Q(state_in_reg[12]),
        .R(p_0_in));
  FDRE \state_in_reg_reg[13] 
       (.C(s00_axi_aclk),
        .CE(\state_in_reg[15]_i_1_n_0 ),
        .D(s00_axi_wdata[13]),
        .Q(state_in_reg[13]),
        .R(p_0_in));
  FDRE \state_in_reg_reg[14] 
       (.C(s00_axi_aclk),
        .CE(\state_in_reg[15]_i_1_n_0 ),
        .D(s00_axi_wdata[14]),
        .Q(state_in_reg[14]),
        .R(p_0_in));
  FDRE \state_in_reg_reg[15] 
       (.C(s00_axi_aclk),
        .CE(\state_in_reg[15]_i_1_n_0 ),
        .D(s00_axi_wdata[15]),
        .Q(state_in_reg[15]),
        .R(p_0_in));
  FDRE \state_in_reg_reg[1] 
       (.C(s00_axi_aclk),
        .CE(\state_in_reg[7]_i_1_n_0 ),
        .D(s00_axi_wdata[1]),
        .Q(state_in_reg[1]),
        .R(p_0_in));
  FDRE \state_in_reg_reg[2] 
       (.C(s00_axi_aclk),
        .CE(\state_in_reg[7]_i_1_n_0 ),
        .D(s00_axi_wdata[2]),
        .Q(state_in_reg[2]),
        .R(p_0_in));
  FDRE \state_in_reg_reg[3] 
       (.C(s00_axi_aclk),
        .CE(\state_in_reg[7]_i_1_n_0 ),
        .D(s00_axi_wdata[3]),
        .Q(state_in_reg[3]),
        .R(p_0_in));
  FDRE \state_in_reg_reg[4] 
       (.C(s00_axi_aclk),
        .CE(\state_in_reg[7]_i_1_n_0 ),
        .D(s00_axi_wdata[4]),
        .Q(state_in_reg[4]),
        .R(p_0_in));
  FDRE \state_in_reg_reg[5] 
       (.C(s00_axi_aclk),
        .CE(\state_in_reg[7]_i_1_n_0 ),
        .D(s00_axi_wdata[5]),
        .Q(state_in_reg[5]),
        .R(p_0_in));
  FDRE \state_in_reg_reg[6] 
       (.C(s00_axi_aclk),
        .CE(\state_in_reg[7]_i_1_n_0 ),
        .D(s00_axi_wdata[6]),
        .Q(state_in_reg[6]),
        .R(p_0_in));
  FDRE \state_in_reg_reg[7] 
       (.C(s00_axi_aclk),
        .CE(\state_in_reg[7]_i_1_n_0 ),
        .D(s00_axi_wdata[7]),
        .Q(state_in_reg[7]),
        .R(p_0_in));
  FDRE \state_in_reg_reg[8] 
       (.C(s00_axi_aclk),
        .CE(\state_in_reg[15]_i_1_n_0 ),
        .D(s00_axi_wdata[8]),
        .Q(state_in_reg[8]),
        .R(p_0_in));
  FDRE \state_in_reg_reg[9] 
       (.C(s00_axi_aclk),
        .CE(\state_in_reg[15]_i_1_n_0 ),
        .D(s00_axi_wdata[9]),
        .Q(state_in_reg[9]),
        .R(p_0_in));
  LUT4 #(
    .INIT(16'h0008)) 
    \symbol_reg[7]_i_1 
       (.I0(s00_axi_awaddr[3]),
        .I1(s00_axi_wstrb[0]),
        .I2(s00_axi_awaddr[2]),
        .I3(\symbol_reg[7]_i_2_n_0 ),
        .O(p_1_in));
  (* SOFT_HLUTNM = "soft_lutpair1" *) 
  LUT5 #(
    .INIT(32'hFFEFFFFF)) 
    \symbol_reg[7]_i_2 
       (.I0(s00_axi_awaddr[1]),
        .I1(s00_axi_awaddr[0]),
        .I2(s00_axi_wvalid),
        .I3(S_AXI_BVALID_reg_0),
        .I4(s00_axi_awvalid),
        .O(\symbol_reg[7]_i_2_n_0 ));
  FDRE \symbol_reg_reg[0] 
       (.C(s00_axi_aclk),
        .CE(p_1_in),
        .D(s00_axi_wdata[0]),
        .Q(symbol_reg[0]),
        .R(p_0_in));
  FDRE \symbol_reg_reg[1] 
       (.C(s00_axi_aclk),
        .CE(p_1_in),
        .D(s00_axi_wdata[1]),
        .Q(symbol_reg[1]),
        .R(p_0_in));
  FDRE \symbol_reg_reg[2] 
       (.C(s00_axi_aclk),
        .CE(p_1_in),
        .D(s00_axi_wdata[2]),
        .Q(symbol_reg[2]),
        .R(p_0_in));
  FDRE \symbol_reg_reg[3] 
       (.C(s00_axi_aclk),
        .CE(p_1_in),
        .D(s00_axi_wdata[3]),
        .Q(symbol_reg[3]),
        .R(p_0_in));
  FDRE \symbol_reg_reg[4] 
       (.C(s00_axi_aclk),
        .CE(p_1_in),
        .D(s00_axi_wdata[4]),
        .Q(symbol_reg[4]),
        .R(p_0_in));
  FDRE \symbol_reg_reg[5] 
       (.C(s00_axi_aclk),
        .CE(p_1_in),
        .D(s00_axi_wdata[5]),
        .Q(symbol_reg[5]),
        .R(p_0_in));
  FDRE \symbol_reg_reg[6] 
       (.C(s00_axi_aclk),
        .CE(p_1_in),
        .D(s00_axi_wdata[6]),
        .Q(symbol_reg[6]),
        .R(p_0_in));
  FDRE \symbol_reg_reg[7] 
       (.C(s00_axi_aclk),
        .CE(p_1_in),
        .D(s00_axi_wdata[7]),
        .Q(symbol_reg[7]),
        .R(p_0_in));
  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_tans_encoder_core u_core
       (.D(u_core_n_2),
        .Q(state_in_reg[0]),
        .\S_AXI_RDATA_reg[0] (\S_AXI_RDATA[1]_i_2_n_0 ),
        .\S_AXI_RDATA_reg[0]_0 (symbol_reg[0]),
        .busy_reg_0(u_core_n_1),
        .core_start(core_start),
        .core_start_reg(\symbol_reg[7]_i_2_n_0 ),
        .done_reg_0(u_core_n_3),
        .done_sticky(done_sticky),
        .done_sticky_reg(done_sticky_i_3_n_0),
        .p_0_in(p_0_in),
        .s00_axi_aclk(s00_axi_aclk),
        .s00_axi_araddr(s00_axi_araddr[3:2]),
        .s00_axi_aresetn(s00_axi_aresetn),
        .s00_axi_awaddr(s00_axi_awaddr[3:2]),
        .s00_axi_wdata(s00_axi_wdata[1:0]));
endmodule

module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_tans_encoder_core
   (p_0_in,
    busy_reg_0,
    D,
    done_reg_0,
    s00_axi_aclk,
    s00_axi_wdata,
    s00_axi_aresetn,
    s00_axi_awaddr,
    core_start_reg,
    Q,
    s00_axi_araddr,
    \S_AXI_RDATA_reg[0] ,
    \S_AXI_RDATA_reg[0]_0 ,
    core_start,
    done_sticky_reg,
    done_sticky);
  output p_0_in;
  output busy_reg_0;
  output [0:0]D;
  output done_reg_0;
  input s00_axi_aclk;
  input [1:0]s00_axi_wdata;
  input s00_axi_aresetn;
  input [1:0]s00_axi_awaddr;
  input core_start_reg;
  input [0:0]Q;
  input [1:0]s00_axi_araddr;
  input \S_AXI_RDATA_reg[0] ;
  input [0:0]\S_AXI_RDATA_reg[0]_0 ;
  input core_start;
  input done_sticky_reg;
  input done_sticky;

  wire \/i__n_0 ;
  wire [0:0]D;
  wire \FSM_onehot_current_state_reg_n_0_[0] ;
  wire \FSM_onehot_current_state_reg_n_0_[1] ;
  wire \FSM_onehot_current_state_reg_n_0_[2] ;
  wire \FSM_onehot_current_state_reg_n_0_[3] ;
  wire \FSM_onehot_current_state_reg_n_0_[4] ;
  wire [0:0]Q;
  wire \S_AXI_RDATA_reg[0] ;
  wire [0:0]\S_AXI_RDATA_reg[0]_0 ;
  wire busy_i_1_n_0;
  wire busy_reg_0;
  wire core_busy;
  wire core_done;
  wire core_start;
  wire core_start_reg;
  wire done_i_1_n_0;
  wire done_reg_0;
  wire done_sticky;
  wire done_sticky_i_2_n_0;
  wire done_sticky_reg;
  wire p_0_in;
  wire s00_axi_aclk;
  wire [1:0]s00_axi_araddr;
  wire s00_axi_aresetn;
  wire [1:0]s00_axi_awaddr;
  wire [1:0]s00_axi_wdata;

  LUT6 #(
    .INIT(64'hFFFFFFFFFFFFFEEE)) 
    \/i_ 
       (.I0(\FSM_onehot_current_state_reg_n_0_[4] ),
        .I1(\FSM_onehot_current_state_reg_n_0_[1] ),
        .I2(core_start),
        .I3(\FSM_onehot_current_state_reg_n_0_[0] ),
        .I4(\FSM_onehot_current_state_reg_n_0_[3] ),
        .I5(\FSM_onehot_current_state_reg_n_0_[2] ),
        .O(\/i__n_0 ));
  (* FSM_ENCODED_STATES = "IDLE:00001,SET_ADDR:00010,TABLE_LOOKUP:00100,UPDATE_OUTPUTS:01000,FINISH:10000," *) 
  FDPE #(
    .INIT(1'b1)) 
    \FSM_onehot_current_state_reg[0] 
       (.C(s00_axi_aclk),
        .CE(\/i__n_0 ),
        .D(\FSM_onehot_current_state_reg_n_0_[4] ),
        .PRE(p_0_in),
        .Q(\FSM_onehot_current_state_reg_n_0_[0] ));
  (* FSM_ENCODED_STATES = "IDLE:00001,SET_ADDR:00010,TABLE_LOOKUP:00100,UPDATE_OUTPUTS:01000,FINISH:10000," *) 
  FDCE #(
    .INIT(1'b0)) 
    \FSM_onehot_current_state_reg[1] 
       (.C(s00_axi_aclk),
        .CE(\/i__n_0 ),
        .CLR(p_0_in),
        .D(\FSM_onehot_current_state_reg_n_0_[0] ),
        .Q(\FSM_onehot_current_state_reg_n_0_[1] ));
  (* FSM_ENCODED_STATES = "IDLE:00001,SET_ADDR:00010,TABLE_LOOKUP:00100,UPDATE_OUTPUTS:01000,FINISH:10000," *) 
  FDCE #(
    .INIT(1'b0)) 
    \FSM_onehot_current_state_reg[2] 
       (.C(s00_axi_aclk),
        .CE(\/i__n_0 ),
        .CLR(p_0_in),
        .D(\FSM_onehot_current_state_reg_n_0_[1] ),
        .Q(\FSM_onehot_current_state_reg_n_0_[2] ));
  (* FSM_ENCODED_STATES = "IDLE:00001,SET_ADDR:00010,TABLE_LOOKUP:00100,UPDATE_OUTPUTS:01000,FINISH:10000," *) 
  FDCE #(
    .INIT(1'b0)) 
    \FSM_onehot_current_state_reg[3] 
       (.C(s00_axi_aclk),
        .CE(\/i__n_0 ),
        .CLR(p_0_in),
        .D(\FSM_onehot_current_state_reg_n_0_[2] ),
        .Q(\FSM_onehot_current_state_reg_n_0_[3] ));
  (* FSM_ENCODED_STATES = "IDLE:00001,SET_ADDR:00010,TABLE_LOOKUP:00100,UPDATE_OUTPUTS:01000,FINISH:10000," *) 
  FDCE #(
    .INIT(1'b0)) 
    \FSM_onehot_current_state_reg[4] 
       (.C(s00_axi_aclk),
        .CE(\/i__n_0 ),
        .CLR(p_0_in),
        .D(\FSM_onehot_current_state_reg_n_0_[3] ),
        .Q(\FSM_onehot_current_state_reg_n_0_[4] ));
  LUT1 #(
    .INIT(2'h1)) 
    S_AXI_AWREADY_i_1
       (.I0(s00_axi_aresetn),
        .O(p_0_in));
  LUT6 #(
    .INIT(64'hBBC0000088C00000)) 
    \S_AXI_RDATA[0]_i_1 
       (.I0(Q),
        .I1(s00_axi_araddr[0]),
        .I2(core_busy),
        .I3(s00_axi_araddr[1]),
        .I4(\S_AXI_RDATA_reg[0] ),
        .I5(\S_AXI_RDATA_reg[0]_0 ),
        .O(D));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT4 #(
    .INIT(16'h8B88)) 
    busy_i_1
       (.I0(core_start),
        .I1(\FSM_onehot_current_state_reg_n_0_[0] ),
        .I2(\FSM_onehot_current_state_reg_n_0_[4] ),
        .I3(core_busy),
        .O(busy_i_1_n_0));
  FDCE busy_reg
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .CLR(p_0_in),
        .D(busy_i_1_n_0),
        .Q(core_busy));
  LUT6 #(
    .INIT(64'h0000000000000040)) 
    core_start_i_1
       (.I0(core_busy),
        .I1(s00_axi_wdata[0]),
        .I2(s00_axi_aresetn),
        .I3(s00_axi_awaddr[1]),
        .I4(core_start_reg),
        .I5(s00_axi_awaddr[0]),
        .O(busy_reg_0));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT3 #(
    .INIT(8'hDC)) 
    done_i_1
       (.I0(\FSM_onehot_current_state_reg_n_0_[0] ),
        .I1(\FSM_onehot_current_state_reg_n_0_[4] ),
        .I2(core_done),
        .O(done_i_1_n_0));
  FDCE done_reg
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .CLR(p_0_in),
        .D(done_i_1_n_0),
        .Q(core_done));
  LUT6 #(
    .INIT(64'hFFFFFF30AAAAAA20)) 
    done_sticky_i_1
       (.I0(core_done),
        .I1(s00_axi_wdata[1]),
        .I2(done_sticky_i_2_n_0),
        .I3(done_sticky_reg),
        .I4(s00_axi_awaddr[1]),
        .I5(done_sticky),
        .O(done_reg_0));
  LUT2 #(
    .INIT(4'hB)) 
    done_sticky_i_2
       (.I0(core_busy),
        .I1(s00_axi_wdata[0]),
        .O(done_sticky_i_2_n_0));
endmodule
`ifndef GLBL
`define GLBL
`timescale  1 ps / 1 ps

module glbl ();

    parameter ROC_WIDTH = 100000;
    parameter TOC_WIDTH = 0;
    parameter GRES_WIDTH = 10000;
    parameter GRES_START = 10000;

//--------   STARTUP Globals --------------
    wire GSR;
    wire GTS;
    wire GWE;
    wire PRLD;
    wire GRESTORE;
    tri1 p_up_tmp;
    tri (weak1, strong0) PLL_LOCKG = p_up_tmp;

    wire PROGB_GLBL;
    wire CCLKO_GLBL;
    wire FCSBO_GLBL;
    wire [3:0] DO_GLBL;
    wire [3:0] DI_GLBL;
   
    reg GSR_int;
    reg GTS_int;
    reg PRLD_int;
    reg GRESTORE_int;

//--------   JTAG Globals --------------
    wire JTAG_TDO_GLBL;
    wire JTAG_TCK_GLBL;
    wire JTAG_TDI_GLBL;
    wire JTAG_TMS_GLBL;
    wire JTAG_TRST_GLBL;

    reg JTAG_CAPTURE_GLBL;
    reg JTAG_RESET_GLBL;
    reg JTAG_SHIFT_GLBL;
    reg JTAG_UPDATE_GLBL;
    reg JTAG_RUNTEST_GLBL;

    reg JTAG_SEL1_GLBL = 0;
    reg JTAG_SEL2_GLBL = 0 ;
    reg JTAG_SEL3_GLBL = 0;
    reg JTAG_SEL4_GLBL = 0;

    reg JTAG_USER_TDO1_GLBL = 1'bz;
    reg JTAG_USER_TDO2_GLBL = 1'bz;
    reg JTAG_USER_TDO3_GLBL = 1'bz;
    reg JTAG_USER_TDO4_GLBL = 1'bz;

    assign (strong1, weak0) GSR = GSR_int;
    assign (strong1, weak0) GTS = GTS_int;
    assign (weak1, weak0) PRLD = PRLD_int;
    assign (strong1, weak0) GRESTORE = GRESTORE_int;

    initial begin
	GSR_int = 1'b1;
	PRLD_int = 1'b1;
	#(ROC_WIDTH)
	GSR_int = 1'b0;
	PRLD_int = 1'b0;
    end

    initial begin
	GTS_int = 1'b1;
	#(TOC_WIDTH)
	GTS_int = 1'b0;
    end

    initial begin 
	GRESTORE_int = 1'b0;
	#(GRES_START);
	GRESTORE_int = 1'b1;
	#(GRES_WIDTH);
	GRESTORE_int = 1'b0;
    end

endmodule
`endif
