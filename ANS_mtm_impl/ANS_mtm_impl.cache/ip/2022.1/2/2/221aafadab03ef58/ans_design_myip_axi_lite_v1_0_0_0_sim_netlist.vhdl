-- Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2022.1 (win64) Build 3526262 Mon Apr 18 15:48:16 MDT 2022
-- Date        : Thu Jun 11 16:13:34 2026
-- Host        : DESKTOP-223A9C1 running 64-bit major release  (build 9200)
-- Command     : write_vhdl -force -mode funcsim -rename_top decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix -prefix
--               decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_ ans_design_myip_axi_lite_v1_0_0_0_sim_netlist.vhdl
-- Design      : ans_design_myip_axi_lite_v1_0_0_0
-- Purpose     : This VHDL netlist is a functional simulation representation of the design and should not be modified or
--               synthesized. This netlist cannot be used for SDF annotated simulation.
-- Device      : xc7z010clg400-1
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_tans_encoder_core is
  port (
    p_0_in : out STD_LOGIC;
    busy_reg_0 : out STD_LOGIC;
    D : out STD_LOGIC_VECTOR ( 0 to 0 );
    done_reg_0 : out STD_LOGIC;
    s00_axi_aclk : in STD_LOGIC;
    s00_axi_wdata : in STD_LOGIC_VECTOR ( 1 downto 0 );
    s00_axi_aresetn : in STD_LOGIC;
    s00_axi_awaddr : in STD_LOGIC_VECTOR ( 1 downto 0 );
    core_start_reg : in STD_LOGIC;
    Q : in STD_LOGIC_VECTOR ( 0 to 0 );
    s00_axi_araddr : in STD_LOGIC_VECTOR ( 1 downto 0 );
    \S_AXI_RDATA_reg[0]\ : in STD_LOGIC;
    \S_AXI_RDATA_reg[0]_0\ : in STD_LOGIC_VECTOR ( 0 to 0 );
    core_start : in STD_LOGIC;
    done_sticky_reg : in STD_LOGIC;
    done_sticky : in STD_LOGIC
  );
end decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_tans_encoder_core;

architecture STRUCTURE of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_tans_encoder_core is
  signal \/i__n_0\ : STD_LOGIC;
  signal \FSM_onehot_current_state_reg_n_0_[0]\ : STD_LOGIC;
  signal \FSM_onehot_current_state_reg_n_0_[1]\ : STD_LOGIC;
  signal \FSM_onehot_current_state_reg_n_0_[2]\ : STD_LOGIC;
  signal \FSM_onehot_current_state_reg_n_0_[3]\ : STD_LOGIC;
  signal \FSM_onehot_current_state_reg_n_0_[4]\ : STD_LOGIC;
  signal busy_i_1_n_0 : STD_LOGIC;
  signal core_busy : STD_LOGIC;
  signal core_done : STD_LOGIC;
  signal done_i_1_n_0 : STD_LOGIC;
  signal done_sticky_i_2_n_0 : STD_LOGIC;
  signal \^p_0_in\ : STD_LOGIC;
  attribute FSM_ENCODED_STATES : string;
  attribute FSM_ENCODED_STATES of \FSM_onehot_current_state_reg[0]\ : label is "IDLE:00001,SET_ADDR:00010,TABLE_LOOKUP:00100,UPDATE_OUTPUTS:01000,FINISH:10000,";
  attribute FSM_ENCODED_STATES of \FSM_onehot_current_state_reg[1]\ : label is "IDLE:00001,SET_ADDR:00010,TABLE_LOOKUP:00100,UPDATE_OUTPUTS:01000,FINISH:10000,";
  attribute FSM_ENCODED_STATES of \FSM_onehot_current_state_reg[2]\ : label is "IDLE:00001,SET_ADDR:00010,TABLE_LOOKUP:00100,UPDATE_OUTPUTS:01000,FINISH:10000,";
  attribute FSM_ENCODED_STATES of \FSM_onehot_current_state_reg[3]\ : label is "IDLE:00001,SET_ADDR:00010,TABLE_LOOKUP:00100,UPDATE_OUTPUTS:01000,FINISH:10000,";
  attribute FSM_ENCODED_STATES of \FSM_onehot_current_state_reg[4]\ : label is "IDLE:00001,SET_ADDR:00010,TABLE_LOOKUP:00100,UPDATE_OUTPUTS:01000,FINISH:10000,";
  attribute SOFT_HLUTNM : string;
  attribute SOFT_HLUTNM of busy_i_1 : label is "soft_lutpair0";
  attribute SOFT_HLUTNM of done_i_1 : label is "soft_lutpair0";
begin
  p_0_in <= \^p_0_in\;
\/i_\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFFFFFFFEEE"
    )
        port map (
      I0 => \FSM_onehot_current_state_reg_n_0_[4]\,
      I1 => \FSM_onehot_current_state_reg_n_0_[1]\,
      I2 => core_start,
      I3 => \FSM_onehot_current_state_reg_n_0_[0]\,
      I4 => \FSM_onehot_current_state_reg_n_0_[3]\,
      I5 => \FSM_onehot_current_state_reg_n_0_[2]\,
      O => \/i__n_0\
    );
\FSM_onehot_current_state_reg[0]\: unisim.vcomponents.FDPE
    generic map(
      INIT => '1'
    )
        port map (
      C => s00_axi_aclk,
      CE => \/i__n_0\,
      D => \FSM_onehot_current_state_reg_n_0_[4]\,
      PRE => \^p_0_in\,
      Q => \FSM_onehot_current_state_reg_n_0_[0]\
    );
\FSM_onehot_current_state_reg[1]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => s00_axi_aclk,
      CE => \/i__n_0\,
      CLR => \^p_0_in\,
      D => \FSM_onehot_current_state_reg_n_0_[0]\,
      Q => \FSM_onehot_current_state_reg_n_0_[1]\
    );
\FSM_onehot_current_state_reg[2]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => s00_axi_aclk,
      CE => \/i__n_0\,
      CLR => \^p_0_in\,
      D => \FSM_onehot_current_state_reg_n_0_[1]\,
      Q => \FSM_onehot_current_state_reg_n_0_[2]\
    );
\FSM_onehot_current_state_reg[3]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => s00_axi_aclk,
      CE => \/i__n_0\,
      CLR => \^p_0_in\,
      D => \FSM_onehot_current_state_reg_n_0_[2]\,
      Q => \FSM_onehot_current_state_reg_n_0_[3]\
    );
\FSM_onehot_current_state_reg[4]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => s00_axi_aclk,
      CE => \/i__n_0\,
      CLR => \^p_0_in\,
      D => \FSM_onehot_current_state_reg_n_0_[3]\,
      Q => \FSM_onehot_current_state_reg_n_0_[4]\
    );
S_AXI_AWREADY_i_1: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => s00_axi_aresetn,
      O => \^p_0_in\
    );
\S_AXI_RDATA[0]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"BBC0000088C00000"
    )
        port map (
      I0 => Q(0),
      I1 => s00_axi_araddr(0),
      I2 => core_busy,
      I3 => s00_axi_araddr(1),
      I4 => \S_AXI_RDATA_reg[0]\,
      I5 => \S_AXI_RDATA_reg[0]_0\(0),
      O => D(0)
    );
busy_i_1: unisim.vcomponents.LUT4
    generic map(
      INIT => X"8B88"
    )
        port map (
      I0 => core_start,
      I1 => \FSM_onehot_current_state_reg_n_0_[0]\,
      I2 => \FSM_onehot_current_state_reg_n_0_[4]\,
      I3 => core_busy,
      O => busy_i_1_n_0
    );
busy_reg: unisim.vcomponents.FDCE
     port map (
      C => s00_axi_aclk,
      CE => '1',
      CLR => \^p_0_in\,
      D => busy_i_1_n_0,
      Q => core_busy
    );
core_start_i_1: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000000000040"
    )
        port map (
      I0 => core_busy,
      I1 => s00_axi_wdata(0),
      I2 => s00_axi_aresetn,
      I3 => s00_axi_awaddr(1),
      I4 => core_start_reg,
      I5 => s00_axi_awaddr(0),
      O => busy_reg_0
    );
done_i_1: unisim.vcomponents.LUT3
    generic map(
      INIT => X"DC"
    )
        port map (
      I0 => \FSM_onehot_current_state_reg_n_0_[0]\,
      I1 => \FSM_onehot_current_state_reg_n_0_[4]\,
      I2 => core_done,
      O => done_i_1_n_0
    );
done_reg: unisim.vcomponents.FDCE
     port map (
      C => s00_axi_aclk,
      CE => '1',
      CLR => \^p_0_in\,
      D => done_i_1_n_0,
      Q => core_done
    );
done_sticky_i_1: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFF30AAAAAA20"
    )
        port map (
      I0 => core_done,
      I1 => s00_axi_wdata(1),
      I2 => done_sticky_i_2_n_0,
      I3 => done_sticky_reg,
      I4 => s00_axi_awaddr(1),
      I5 => done_sticky,
      O => done_reg_0
    );
done_sticky_i_2: unisim.vcomponents.LUT2
    generic map(
      INIT => X"B"
    )
        port map (
      I0 => core_busy,
      I1 => s00_axi_wdata(0),
      O => done_sticky_i_2_n_0
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_myip_axi_lite_v1_0_S00_AXI is
  port (
    s00_axi_wready : out STD_LOGIC;
    s00_axi_arready : out STD_LOGIC;
    s00_axi_rdata : out STD_LOGIC_VECTOR ( 15 downto 0 );
    S_AXI_BVALID_reg_0 : out STD_LOGIC;
    s00_axi_rvalid : out STD_LOGIC;
    s00_axi_aclk : in STD_LOGIC;
    s00_axi_wdata : in STD_LOGIC_VECTOR ( 15 downto 0 );
    s00_axi_wstrb : in STD_LOGIC_VECTOR ( 1 downto 0 );
    s00_axi_awaddr : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s00_axi_aresetn : in STD_LOGIC;
    s00_axi_awvalid : in STD_LOGIC;
    s00_axi_wvalid : in STD_LOGIC;
    s00_axi_araddr : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s00_axi_arvalid : in STD_LOGIC;
    s00_axi_bready : in STD_LOGIC;
    s00_axi_rready : in STD_LOGIC
  );
end decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_myip_axi_lite_v1_0_S00_AXI;

architecture STRUCTURE of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_myip_axi_lite_v1_0_S00_AXI is
  signal S_AXI_ARREADY0 : STD_LOGIC;
  signal S_AXI_AWREADY0 : STD_LOGIC;
  signal S_AXI_BVALID_i_1_n_0 : STD_LOGIC;
  signal \^s_axi_bvalid_reg_0\ : STD_LOGIC;
  signal \S_AXI_RDATA[10]_i_1_n_0\ : STD_LOGIC;
  signal \S_AXI_RDATA[11]_i_1_n_0\ : STD_LOGIC;
  signal \S_AXI_RDATA[12]_i_1_n_0\ : STD_LOGIC;
  signal \S_AXI_RDATA[13]_i_1_n_0\ : STD_LOGIC;
  signal \S_AXI_RDATA[14]_i_1_n_0\ : STD_LOGIC;
  signal \S_AXI_RDATA[15]_i_1_n_0\ : STD_LOGIC;
  signal \S_AXI_RDATA[1]_i_1_n_0\ : STD_LOGIC;
  signal \S_AXI_RDATA[1]_i_2_n_0\ : STD_LOGIC;
  signal \S_AXI_RDATA[2]_i_1_n_0\ : STD_LOGIC;
  signal \S_AXI_RDATA[3]_i_1_n_0\ : STD_LOGIC;
  signal \S_AXI_RDATA[4]_i_1_n_0\ : STD_LOGIC;
  signal \S_AXI_RDATA[5]_i_1_n_0\ : STD_LOGIC;
  signal \S_AXI_RDATA[6]_i_1_n_0\ : STD_LOGIC;
  signal \S_AXI_RDATA[7]_i_1_n_0\ : STD_LOGIC;
  signal \S_AXI_RDATA[8]_i_1_n_0\ : STD_LOGIC;
  signal \S_AXI_RDATA[9]_i_1_n_0\ : STD_LOGIC;
  signal S_AXI_RVALID_i_1_n_0 : STD_LOGIC;
  signal core_start : STD_LOGIC;
  signal done_sticky : STD_LOGIC;
  signal done_sticky_i_3_n_0 : STD_LOGIC;
  signal p_0_in : STD_LOGIC;
  signal p_1_in : STD_LOGIC_VECTOR ( 7 to 7 );
  signal \^s00_axi_rvalid\ : STD_LOGIC;
  signal state_in_reg : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal \state_in_reg[15]_i_1_n_0\ : STD_LOGIC;
  signal \state_in_reg[7]_i_1_n_0\ : STD_LOGIC;
  signal symbol_reg : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal \symbol_reg[7]_i_2_n_0\ : STD_LOGIC;
  signal u_core_n_1 : STD_LOGIC;
  signal u_core_n_2 : STD_LOGIC;
  signal u_core_n_3 : STD_LOGIC;
  attribute SOFT_HLUTNM : string;
  attribute SOFT_HLUTNM of S_AXI_AWREADY_i_2 : label is "soft_lutpair1";
  attribute SOFT_HLUTNM of \S_AXI_RDATA[1]_i_2\ : label is "soft_lutpair2";
  attribute SOFT_HLUTNM of \S_AXI_RDATA[8]_i_1\ : label is "soft_lutpair2";
  attribute SOFT_HLUTNM of \symbol_reg[7]_i_2\ : label is "soft_lutpair1";
begin
  S_AXI_BVALID_reg_0 <= \^s_axi_bvalid_reg_0\;
  s00_axi_rvalid <= \^s00_axi_rvalid\;
S_AXI_ARREADY_i_1: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => s00_axi_arvalid,
      I1 => \^s00_axi_rvalid\,
      O => S_AXI_ARREADY0
    );
S_AXI_ARREADY_reg: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => '1',
      D => S_AXI_ARREADY0,
      Q => s00_axi_arready,
      R => p_0_in
    );
S_AXI_AWREADY_i_2: unisim.vcomponents.LUT3
    generic map(
      INIT => X"20"
    )
        port map (
      I0 => s00_axi_wvalid,
      I1 => \^s_axi_bvalid_reg_0\,
      I2 => s00_axi_awvalid,
      O => S_AXI_AWREADY0
    );
S_AXI_AWREADY_reg: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => '1',
      D => S_AXI_AWREADY0,
      Q => s00_axi_wready,
      R => p_0_in
    );
S_AXI_BVALID_i_1: unisim.vcomponents.LUT4
    generic map(
      INIT => X"5C50"
    )
        port map (
      I0 => s00_axi_bready,
      I1 => s00_axi_wvalid,
      I2 => \^s_axi_bvalid_reg_0\,
      I3 => s00_axi_awvalid,
      O => S_AXI_BVALID_i_1_n_0
    );
S_AXI_BVALID_reg: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => '1',
      D => S_AXI_BVALID_i_1_n_0,
      Q => \^s_axi_bvalid_reg_0\,
      R => p_0_in
    );
\S_AXI_RDATA[10]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"02000000"
    )
        port map (
      I0 => s00_axi_araddr(2),
      I1 => s00_axi_araddr(1),
      I2 => s00_axi_araddr(0),
      I3 => s00_axi_araddr(3),
      I4 => state_in_reg(10),
      O => \S_AXI_RDATA[10]_i_1_n_0\
    );
\S_AXI_RDATA[11]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"02000000"
    )
        port map (
      I0 => s00_axi_araddr(2),
      I1 => s00_axi_araddr(1),
      I2 => s00_axi_araddr(0),
      I3 => s00_axi_araddr(3),
      I4 => state_in_reg(11),
      O => \S_AXI_RDATA[11]_i_1_n_0\
    );
\S_AXI_RDATA[12]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"02000000"
    )
        port map (
      I0 => s00_axi_araddr(2),
      I1 => s00_axi_araddr(1),
      I2 => s00_axi_araddr(0),
      I3 => s00_axi_araddr(3),
      I4 => state_in_reg(12),
      O => \S_AXI_RDATA[12]_i_1_n_0\
    );
\S_AXI_RDATA[13]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"02000000"
    )
        port map (
      I0 => s00_axi_araddr(2),
      I1 => s00_axi_araddr(1),
      I2 => s00_axi_araddr(0),
      I3 => s00_axi_araddr(3),
      I4 => state_in_reg(13),
      O => \S_AXI_RDATA[13]_i_1_n_0\
    );
\S_AXI_RDATA[14]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"02000000"
    )
        port map (
      I0 => s00_axi_araddr(2),
      I1 => s00_axi_araddr(1),
      I2 => s00_axi_araddr(0),
      I3 => s00_axi_araddr(3),
      I4 => state_in_reg(14),
      O => \S_AXI_RDATA[14]_i_1_n_0\
    );
\S_AXI_RDATA[15]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"02000000"
    )
        port map (
      I0 => s00_axi_araddr(2),
      I1 => s00_axi_araddr(1),
      I2 => s00_axi_araddr(0),
      I3 => s00_axi_araddr(3),
      I4 => state_in_reg(15),
      O => \S_AXI_RDATA[15]_i_1_n_0\
    );
\S_AXI_RDATA[1]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"BBC0000088C00000"
    )
        port map (
      I0 => state_in_reg(1),
      I1 => s00_axi_araddr(2),
      I2 => done_sticky,
      I3 => s00_axi_araddr(3),
      I4 => \S_AXI_RDATA[1]_i_2_n_0\,
      I5 => symbol_reg(1),
      O => \S_AXI_RDATA[1]_i_1_n_0\
    );
\S_AXI_RDATA[1]_i_2\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => s00_axi_araddr(0),
      I1 => s00_axi_araddr(1),
      O => \S_AXI_RDATA[1]_i_2_n_0\
    );
\S_AXI_RDATA[2]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"000000A0000000C0"
    )
        port map (
      I0 => state_in_reg(2),
      I1 => symbol_reg(2),
      I2 => s00_axi_araddr(3),
      I3 => s00_axi_araddr(0),
      I4 => s00_axi_araddr(1),
      I5 => s00_axi_araddr(2),
      O => \S_AXI_RDATA[2]_i_1_n_0\
    );
\S_AXI_RDATA[3]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"000000A0000000C0"
    )
        port map (
      I0 => state_in_reg(3),
      I1 => symbol_reg(3),
      I2 => s00_axi_araddr(3),
      I3 => s00_axi_araddr(0),
      I4 => s00_axi_araddr(1),
      I5 => s00_axi_araddr(2),
      O => \S_AXI_RDATA[3]_i_1_n_0\
    );
\S_AXI_RDATA[4]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"000000A0000000C0"
    )
        port map (
      I0 => state_in_reg(4),
      I1 => symbol_reg(4),
      I2 => s00_axi_araddr(3),
      I3 => s00_axi_araddr(0),
      I4 => s00_axi_araddr(1),
      I5 => s00_axi_araddr(2),
      O => \S_AXI_RDATA[4]_i_1_n_0\
    );
\S_AXI_RDATA[5]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"000000A0000000C0"
    )
        port map (
      I0 => state_in_reg(5),
      I1 => symbol_reg(5),
      I2 => s00_axi_araddr(3),
      I3 => s00_axi_araddr(0),
      I4 => s00_axi_araddr(1),
      I5 => s00_axi_araddr(2),
      O => \S_AXI_RDATA[5]_i_1_n_0\
    );
\S_AXI_RDATA[6]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"000000A0000000C0"
    )
        port map (
      I0 => state_in_reg(6),
      I1 => symbol_reg(6),
      I2 => s00_axi_araddr(3),
      I3 => s00_axi_araddr(0),
      I4 => s00_axi_araddr(1),
      I5 => s00_axi_araddr(2),
      O => \S_AXI_RDATA[6]_i_1_n_0\
    );
\S_AXI_RDATA[7]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"000000A0000000C0"
    )
        port map (
      I0 => state_in_reg(7),
      I1 => symbol_reg(7),
      I2 => s00_axi_araddr(3),
      I3 => s00_axi_araddr(0),
      I4 => s00_axi_araddr(1),
      I5 => s00_axi_araddr(2),
      O => \S_AXI_RDATA[7]_i_1_n_0\
    );
\S_AXI_RDATA[8]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"02000000"
    )
        port map (
      I0 => s00_axi_araddr(2),
      I1 => s00_axi_araddr(1),
      I2 => s00_axi_araddr(0),
      I3 => s00_axi_araddr(3),
      I4 => state_in_reg(8),
      O => \S_AXI_RDATA[8]_i_1_n_0\
    );
\S_AXI_RDATA[9]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"02000000"
    )
        port map (
      I0 => s00_axi_araddr(2),
      I1 => s00_axi_araddr(1),
      I2 => s00_axi_araddr(0),
      I3 => s00_axi_araddr(3),
      I4 => state_in_reg(9),
      O => \S_AXI_RDATA[9]_i_1_n_0\
    );
\S_AXI_RDATA_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => S_AXI_ARREADY0,
      D => u_core_n_2,
      Q => s00_axi_rdata(0),
      R => p_0_in
    );
\S_AXI_RDATA_reg[10]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => S_AXI_ARREADY0,
      D => \S_AXI_RDATA[10]_i_1_n_0\,
      Q => s00_axi_rdata(10),
      R => p_0_in
    );
\S_AXI_RDATA_reg[11]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => S_AXI_ARREADY0,
      D => \S_AXI_RDATA[11]_i_1_n_0\,
      Q => s00_axi_rdata(11),
      R => p_0_in
    );
\S_AXI_RDATA_reg[12]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => S_AXI_ARREADY0,
      D => \S_AXI_RDATA[12]_i_1_n_0\,
      Q => s00_axi_rdata(12),
      R => p_0_in
    );
\S_AXI_RDATA_reg[13]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => S_AXI_ARREADY0,
      D => \S_AXI_RDATA[13]_i_1_n_0\,
      Q => s00_axi_rdata(13),
      R => p_0_in
    );
\S_AXI_RDATA_reg[14]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => S_AXI_ARREADY0,
      D => \S_AXI_RDATA[14]_i_1_n_0\,
      Q => s00_axi_rdata(14),
      R => p_0_in
    );
\S_AXI_RDATA_reg[15]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => S_AXI_ARREADY0,
      D => \S_AXI_RDATA[15]_i_1_n_0\,
      Q => s00_axi_rdata(15),
      R => p_0_in
    );
\S_AXI_RDATA_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => S_AXI_ARREADY0,
      D => \S_AXI_RDATA[1]_i_1_n_0\,
      Q => s00_axi_rdata(1),
      R => p_0_in
    );
\S_AXI_RDATA_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => S_AXI_ARREADY0,
      D => \S_AXI_RDATA[2]_i_1_n_0\,
      Q => s00_axi_rdata(2),
      R => p_0_in
    );
\S_AXI_RDATA_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => S_AXI_ARREADY0,
      D => \S_AXI_RDATA[3]_i_1_n_0\,
      Q => s00_axi_rdata(3),
      R => p_0_in
    );
\S_AXI_RDATA_reg[4]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => S_AXI_ARREADY0,
      D => \S_AXI_RDATA[4]_i_1_n_0\,
      Q => s00_axi_rdata(4),
      R => p_0_in
    );
\S_AXI_RDATA_reg[5]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => S_AXI_ARREADY0,
      D => \S_AXI_RDATA[5]_i_1_n_0\,
      Q => s00_axi_rdata(5),
      R => p_0_in
    );
\S_AXI_RDATA_reg[6]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => S_AXI_ARREADY0,
      D => \S_AXI_RDATA[6]_i_1_n_0\,
      Q => s00_axi_rdata(6),
      R => p_0_in
    );
\S_AXI_RDATA_reg[7]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => S_AXI_ARREADY0,
      D => \S_AXI_RDATA[7]_i_1_n_0\,
      Q => s00_axi_rdata(7),
      R => p_0_in
    );
\S_AXI_RDATA_reg[8]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => S_AXI_ARREADY0,
      D => \S_AXI_RDATA[8]_i_1_n_0\,
      Q => s00_axi_rdata(8),
      R => p_0_in
    );
\S_AXI_RDATA_reg[9]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => S_AXI_ARREADY0,
      D => \S_AXI_RDATA[9]_i_1_n_0\,
      Q => s00_axi_rdata(9),
      R => p_0_in
    );
S_AXI_RVALID_i_1: unisim.vcomponents.LUT3
    generic map(
      INIT => X"3A"
    )
        port map (
      I0 => s00_axi_arvalid,
      I1 => s00_axi_rready,
      I2 => \^s00_axi_rvalid\,
      O => S_AXI_RVALID_i_1_n_0
    );
S_AXI_RVALID_reg: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => '1',
      D => S_AXI_RVALID_i_1_n_0,
      Q => \^s00_axi_rvalid\,
      R => p_0_in
    );
core_start_reg: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => '1',
      D => u_core_n_1,
      Q => core_start,
      R => '0'
    );
done_sticky_i_3: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFFFFFFFFDF"
    )
        port map (
      I0 => s00_axi_awvalid,
      I1 => \^s_axi_bvalid_reg_0\,
      I2 => s00_axi_wvalid,
      I3 => s00_axi_awaddr(0),
      I4 => s00_axi_awaddr(1),
      I5 => s00_axi_awaddr(2),
      O => done_sticky_i_3_n_0
    );
done_sticky_reg: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => '1',
      D => u_core_n_3,
      Q => done_sticky,
      R => p_0_in
    );
\state_in_reg[15]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0080"
    )
        port map (
      I0 => s00_axi_wstrb(1),
      I1 => s00_axi_awaddr(2),
      I2 => s00_axi_awaddr(3),
      I3 => \symbol_reg[7]_i_2_n_0\,
      O => \state_in_reg[15]_i_1_n_0\
    );
\state_in_reg[7]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0080"
    )
        port map (
      I0 => s00_axi_wstrb(0),
      I1 => s00_axi_awaddr(2),
      I2 => s00_axi_awaddr(3),
      I3 => \symbol_reg[7]_i_2_n_0\,
      O => \state_in_reg[7]_i_1_n_0\
    );
\state_in_reg_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \state_in_reg[7]_i_1_n_0\,
      D => s00_axi_wdata(0),
      Q => state_in_reg(0),
      R => p_0_in
    );
\state_in_reg_reg[10]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \state_in_reg[15]_i_1_n_0\,
      D => s00_axi_wdata(10),
      Q => state_in_reg(10),
      R => p_0_in
    );
\state_in_reg_reg[11]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \state_in_reg[15]_i_1_n_0\,
      D => s00_axi_wdata(11),
      Q => state_in_reg(11),
      R => p_0_in
    );
\state_in_reg_reg[12]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \state_in_reg[15]_i_1_n_0\,
      D => s00_axi_wdata(12),
      Q => state_in_reg(12),
      R => p_0_in
    );
\state_in_reg_reg[13]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \state_in_reg[15]_i_1_n_0\,
      D => s00_axi_wdata(13),
      Q => state_in_reg(13),
      R => p_0_in
    );
\state_in_reg_reg[14]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \state_in_reg[15]_i_1_n_0\,
      D => s00_axi_wdata(14),
      Q => state_in_reg(14),
      R => p_0_in
    );
\state_in_reg_reg[15]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \state_in_reg[15]_i_1_n_0\,
      D => s00_axi_wdata(15),
      Q => state_in_reg(15),
      R => p_0_in
    );
\state_in_reg_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \state_in_reg[7]_i_1_n_0\,
      D => s00_axi_wdata(1),
      Q => state_in_reg(1),
      R => p_0_in
    );
\state_in_reg_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \state_in_reg[7]_i_1_n_0\,
      D => s00_axi_wdata(2),
      Q => state_in_reg(2),
      R => p_0_in
    );
\state_in_reg_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \state_in_reg[7]_i_1_n_0\,
      D => s00_axi_wdata(3),
      Q => state_in_reg(3),
      R => p_0_in
    );
\state_in_reg_reg[4]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \state_in_reg[7]_i_1_n_0\,
      D => s00_axi_wdata(4),
      Q => state_in_reg(4),
      R => p_0_in
    );
\state_in_reg_reg[5]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \state_in_reg[7]_i_1_n_0\,
      D => s00_axi_wdata(5),
      Q => state_in_reg(5),
      R => p_0_in
    );
\state_in_reg_reg[6]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \state_in_reg[7]_i_1_n_0\,
      D => s00_axi_wdata(6),
      Q => state_in_reg(6),
      R => p_0_in
    );
\state_in_reg_reg[7]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \state_in_reg[7]_i_1_n_0\,
      D => s00_axi_wdata(7),
      Q => state_in_reg(7),
      R => p_0_in
    );
\state_in_reg_reg[8]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \state_in_reg[15]_i_1_n_0\,
      D => s00_axi_wdata(8),
      Q => state_in_reg(8),
      R => p_0_in
    );
\state_in_reg_reg[9]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \state_in_reg[15]_i_1_n_0\,
      D => s00_axi_wdata(9),
      Q => state_in_reg(9),
      R => p_0_in
    );
\symbol_reg[7]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0008"
    )
        port map (
      I0 => s00_axi_awaddr(3),
      I1 => s00_axi_wstrb(0),
      I2 => s00_axi_awaddr(2),
      I3 => \symbol_reg[7]_i_2_n_0\,
      O => p_1_in(7)
    );
\symbol_reg[7]_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFEFFFFF"
    )
        port map (
      I0 => s00_axi_awaddr(1),
      I1 => s00_axi_awaddr(0),
      I2 => s00_axi_wvalid,
      I3 => \^s_axi_bvalid_reg_0\,
      I4 => s00_axi_awvalid,
      O => \symbol_reg[7]_i_2_n_0\
    );
\symbol_reg_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => p_1_in(7),
      D => s00_axi_wdata(0),
      Q => symbol_reg(0),
      R => p_0_in
    );
\symbol_reg_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => p_1_in(7),
      D => s00_axi_wdata(1),
      Q => symbol_reg(1),
      R => p_0_in
    );
\symbol_reg_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => p_1_in(7),
      D => s00_axi_wdata(2),
      Q => symbol_reg(2),
      R => p_0_in
    );
\symbol_reg_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => p_1_in(7),
      D => s00_axi_wdata(3),
      Q => symbol_reg(3),
      R => p_0_in
    );
\symbol_reg_reg[4]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => p_1_in(7),
      D => s00_axi_wdata(4),
      Q => symbol_reg(4),
      R => p_0_in
    );
\symbol_reg_reg[5]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => p_1_in(7),
      D => s00_axi_wdata(5),
      Q => symbol_reg(5),
      R => p_0_in
    );
\symbol_reg_reg[6]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => p_1_in(7),
      D => s00_axi_wdata(6),
      Q => symbol_reg(6),
      R => p_0_in
    );
\symbol_reg_reg[7]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => p_1_in(7),
      D => s00_axi_wdata(7),
      Q => symbol_reg(7),
      R => p_0_in
    );
u_core: entity work.decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_tans_encoder_core
     port map (
      D(0) => u_core_n_2,
      Q(0) => state_in_reg(0),
      \S_AXI_RDATA_reg[0]\ => \S_AXI_RDATA[1]_i_2_n_0\,
      \S_AXI_RDATA_reg[0]_0\(0) => symbol_reg(0),
      busy_reg_0 => u_core_n_1,
      core_start => core_start,
      core_start_reg => \symbol_reg[7]_i_2_n_0\,
      done_reg_0 => u_core_n_3,
      done_sticky => done_sticky,
      done_sticky_reg => done_sticky_i_3_n_0,
      p_0_in => p_0_in,
      s00_axi_aclk => s00_axi_aclk,
      s00_axi_araddr(1 downto 0) => s00_axi_araddr(3 downto 2),
      s00_axi_aresetn => s00_axi_aresetn,
      s00_axi_awaddr(1 downto 0) => s00_axi_awaddr(3 downto 2),
      s00_axi_wdata(1 downto 0) => s00_axi_wdata(1 downto 0)
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_myip_axi_lite_v1_0 is
  port (
    s00_axi_wready : out STD_LOGIC;
    s00_axi_arready : out STD_LOGIC;
    s00_axi_rdata : out STD_LOGIC_VECTOR ( 15 downto 0 );
    S_AXI_BVALID_reg : out STD_LOGIC;
    s00_axi_rvalid : out STD_LOGIC;
    s00_axi_aclk : in STD_LOGIC;
    s00_axi_wdata : in STD_LOGIC_VECTOR ( 15 downto 0 );
    s00_axi_wstrb : in STD_LOGIC_VECTOR ( 1 downto 0 );
    s00_axi_awaddr : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s00_axi_aresetn : in STD_LOGIC;
    s00_axi_awvalid : in STD_LOGIC;
    s00_axi_wvalid : in STD_LOGIC;
    s00_axi_araddr : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s00_axi_arvalid : in STD_LOGIC;
    s00_axi_bready : in STD_LOGIC;
    s00_axi_rready : in STD_LOGIC
  );
end decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_myip_axi_lite_v1_0;

architecture STRUCTURE of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_myip_axi_lite_v1_0 is
begin
myip_axi_lite_v1_0_S00_AXI_inst: entity work.decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_myip_axi_lite_v1_0_S00_AXI
     port map (
      S_AXI_BVALID_reg_0 => S_AXI_BVALID_reg,
      s00_axi_aclk => s00_axi_aclk,
      s00_axi_araddr(3 downto 0) => s00_axi_araddr(3 downto 0),
      s00_axi_aresetn => s00_axi_aresetn,
      s00_axi_arready => s00_axi_arready,
      s00_axi_arvalid => s00_axi_arvalid,
      s00_axi_awaddr(3 downto 0) => s00_axi_awaddr(3 downto 0),
      s00_axi_awvalid => s00_axi_awvalid,
      s00_axi_bready => s00_axi_bready,
      s00_axi_rdata(15 downto 0) => s00_axi_rdata(15 downto 0),
      s00_axi_rready => s00_axi_rready,
      s00_axi_rvalid => s00_axi_rvalid,
      s00_axi_wdata(15 downto 0) => s00_axi_wdata(15 downto 0),
      s00_axi_wready => s00_axi_wready,
      s00_axi_wstrb(1 downto 0) => s00_axi_wstrb(1 downto 0),
      s00_axi_wvalid => s00_axi_wvalid
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix is
  port (
    s00_axi_aclk : in STD_LOGIC;
    s00_axi_aresetn : in STD_LOGIC;
    s00_axi_awaddr : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s00_axi_awprot : in STD_LOGIC_VECTOR ( 2 downto 0 );
    s00_axi_awvalid : in STD_LOGIC;
    s00_axi_awready : out STD_LOGIC;
    s00_axi_wdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    s00_axi_wstrb : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s00_axi_wvalid : in STD_LOGIC;
    s00_axi_wready : out STD_LOGIC;
    s00_axi_bresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    s00_axi_bvalid : out STD_LOGIC;
    s00_axi_bready : in STD_LOGIC;
    s00_axi_araddr : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s00_axi_arprot : in STD_LOGIC_VECTOR ( 2 downto 0 );
    s00_axi_arvalid : in STD_LOGIC;
    s00_axi_arready : out STD_LOGIC;
    s00_axi_rdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    s00_axi_rresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    s00_axi_rvalid : out STD_LOGIC;
    s00_axi_rready : in STD_LOGIC
  );
  attribute NotValidForBitStream : boolean;
  attribute NotValidForBitStream of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix : entity is true;
  attribute CHECK_LICENSE_TYPE : string;
  attribute CHECK_LICENSE_TYPE of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix : entity is "ans_design_myip_axi_lite_v1_0_0_0,myip_axi_lite_v1_0,{}";
  attribute DowngradeIPIdentifiedWarnings : string;
  attribute DowngradeIPIdentifiedWarnings of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix : entity is "yes";
  attribute IP_DEFINITION_SOURCE : string;
  attribute IP_DEFINITION_SOURCE of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix : entity is "package_project";
  attribute X_CORE_INFO : string;
  attribute X_CORE_INFO of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix : entity is "myip_axi_lite_v1_0,Vivado 2022.1";
end decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix;

architecture STRUCTURE of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix is
  signal \<const0>\ : STD_LOGIC;
  signal \^s00_axi_rdata\ : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal \^s00_axi_wready\ : STD_LOGIC;
  attribute X_INTERFACE_INFO : string;
  attribute X_INTERFACE_INFO of s00_axi_aclk : signal is "xilinx.com:signal:clock:1.0 s00_axi_aclk CLK";
  attribute X_INTERFACE_PARAMETER : string;
  attribute X_INTERFACE_PARAMETER of s00_axi_aclk : signal is "XIL_INTERFACENAME s00_axi_aclk, ASSOCIATED_BUSIF s00_axi, ASSOCIATED_RESET s00_axi_aresetn, FREQ_HZ 100000000, FREQ_TOLERANCE_HZ 0, PHASE 0.0, CLK_DOMAIN ans_design_processing_system7_0_0_FCLK_CLK0, INSERT_VIP 0";
  attribute X_INTERFACE_INFO of s00_axi_aresetn : signal is "xilinx.com:signal:reset:1.0 s00_axi_aresetn RST";
  attribute X_INTERFACE_PARAMETER of s00_axi_aresetn : signal is "XIL_INTERFACENAME s00_axi_aresetn, POLARITY ACTIVE_LOW, INSERT_VIP 0";
  attribute X_INTERFACE_INFO of s00_axi_arready : signal is "xilinx.com:interface:aximm:1.0 s00_axi ARREADY";
  attribute X_INTERFACE_INFO of s00_axi_arvalid : signal is "xilinx.com:interface:aximm:1.0 s00_axi ARVALID";
  attribute X_INTERFACE_INFO of s00_axi_awready : signal is "xilinx.com:interface:aximm:1.0 s00_axi AWREADY";
  attribute X_INTERFACE_INFO of s00_axi_awvalid : signal is "xilinx.com:interface:aximm:1.0 s00_axi AWVALID";
  attribute X_INTERFACE_INFO of s00_axi_bready : signal is "xilinx.com:interface:aximm:1.0 s00_axi BREADY";
  attribute X_INTERFACE_INFO of s00_axi_bvalid : signal is "xilinx.com:interface:aximm:1.0 s00_axi BVALID";
  attribute X_INTERFACE_INFO of s00_axi_rready : signal is "xilinx.com:interface:aximm:1.0 s00_axi RREADY";
  attribute X_INTERFACE_PARAMETER of s00_axi_rready : signal is "XIL_INTERFACENAME s00_axi, DATA_WIDTH 32, PROTOCOL AXI4LITE, FREQ_HZ 100000000, ID_WIDTH 0, ADDR_WIDTH 4, AWUSER_WIDTH 0, ARUSER_WIDTH 0, WUSER_WIDTH 0, RUSER_WIDTH 0, BUSER_WIDTH 0, READ_WRITE_MODE READ_WRITE, HAS_BURST 0, HAS_LOCK 0, HAS_PROT 1, HAS_CACHE 0, HAS_QOS 0, HAS_REGION 0, HAS_WSTRB 1, HAS_BRESP 1, HAS_RRESP 1, SUPPORTS_NARROW_BURST 0, NUM_READ_OUTSTANDING 8, NUM_WRITE_OUTSTANDING 8, MAX_BURST_LENGTH 1, PHASE 0.0, CLK_DOMAIN ans_design_processing_system7_0_0_FCLK_CLK0, NUM_READ_THREADS 4, NUM_WRITE_THREADS 4, RUSER_BITS_PER_BYTE 0, WUSER_BITS_PER_BYTE 0, INSERT_VIP 0";
  attribute X_INTERFACE_INFO of s00_axi_rvalid : signal is "xilinx.com:interface:aximm:1.0 s00_axi RVALID";
  attribute X_INTERFACE_INFO of s00_axi_wready : signal is "xilinx.com:interface:aximm:1.0 s00_axi WREADY";
  attribute X_INTERFACE_INFO of s00_axi_wvalid : signal is "xilinx.com:interface:aximm:1.0 s00_axi WVALID";
  attribute X_INTERFACE_INFO of s00_axi_araddr : signal is "xilinx.com:interface:aximm:1.0 s00_axi ARADDR";
  attribute X_INTERFACE_INFO of s00_axi_arprot : signal is "xilinx.com:interface:aximm:1.0 s00_axi ARPROT";
  attribute X_INTERFACE_INFO of s00_axi_awaddr : signal is "xilinx.com:interface:aximm:1.0 s00_axi AWADDR";
  attribute X_INTERFACE_INFO of s00_axi_awprot : signal is "xilinx.com:interface:aximm:1.0 s00_axi AWPROT";
  attribute X_INTERFACE_INFO of s00_axi_bresp : signal is "xilinx.com:interface:aximm:1.0 s00_axi BRESP";
  attribute X_INTERFACE_INFO of s00_axi_rdata : signal is "xilinx.com:interface:aximm:1.0 s00_axi RDATA";
  attribute X_INTERFACE_INFO of s00_axi_rresp : signal is "xilinx.com:interface:aximm:1.0 s00_axi RRESP";
  attribute X_INTERFACE_INFO of s00_axi_wdata : signal is "xilinx.com:interface:aximm:1.0 s00_axi WDATA";
  attribute X_INTERFACE_INFO of s00_axi_wstrb : signal is "xilinx.com:interface:aximm:1.0 s00_axi WSTRB";
begin
  s00_axi_awready <= \^s00_axi_wready\;
  s00_axi_bresp(1) <= \<const0>\;
  s00_axi_bresp(0) <= \<const0>\;
  s00_axi_rdata(31) <= \<const0>\;
  s00_axi_rdata(30) <= \<const0>\;
  s00_axi_rdata(29) <= \<const0>\;
  s00_axi_rdata(28) <= \<const0>\;
  s00_axi_rdata(27) <= \<const0>\;
  s00_axi_rdata(26) <= \<const0>\;
  s00_axi_rdata(25) <= \<const0>\;
  s00_axi_rdata(24) <= \<const0>\;
  s00_axi_rdata(23) <= \<const0>\;
  s00_axi_rdata(22) <= \<const0>\;
  s00_axi_rdata(21) <= \<const0>\;
  s00_axi_rdata(20) <= \<const0>\;
  s00_axi_rdata(19) <= \<const0>\;
  s00_axi_rdata(18) <= \<const0>\;
  s00_axi_rdata(17) <= \<const0>\;
  s00_axi_rdata(16) <= \<const0>\;
  s00_axi_rdata(15 downto 0) <= \^s00_axi_rdata\(15 downto 0);
  s00_axi_rresp(1) <= \<const0>\;
  s00_axi_rresp(0) <= \<const0>\;
  s00_axi_wready <= \^s00_axi_wready\;
GND: unisim.vcomponents.GND
     port map (
      G => \<const0>\
    );
inst: entity work.decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_myip_axi_lite_v1_0
     port map (
      S_AXI_BVALID_reg => s00_axi_bvalid,
      s00_axi_aclk => s00_axi_aclk,
      s00_axi_araddr(3 downto 0) => s00_axi_araddr(3 downto 0),
      s00_axi_aresetn => s00_axi_aresetn,
      s00_axi_arready => s00_axi_arready,
      s00_axi_arvalid => s00_axi_arvalid,
      s00_axi_awaddr(3 downto 0) => s00_axi_awaddr(3 downto 0),
      s00_axi_awvalid => s00_axi_awvalid,
      s00_axi_bready => s00_axi_bready,
      s00_axi_rdata(15 downto 0) => \^s00_axi_rdata\(15 downto 0),
      s00_axi_rready => s00_axi_rready,
      s00_axi_rvalid => s00_axi_rvalid,
      s00_axi_wdata(15 downto 0) => s00_axi_wdata(15 downto 0),
      s00_axi_wready => \^s00_axi_wready\,
      s00_axi_wstrb(1 downto 0) => s00_axi_wstrb(1 downto 0),
      s00_axi_wvalid => s00_axi_wvalid
    );
end STRUCTURE;
