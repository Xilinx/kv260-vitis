-- ==============================================================
-- RTL generated by Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2022.1 (64-bit)
-- Version: 2022.1
-- Copyright (C) Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
-- 
-- ===========================================================

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity ISPPipeline_accel_ISPpipeline_Block_entry1_proc is
port (
    ap_clk : IN STD_LOGIC;
    ap_rst : IN STD_LOGIC;
    ap_start : IN STD_LOGIC;
    ap_done : OUT STD_LOGIC;
    ap_continue : IN STD_LOGIC;
    ap_idle : OUT STD_LOGIC;
    ap_ready : OUT STD_LOGIC;
    height : IN STD_LOGIC_VECTOR (10 downto 0);
    width : IN STD_LOGIC_VECTOR (10 downto 0);
    pawb : IN STD_LOGIC_VECTOR (15 downto 0);
    ap_return_0 : OUT STD_LOGIC_VECTOR (10 downto 0);
    ap_return_1 : OUT STD_LOGIC_VECTOR (10 downto 0);
    ap_return_2 : OUT STD_LOGIC_VECTOR (10 downto 0);
    ap_return_3 : OUT STD_LOGIC_VECTOR (10 downto 0);
    ap_return_4 : OUT STD_LOGIC_VECTOR (10 downto 0);
    ap_return_5 : OUT STD_LOGIC_VECTOR (10 downto 0);
    ap_return_6 : OUT STD_LOGIC_VECTOR (10 downto 0);
    ap_return_7 : OUT STD_LOGIC_VECTOR (10 downto 0);
    ap_return_8 : OUT STD_LOGIC_VECTOR (10 downto 0);
    ap_return_9 : OUT STD_LOGIC_VECTOR (10 downto 0);
    ap_return_10 : OUT STD_LOGIC_VECTOR (31 downto 0);
    ap_return_11 : OUT STD_LOGIC_VECTOR (10 downto 0);
    ap_return_12 : OUT STD_LOGIC_VECTOR (10 downto 0);
    ap_return_13 : OUT STD_LOGIC_VECTOR (10 downto 0);
    ap_return_14 : OUT STD_LOGIC_VECTOR (10 downto 0);
    ap_return_15 : OUT STD_LOGIC_VECTOR (10 downto 0);
    ap_return_16 : OUT STD_LOGIC_VECTOR (10 downto 0) );
end;


architecture behav of ISPPipeline_accel_ISPpipeline_Block_entry1_proc is 
    constant ap_const_logic_1 : STD_LOGIC := '1';
    constant ap_const_logic_0 : STD_LOGIC := '0';
    constant ap_ST_fsm_state1 : STD_LOGIC_VECTOR (14 downto 0) := "000000000000001";
    constant ap_ST_fsm_state2 : STD_LOGIC_VECTOR (14 downto 0) := "000000000000010";
    constant ap_ST_fsm_state3 : STD_LOGIC_VECTOR (14 downto 0) := "000000000000100";
    constant ap_ST_fsm_state4 : STD_LOGIC_VECTOR (14 downto 0) := "000000000001000";
    constant ap_ST_fsm_state5 : STD_LOGIC_VECTOR (14 downto 0) := "000000000010000";
    constant ap_ST_fsm_state6 : STD_LOGIC_VECTOR (14 downto 0) := "000000000100000";
    constant ap_ST_fsm_state7 : STD_LOGIC_VECTOR (14 downto 0) := "000000001000000";
    constant ap_ST_fsm_state8 : STD_LOGIC_VECTOR (14 downto 0) := "000000010000000";
    constant ap_ST_fsm_state9 : STD_LOGIC_VECTOR (14 downto 0) := "000000100000000";
    constant ap_ST_fsm_state10 : STD_LOGIC_VECTOR (14 downto 0) := "000001000000000";
    constant ap_ST_fsm_state11 : STD_LOGIC_VECTOR (14 downto 0) := "000010000000000";
    constant ap_ST_fsm_state12 : STD_LOGIC_VECTOR (14 downto 0) := "000100000000000";
    constant ap_ST_fsm_state13 : STD_LOGIC_VECTOR (14 downto 0) := "001000000000000";
    constant ap_ST_fsm_state14 : STD_LOGIC_VECTOR (14 downto 0) := "010000000000000";
    constant ap_ST_fsm_state15 : STD_LOGIC_VECTOR (14 downto 0) := "100000000000000";
    constant ap_const_lv32_0 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000000";
    constant ap_const_boolean_1 : BOOLEAN := true;
    constant ap_const_lv32_6 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000110";
    constant ap_const_lv32_E : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000001110";
    constant ap_const_lv32_3B800000 : STD_LOGIC_VECTOR (31 downto 0) := "00111011100000000000000000000000";
    constant ap_const_lv32_7 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000111";
    constant ap_const_lv32_1 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000001";
    constant ap_const_lv32_2 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000010";
    constant ap_const_lv32_3 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000011";
    constant ap_const_lv32_4 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000100";
    constant ap_const_lv32_5 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000101";
    constant ap_const_lv11_0 : STD_LOGIC_VECTOR (10 downto 0) := "00000000000";

attribute shreg_extract : string;
    signal ap_done_reg : STD_LOGIC := '0';
    signal ap_CS_fsm : STD_LOGIC_VECTOR (14 downto 0) := "000000000000001";
    attribute fsm_encoding : string;
    attribute fsm_encoding of ap_CS_fsm : signal is "none";
    signal ap_CS_fsm_state1 : STD_LOGIC;
    attribute fsm_encoding of ap_CS_fsm_state1 : signal is "none";
    signal grp_fu_37_p1 : STD_LOGIC_VECTOR (31 downto 0);
    signal conv_reg_152 : STD_LOGIC_VECTOR (31 downto 0);
    signal ap_CS_fsm_state7 : STD_LOGIC;
    attribute fsm_encoding of ap_CS_fsm_state7 : signal is "none";
    signal ap_block_state1 : BOOLEAN;
    signal ap_CS_fsm_state15 : STD_LOGIC;
    attribute fsm_encoding of ap_CS_fsm_state15 : signal is "none";
    signal ap_CS_fsm_state8 : STD_LOGIC;
    attribute fsm_encoding of ap_CS_fsm_state8 : signal is "none";
    signal grp_fu_37_p0 : STD_LOGIC_VECTOR (31 downto 0);
    signal grp_fu_32_p2 : STD_LOGIC_VECTOR (31 downto 0);
    signal grp_fu_37_ce : STD_LOGIC;
    signal ap_CS_fsm_state2 : STD_LOGIC;
    attribute fsm_encoding of ap_CS_fsm_state2 : signal is "none";
    signal ap_CS_fsm_state3 : STD_LOGIC;
    attribute fsm_encoding of ap_CS_fsm_state3 : signal is "none";
    signal ap_CS_fsm_state4 : STD_LOGIC;
    attribute fsm_encoding of ap_CS_fsm_state4 : signal is "none";
    signal ap_CS_fsm_state5 : STD_LOGIC;
    attribute fsm_encoding of ap_CS_fsm_state5 : signal is "none";
    signal ap_CS_fsm_state6 : STD_LOGIC;
    attribute fsm_encoding of ap_CS_fsm_state6 : signal is "none";
    signal ap_return_0_preg : STD_LOGIC_VECTOR (10 downto 0) := "00000000000";
    signal ap_return_1_preg : STD_LOGIC_VECTOR (10 downto 0) := "00000000000";
    signal ap_return_2_preg : STD_LOGIC_VECTOR (10 downto 0) := "00000000000";
    signal ap_return_3_preg : STD_LOGIC_VECTOR (10 downto 0) := "00000000000";
    signal ap_return_4_preg : STD_LOGIC_VECTOR (10 downto 0) := "00000000000";
    signal ap_return_5_preg : STD_LOGIC_VECTOR (10 downto 0) := "00000000000";
    signal ap_return_6_preg : STD_LOGIC_VECTOR (10 downto 0) := "00000000000";
    signal ap_return_7_preg : STD_LOGIC_VECTOR (10 downto 0) := "00000000000";
    signal ap_return_8_preg : STD_LOGIC_VECTOR (10 downto 0) := "00000000000";
    signal ap_return_9_preg : STD_LOGIC_VECTOR (10 downto 0) := "00000000000";
    signal ap_return_10_preg : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000000";
    signal ap_return_11_preg : STD_LOGIC_VECTOR (10 downto 0) := "00000000000";
    signal ap_return_12_preg : STD_LOGIC_VECTOR (10 downto 0) := "00000000000";
    signal ap_return_13_preg : STD_LOGIC_VECTOR (10 downto 0) := "00000000000";
    signal ap_return_14_preg : STD_LOGIC_VECTOR (10 downto 0) := "00000000000";
    signal ap_return_15_preg : STD_LOGIC_VECTOR (10 downto 0) := "00000000000";
    signal ap_return_16_preg : STD_LOGIC_VECTOR (10 downto 0) := "00000000000";
    signal ap_NS_fsm : STD_LOGIC_VECTOR (14 downto 0);
    signal ap_ST_fsm_state1_blk : STD_LOGIC;
    signal ap_ST_fsm_state2_blk : STD_LOGIC;
    signal ap_ST_fsm_state3_blk : STD_LOGIC;
    signal ap_ST_fsm_state4_blk : STD_LOGIC;
    signal ap_ST_fsm_state5_blk : STD_LOGIC;
    signal ap_ST_fsm_state6_blk : STD_LOGIC;
    signal ap_ST_fsm_state7_blk : STD_LOGIC;
    signal ap_ST_fsm_state8_blk : STD_LOGIC;
    signal ap_ST_fsm_state9_blk : STD_LOGIC;
    signal ap_ST_fsm_state10_blk : STD_LOGIC;
    signal ap_ST_fsm_state11_blk : STD_LOGIC;
    signal ap_ST_fsm_state12_blk : STD_LOGIC;
    signal ap_ST_fsm_state13_blk : STD_LOGIC;
    signal ap_ST_fsm_state14_blk : STD_LOGIC;
    signal ap_ST_fsm_state15_blk : STD_LOGIC;
    signal ap_ce_reg : STD_LOGIC;

    component ISPPipeline_accel_fmul_32ns_32ns_32_8_max_dsp_1 IS
    generic (
        ID : INTEGER;
        NUM_STAGE : INTEGER;
        din0_WIDTH : INTEGER;
        din1_WIDTH : INTEGER;
        dout_WIDTH : INTEGER );
    port (
        clk : IN STD_LOGIC;
        reset : IN STD_LOGIC;
        din0 : IN STD_LOGIC_VECTOR (31 downto 0);
        din1 : IN STD_LOGIC_VECTOR (31 downto 0);
        ce : IN STD_LOGIC;
        dout : OUT STD_LOGIC_VECTOR (31 downto 0) );
    end component;


    component ISPPipeline_accel_uitofp_32ns_32_7_no_dsp_1 IS
    generic (
        ID : INTEGER;
        NUM_STAGE : INTEGER;
        din0_WIDTH : INTEGER;
        dout_WIDTH : INTEGER );
    port (
        clk : IN STD_LOGIC;
        reset : IN STD_LOGIC;
        din0 : IN STD_LOGIC_VECTOR (31 downto 0);
        ce : IN STD_LOGIC;
        dout : OUT STD_LOGIC_VECTOR (31 downto 0) );
    end component;



begin
    fmul_32ns_32ns_32_8_max_dsp_1_U5 : component ISPPipeline_accel_fmul_32ns_32ns_32_8_max_dsp_1
    generic map (
        ID => 1,
        NUM_STAGE => 8,
        din0_WIDTH => 32,
        din1_WIDTH => 32,
        dout_WIDTH => 32)
    port map (
        clk => ap_clk,
        reset => ap_rst,
        din0 => conv_reg_152,
        din1 => ap_const_lv32_3B800000,
        ce => ap_const_logic_1,
        dout => grp_fu_32_p2);

    uitofp_32ns_32_7_no_dsp_1_U6 : component ISPPipeline_accel_uitofp_32ns_32_7_no_dsp_1
    generic map (
        ID => 1,
        NUM_STAGE => 7,
        din0_WIDTH => 32,
        dout_WIDTH => 32)
    port map (
        clk => ap_clk,
        reset => ap_rst,
        din0 => grp_fu_37_p0,
        ce => grp_fu_37_ce,
        dout => grp_fu_37_p1);





    ap_CS_fsm_assign_proc : process(ap_clk)
    begin
        if (ap_clk'event and ap_clk =  '1') then
            if (ap_rst = '1') then
                ap_CS_fsm <= ap_ST_fsm_state1;
            else
                ap_CS_fsm <= ap_NS_fsm;
            end if;
        end if;
    end process;


    ap_done_reg_assign_proc : process(ap_clk)
    begin
        if (ap_clk'event and ap_clk =  '1') then
            if (ap_rst = '1') then
                ap_done_reg <= ap_const_logic_0;
            else
                if ((ap_continue = ap_const_logic_1)) then 
                    ap_done_reg <= ap_const_logic_0;
                elsif ((ap_const_logic_1 = ap_CS_fsm_state15)) then 
                    ap_done_reg <= ap_const_logic_1;
                end if; 
            end if;
        end if;
    end process;


    ap_return_0_preg_assign_proc : process(ap_clk)
    begin
        if (ap_clk'event and ap_clk =  '1') then
            if (ap_rst = '1') then
                ap_return_0_preg <= ap_const_lv11_0;
            else
                if ((ap_const_logic_1 = ap_CS_fsm_state15)) then 
                    ap_return_0_preg <= height;
                end if; 
            end if;
        end if;
    end process;


    ap_return_10_preg_assign_proc : process(ap_clk)
    begin
        if (ap_clk'event and ap_clk =  '1') then
            if (ap_rst = '1') then
                ap_return_10_preg <= ap_const_lv32_0;
            else
                if ((ap_const_logic_1 = ap_CS_fsm_state15)) then 
                    ap_return_10_preg <= grp_fu_32_p2;
                end if; 
            end if;
        end if;
    end process;


    ap_return_11_preg_assign_proc : process(ap_clk)
    begin
        if (ap_clk'event and ap_clk =  '1') then
            if (ap_rst = '1') then
                ap_return_11_preg <= ap_const_lv11_0;
            else
                if ((ap_const_logic_1 = ap_CS_fsm_state15)) then 
                    ap_return_11_preg <= height;
                end if; 
            end if;
        end if;
    end process;


    ap_return_12_preg_assign_proc : process(ap_clk)
    begin
        if (ap_clk'event and ap_clk =  '1') then
            if (ap_rst = '1') then
                ap_return_12_preg <= ap_const_lv11_0;
            else
                if ((ap_const_logic_1 = ap_CS_fsm_state15)) then 
                    ap_return_12_preg <= width;
                end if; 
            end if;
        end if;
    end process;


    ap_return_13_preg_assign_proc : process(ap_clk)
    begin
        if (ap_clk'event and ap_clk =  '1') then
            if (ap_rst = '1') then
                ap_return_13_preg <= ap_const_lv11_0;
            else
                if ((ap_const_logic_1 = ap_CS_fsm_state15)) then 
                    ap_return_13_preg <= height;
                end if; 
            end if;
        end if;
    end process;


    ap_return_14_preg_assign_proc : process(ap_clk)
    begin
        if (ap_clk'event and ap_clk =  '1') then
            if (ap_rst = '1') then
                ap_return_14_preg <= ap_const_lv11_0;
            else
                if ((ap_const_logic_1 = ap_CS_fsm_state15)) then 
                    ap_return_14_preg <= width;
                end if; 
            end if;
        end if;
    end process;


    ap_return_15_preg_assign_proc : process(ap_clk)
    begin
        if (ap_clk'event and ap_clk =  '1') then
            if (ap_rst = '1') then
                ap_return_15_preg <= ap_const_lv11_0;
            else
                if ((ap_const_logic_1 = ap_CS_fsm_state15)) then 
                    ap_return_15_preg <= height;
                end if; 
            end if;
        end if;
    end process;


    ap_return_16_preg_assign_proc : process(ap_clk)
    begin
        if (ap_clk'event and ap_clk =  '1') then
            if (ap_rst = '1') then
                ap_return_16_preg <= ap_const_lv11_0;
            else
                if ((ap_const_logic_1 = ap_CS_fsm_state15)) then 
                    ap_return_16_preg <= width;
                end if; 
            end if;
        end if;
    end process;


    ap_return_1_preg_assign_proc : process(ap_clk)
    begin
        if (ap_clk'event and ap_clk =  '1') then
            if (ap_rst = '1') then
                ap_return_1_preg <= ap_const_lv11_0;
            else
                if ((ap_const_logic_1 = ap_CS_fsm_state15)) then 
                    ap_return_1_preg <= width;
                end if; 
            end if;
        end if;
    end process;


    ap_return_2_preg_assign_proc : process(ap_clk)
    begin
        if (ap_clk'event and ap_clk =  '1') then
            if (ap_rst = '1') then
                ap_return_2_preg <= ap_const_lv11_0;
            else
                if ((ap_const_logic_1 = ap_CS_fsm_state15)) then 
                    ap_return_2_preg <= height;
                end if; 
            end if;
        end if;
    end process;


    ap_return_3_preg_assign_proc : process(ap_clk)
    begin
        if (ap_clk'event and ap_clk =  '1') then
            if (ap_rst = '1') then
                ap_return_3_preg <= ap_const_lv11_0;
            else
                if ((ap_const_logic_1 = ap_CS_fsm_state15)) then 
                    ap_return_3_preg <= width;
                end if; 
            end if;
        end if;
    end process;


    ap_return_4_preg_assign_proc : process(ap_clk)
    begin
        if (ap_clk'event and ap_clk =  '1') then
            if (ap_rst = '1') then
                ap_return_4_preg <= ap_const_lv11_0;
            else
                if ((ap_const_logic_1 = ap_CS_fsm_state15)) then 
                    ap_return_4_preg <= height;
                end if; 
            end if;
        end if;
    end process;


    ap_return_5_preg_assign_proc : process(ap_clk)
    begin
        if (ap_clk'event and ap_clk =  '1') then
            if (ap_rst = '1') then
                ap_return_5_preg <= ap_const_lv11_0;
            else
                if ((ap_const_logic_1 = ap_CS_fsm_state15)) then 
                    ap_return_5_preg <= width;
                end if; 
            end if;
        end if;
    end process;


    ap_return_6_preg_assign_proc : process(ap_clk)
    begin
        if (ap_clk'event and ap_clk =  '1') then
            if (ap_rst = '1') then
                ap_return_6_preg <= ap_const_lv11_0;
            else
                if ((ap_const_logic_1 = ap_CS_fsm_state15)) then 
                    ap_return_6_preg <= height;
                end if; 
            end if;
        end if;
    end process;


    ap_return_7_preg_assign_proc : process(ap_clk)
    begin
        if (ap_clk'event and ap_clk =  '1') then
            if (ap_rst = '1') then
                ap_return_7_preg <= ap_const_lv11_0;
            else
                if ((ap_const_logic_1 = ap_CS_fsm_state15)) then 
                    ap_return_7_preg <= width;
                end if; 
            end if;
        end if;
    end process;


    ap_return_8_preg_assign_proc : process(ap_clk)
    begin
        if (ap_clk'event and ap_clk =  '1') then
            if (ap_rst = '1') then
                ap_return_8_preg <= ap_const_lv11_0;
            else
                if ((ap_const_logic_1 = ap_CS_fsm_state15)) then 
                    ap_return_8_preg <= height;
                end if; 
            end if;
        end if;
    end process;


    ap_return_9_preg_assign_proc : process(ap_clk)
    begin
        if (ap_clk'event and ap_clk =  '1') then
            if (ap_rst = '1') then
                ap_return_9_preg <= ap_const_lv11_0;
            else
                if ((ap_const_logic_1 = ap_CS_fsm_state15)) then 
                    ap_return_9_preg <= width;
                end if; 
            end if;
        end if;
    end process;

    process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if ((ap_const_logic_1 = ap_CS_fsm_state7)) then
                conv_reg_152 <= grp_fu_37_p1;
            end if;
        end if;
    end process;

    ap_NS_fsm_assign_proc : process (ap_start, ap_done_reg, ap_CS_fsm, ap_CS_fsm_state1)
    begin
        case ap_CS_fsm is
            when ap_ST_fsm_state1 => 
                if ((not(((ap_done_reg = ap_const_logic_1) or (ap_start = ap_const_logic_0))) and (ap_const_logic_1 = ap_CS_fsm_state1))) then
                    ap_NS_fsm <= ap_ST_fsm_state2;
                else
                    ap_NS_fsm <= ap_ST_fsm_state1;
                end if;
            when ap_ST_fsm_state2 => 
                ap_NS_fsm <= ap_ST_fsm_state3;
            when ap_ST_fsm_state3 => 
                ap_NS_fsm <= ap_ST_fsm_state4;
            when ap_ST_fsm_state4 => 
                ap_NS_fsm <= ap_ST_fsm_state5;
            when ap_ST_fsm_state5 => 
                ap_NS_fsm <= ap_ST_fsm_state6;
            when ap_ST_fsm_state6 => 
                ap_NS_fsm <= ap_ST_fsm_state7;
            when ap_ST_fsm_state7 => 
                ap_NS_fsm <= ap_ST_fsm_state8;
            when ap_ST_fsm_state8 => 
                ap_NS_fsm <= ap_ST_fsm_state9;
            when ap_ST_fsm_state9 => 
                ap_NS_fsm <= ap_ST_fsm_state10;
            when ap_ST_fsm_state10 => 
                ap_NS_fsm <= ap_ST_fsm_state11;
            when ap_ST_fsm_state11 => 
                ap_NS_fsm <= ap_ST_fsm_state12;
            when ap_ST_fsm_state12 => 
                ap_NS_fsm <= ap_ST_fsm_state13;
            when ap_ST_fsm_state13 => 
                ap_NS_fsm <= ap_ST_fsm_state14;
            when ap_ST_fsm_state14 => 
                ap_NS_fsm <= ap_ST_fsm_state15;
            when ap_ST_fsm_state15 => 
                ap_NS_fsm <= ap_ST_fsm_state1;
            when others =>  
                ap_NS_fsm <= "XXXXXXXXXXXXXXX";
        end case;
    end process;
    ap_CS_fsm_state1 <= ap_CS_fsm(0);
    ap_CS_fsm_state15 <= ap_CS_fsm(14);
    ap_CS_fsm_state2 <= ap_CS_fsm(1);
    ap_CS_fsm_state3 <= ap_CS_fsm(2);
    ap_CS_fsm_state4 <= ap_CS_fsm(3);
    ap_CS_fsm_state5 <= ap_CS_fsm(4);
    ap_CS_fsm_state6 <= ap_CS_fsm(5);
    ap_CS_fsm_state7 <= ap_CS_fsm(6);
    ap_CS_fsm_state8 <= ap_CS_fsm(7);
    ap_ST_fsm_state10_blk <= ap_const_logic_0;
    ap_ST_fsm_state11_blk <= ap_const_logic_0;
    ap_ST_fsm_state12_blk <= ap_const_logic_0;
    ap_ST_fsm_state13_blk <= ap_const_logic_0;
    ap_ST_fsm_state14_blk <= ap_const_logic_0;
    ap_ST_fsm_state15_blk <= ap_const_logic_0;

    ap_ST_fsm_state1_blk_assign_proc : process(ap_start, ap_done_reg)
    begin
        if (((ap_done_reg = ap_const_logic_1) or (ap_start = ap_const_logic_0))) then 
            ap_ST_fsm_state1_blk <= ap_const_logic_1;
        else 
            ap_ST_fsm_state1_blk <= ap_const_logic_0;
        end if; 
    end process;

    ap_ST_fsm_state2_blk <= ap_const_logic_0;
    ap_ST_fsm_state3_blk <= ap_const_logic_0;
    ap_ST_fsm_state4_blk <= ap_const_logic_0;
    ap_ST_fsm_state5_blk <= ap_const_logic_0;
    ap_ST_fsm_state6_blk <= ap_const_logic_0;
    ap_ST_fsm_state7_blk <= ap_const_logic_0;
    ap_ST_fsm_state8_blk <= ap_const_logic_0;
    ap_ST_fsm_state9_blk <= ap_const_logic_0;

    ap_block_state1_assign_proc : process(ap_start, ap_done_reg)
    begin
                ap_block_state1 <= ((ap_done_reg = ap_const_logic_1) or (ap_start = ap_const_logic_0));
    end process;


    ap_done_assign_proc : process(ap_done_reg, ap_CS_fsm_state15)
    begin
        if ((ap_const_logic_1 = ap_CS_fsm_state15)) then 
            ap_done <= ap_const_logic_1;
        else 
            ap_done <= ap_done_reg;
        end if; 
    end process;


    ap_idle_assign_proc : process(ap_start, ap_CS_fsm_state1)
    begin
        if (((ap_start = ap_const_logic_0) and (ap_const_logic_1 = ap_CS_fsm_state1))) then 
            ap_idle <= ap_const_logic_1;
        else 
            ap_idle <= ap_const_logic_0;
        end if; 
    end process;


    ap_ready_assign_proc : process(ap_CS_fsm_state15)
    begin
        if ((ap_const_logic_1 = ap_CS_fsm_state15)) then 
            ap_ready <= ap_const_logic_1;
        else 
            ap_ready <= ap_const_logic_0;
        end if; 
    end process;


    ap_return_0_assign_proc : process(height, ap_CS_fsm_state15, ap_return_0_preg)
    begin
        if ((ap_const_logic_1 = ap_CS_fsm_state15)) then 
            ap_return_0 <= height;
        else 
            ap_return_0 <= ap_return_0_preg;
        end if; 
    end process;


    ap_return_1_assign_proc : process(width, ap_CS_fsm_state15, ap_return_1_preg)
    begin
        if ((ap_const_logic_1 = ap_CS_fsm_state15)) then 
            ap_return_1 <= width;
        else 
            ap_return_1 <= ap_return_1_preg;
        end if; 
    end process;


    ap_return_10_assign_proc : process(ap_CS_fsm_state15, grp_fu_32_p2, ap_return_10_preg)
    begin
        if ((ap_const_logic_1 = ap_CS_fsm_state15)) then 
            ap_return_10 <= grp_fu_32_p2;
        else 
            ap_return_10 <= ap_return_10_preg;
        end if; 
    end process;


    ap_return_11_assign_proc : process(height, ap_CS_fsm_state15, ap_return_11_preg)
    begin
        if ((ap_const_logic_1 = ap_CS_fsm_state15)) then 
            ap_return_11 <= height;
        else 
            ap_return_11 <= ap_return_11_preg;
        end if; 
    end process;


    ap_return_12_assign_proc : process(width, ap_CS_fsm_state15, ap_return_12_preg)
    begin
        if ((ap_const_logic_1 = ap_CS_fsm_state15)) then 
            ap_return_12 <= width;
        else 
            ap_return_12 <= ap_return_12_preg;
        end if; 
    end process;


    ap_return_13_assign_proc : process(height, ap_CS_fsm_state15, ap_return_13_preg)
    begin
        if ((ap_const_logic_1 = ap_CS_fsm_state15)) then 
            ap_return_13 <= height;
        else 
            ap_return_13 <= ap_return_13_preg;
        end if; 
    end process;


    ap_return_14_assign_proc : process(width, ap_CS_fsm_state15, ap_return_14_preg)
    begin
        if ((ap_const_logic_1 = ap_CS_fsm_state15)) then 
            ap_return_14 <= width;
        else 
            ap_return_14 <= ap_return_14_preg;
        end if; 
    end process;


    ap_return_15_assign_proc : process(height, ap_CS_fsm_state15, ap_return_15_preg)
    begin
        if ((ap_const_logic_1 = ap_CS_fsm_state15)) then 
            ap_return_15 <= height;
        else 
            ap_return_15 <= ap_return_15_preg;
        end if; 
    end process;


    ap_return_16_assign_proc : process(width, ap_CS_fsm_state15, ap_return_16_preg)
    begin
        if ((ap_const_logic_1 = ap_CS_fsm_state15)) then 
            ap_return_16 <= width;
        else 
            ap_return_16 <= ap_return_16_preg;
        end if; 
    end process;


    ap_return_2_assign_proc : process(height, ap_CS_fsm_state15, ap_return_2_preg)
    begin
        if ((ap_const_logic_1 = ap_CS_fsm_state15)) then 
            ap_return_2 <= height;
        else 
            ap_return_2 <= ap_return_2_preg;
        end if; 
    end process;


    ap_return_3_assign_proc : process(width, ap_CS_fsm_state15, ap_return_3_preg)
    begin
        if ((ap_const_logic_1 = ap_CS_fsm_state15)) then 
            ap_return_3 <= width;
        else 
            ap_return_3 <= ap_return_3_preg;
        end if; 
    end process;


    ap_return_4_assign_proc : process(height, ap_CS_fsm_state15, ap_return_4_preg)
    begin
        if ((ap_const_logic_1 = ap_CS_fsm_state15)) then 
            ap_return_4 <= height;
        else 
            ap_return_4 <= ap_return_4_preg;
        end if; 
    end process;


    ap_return_5_assign_proc : process(width, ap_CS_fsm_state15, ap_return_5_preg)
    begin
        if ((ap_const_logic_1 = ap_CS_fsm_state15)) then 
            ap_return_5 <= width;
        else 
            ap_return_5 <= ap_return_5_preg;
        end if; 
    end process;


    ap_return_6_assign_proc : process(height, ap_CS_fsm_state15, ap_return_6_preg)
    begin
        if ((ap_const_logic_1 = ap_CS_fsm_state15)) then 
            ap_return_6 <= height;
        else 
            ap_return_6 <= ap_return_6_preg;
        end if; 
    end process;


    ap_return_7_assign_proc : process(width, ap_CS_fsm_state15, ap_return_7_preg)
    begin
        if ((ap_const_logic_1 = ap_CS_fsm_state15)) then 
            ap_return_7 <= width;
        else 
            ap_return_7 <= ap_return_7_preg;
        end if; 
    end process;


    ap_return_8_assign_proc : process(height, ap_CS_fsm_state15, ap_return_8_preg)
    begin
        if ((ap_const_logic_1 = ap_CS_fsm_state15)) then 
            ap_return_8 <= height;
        else 
            ap_return_8 <= ap_return_8_preg;
        end if; 
    end process;


    ap_return_9_assign_proc : process(width, ap_CS_fsm_state15, ap_return_9_preg)
    begin
        if ((ap_const_logic_1 = ap_CS_fsm_state15)) then 
            ap_return_9 <= width;
        else 
            ap_return_9 <= ap_return_9_preg;
        end if; 
    end process;


    grp_fu_37_ce_assign_proc : process(ap_start, ap_done_reg, ap_CS_fsm_state1, ap_CS_fsm_state7, ap_CS_fsm_state2, ap_CS_fsm_state3, ap_CS_fsm_state4, ap_CS_fsm_state5, ap_CS_fsm_state6)
    begin
        if (((ap_const_logic_1 = ap_CS_fsm_state6) or (ap_const_logic_1 = ap_CS_fsm_state5) or (ap_const_logic_1 = ap_CS_fsm_state4) or (ap_const_logic_1 = ap_CS_fsm_state3) or (ap_const_logic_1 = ap_CS_fsm_state2) or (ap_const_logic_1 = ap_CS_fsm_state7) or (not(((ap_done_reg = ap_const_logic_1) or (ap_start = ap_const_logic_0))) and (ap_const_logic_1 = ap_CS_fsm_state1)))) then 
            grp_fu_37_ce <= ap_const_logic_1;
        else 
            grp_fu_37_ce <= ap_const_logic_0;
        end if; 
    end process;

    grp_fu_37_p0 <= std_logic_vector(IEEE.numeric_std.resize(unsigned(pawb),32));
end behav;