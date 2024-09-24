-- ==============================================================
-- RTL generated by Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2022.1 (64-bit)
-- Version: 2022.1
-- Copyright (C) Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
-- 
-- ===========================================================

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity ISPPipeline_accel_AXIVideo2BayerMat_13_1080_1920_1_Pipeline_loop_col_zxi2mat is
port (
    ap_clk : IN STD_LOGIC;
    ap_rst : IN STD_LOGIC;
    ap_start : IN STD_LOGIC;
    ap_done : OUT STD_LOGIC;
    ap_idle : OUT STD_LOGIC;
    ap_ready : OUT STD_LOGIC;
    s_axis_video_TVALID : IN STD_LOGIC;
    imgInput1_data238_din : OUT STD_LOGIC_VECTOR (9 downto 0);
    imgInput1_data238_num_data_valid : IN STD_LOGIC_VECTOR (1 downto 0);
    imgInput1_data238_fifo_cap : IN STD_LOGIC_VECTOR (1 downto 0);
    imgInput1_data238_full_n : IN STD_LOGIC;
    imgInput1_data238_write : OUT STD_LOGIC;
    start_2 : IN STD_LOGIC_VECTOR (0 downto 0);
    axi_data_V_2 : IN STD_LOGIC_VECTOR (15 downto 0);
    axi_last_V_2 : IN STD_LOGIC_VECTOR (0 downto 0);
    p_read1 : IN STD_LOGIC_VECTOR (10 downto 0);
    s_axis_video_TDATA : IN STD_LOGIC_VECTOR (15 downto 0);
    s_axis_video_TREADY : OUT STD_LOGIC;
    s_axis_video_TKEEP : IN STD_LOGIC_VECTOR (1 downto 0);
    s_axis_video_TSTRB : IN STD_LOGIC_VECTOR (1 downto 0);
    s_axis_video_TUSER : IN STD_LOGIC_VECTOR (0 downto 0);
    s_axis_video_TLAST : IN STD_LOGIC_VECTOR (0 downto 0);
    s_axis_video_TID : IN STD_LOGIC_VECTOR (0 downto 0);
    s_axis_video_TDEST : IN STD_LOGIC_VECTOR (0 downto 0);
    last_out : OUT STD_LOGIC_VECTOR (0 downto 0);
    last_out_ap_vld : OUT STD_LOGIC;
    axi_data_V_3_out : OUT STD_LOGIC_VECTOR (15 downto 0);
    axi_data_V_3_out_ap_vld : OUT STD_LOGIC );
end;


architecture behav of ISPPipeline_accel_AXIVideo2BayerMat_13_1080_1920_1_Pipeline_loop_col_zxi2mat is 
    constant ap_const_logic_1 : STD_LOGIC := '1';
    constant ap_const_logic_0 : STD_LOGIC := '0';
    constant ap_ST_fsm_pp0_stage0 : STD_LOGIC_VECTOR (0 downto 0) := "1";
    constant ap_const_lv32_0 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000000";
    constant ap_const_boolean_1 : BOOLEAN := true;
    constant ap_const_lv1_0 : STD_LOGIC_VECTOR (0 downto 0) := "0";
    constant ap_const_boolean_0 : BOOLEAN := false;
    constant ap_const_lv1_1 : STD_LOGIC_VECTOR (0 downto 0) := "1";
    constant ap_const_lv11_0 : STD_LOGIC_VECTOR (10 downto 0) := "00000000000";
    constant ap_const_lv11_1 : STD_LOGIC_VECTOR (10 downto 0) := "00000000001";

attribute shreg_extract : string;
    signal ap_CS_fsm : STD_LOGIC_VECTOR (0 downto 0) := "1";
    attribute fsm_encoding : string;
    attribute fsm_encoding of ap_CS_fsm : signal is "none";
    signal ap_CS_fsm_pp0_stage0 : STD_LOGIC;
    attribute fsm_encoding of ap_CS_fsm_pp0_stage0 : signal is "none";
    signal ap_enable_reg_pp0_iter0 : STD_LOGIC;
    signal ap_enable_reg_pp0_iter1 : STD_LOGIC := '0';
    signal ap_idle_pp0 : STD_LOGIC;
    signal icmp_ln67_fu_191_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal or_ln74_fu_203_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal ap_predicate_op35_read_state1 : BOOLEAN;
    signal ap_block_state1_pp0_stage0_iter0 : BOOLEAN;
    signal icmp_ln67_reg_269 : STD_LOGIC_VECTOR (0 downto 0);
    signal ap_block_state2_pp0_stage0_iter1 : BOOLEAN;
    signal ap_block_pp0_stage0_subdone : BOOLEAN;
    signal ap_condition_exit_pp0_iter0_stage0 : STD_LOGIC;
    signal ap_loop_exit_ready : STD_LOGIC;
    signal ap_ready_int : STD_LOGIC;
    signal imgInput1_data238_blk_n : STD_LOGIC;
    signal ap_block_pp0_stage0 : BOOLEAN;
    signal s_axis_video_TDATA_blk_n : STD_LOGIC;
    signal last_reg_151 : STD_LOGIC_VECTOR (0 downto 0);
    signal ap_block_pp0_stage0_11001 : BOOLEAN;
    signal ap_phi_mux_last_phi_fu_154_p4 : STD_LOGIC_VECTOR (0 downto 0);
    signal ap_loop_init : STD_LOGIC;
    signal ap_phi_mux_start_phi_fu_165_p4 : STD_LOGIC_VECTOR (0 downto 0);
    signal j_3_fu_76 : STD_LOGIC_VECTOR (10 downto 0);
    signal j_4_fu_197_p2 : STD_LOGIC_VECTOR (10 downto 0);
    signal ap_sig_allocacmp_j : STD_LOGIC_VECTOR (10 downto 0);
    signal axi_last_V_fu_80 : STD_LOGIC_VECTOR (0 downto 0);
    signal axi_data_V_fu_84 : STD_LOGIC_VECTOR (15 downto 0);
    signal ap_block_pp0_stage0_01001 : BOOLEAN;
    signal ap_done_reg : STD_LOGIC := '0';
    signal ap_continue_int : STD_LOGIC;
    signal ap_done_int : STD_LOGIC;
    signal ap_NS_fsm : STD_LOGIC_VECTOR (0 downto 0);
    signal ap_enable_pp0 : STD_LOGIC;
    signal ap_start_int : STD_LOGIC;
    signal ap_condition_221 : BOOLEAN;
    signal ap_condition_224 : BOOLEAN;
    signal ap_condition_229 : BOOLEAN;
    signal ap_ce_reg : STD_LOGIC;

    component ISPPipeline_accel_flow_control_loop_pipe_sequential_init IS
    port (
        ap_clk : IN STD_LOGIC;
        ap_rst : IN STD_LOGIC;
        ap_start : IN STD_LOGIC;
        ap_ready : OUT STD_LOGIC;
        ap_done : OUT STD_LOGIC;
        ap_start_int : OUT STD_LOGIC;
        ap_loop_init : OUT STD_LOGIC;
        ap_ready_int : IN STD_LOGIC;
        ap_loop_exit_ready : IN STD_LOGIC;
        ap_loop_exit_done : IN STD_LOGIC;
        ap_continue_int : OUT STD_LOGIC;
        ap_done_int : IN STD_LOGIC );
    end component;



begin
    flow_control_loop_pipe_sequential_init_U : component ISPPipeline_accel_flow_control_loop_pipe_sequential_init
    port map (
        ap_clk => ap_clk,
        ap_rst => ap_rst,
        ap_start => ap_start,
        ap_ready => ap_ready,
        ap_done => ap_done,
        ap_start_int => ap_start_int,
        ap_loop_init => ap_loop_init,
        ap_ready_int => ap_ready_int,
        ap_loop_exit_ready => ap_condition_exit_pp0_iter0_stage0,
        ap_loop_exit_done => ap_done_int,
        ap_continue_int => ap_continue_int,
        ap_done_int => ap_done_int);





    ap_CS_fsm_assign_proc : process(ap_clk)
    begin
        if (ap_clk'event and ap_clk =  '1') then
            if (ap_rst = '1') then
                ap_CS_fsm <= ap_ST_fsm_pp0_stage0;
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
                if ((ap_continue_int = ap_const_logic_1)) then 
                    ap_done_reg <= ap_const_logic_0;
                elsif (((ap_loop_exit_ready = ap_const_logic_1) and (ap_const_boolean_0 = ap_block_pp0_stage0_subdone) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0))) then 
                    ap_done_reg <= ap_const_logic_1;
                end if; 
            end if;
        end if;
    end process;


    ap_enable_reg_pp0_iter1_assign_proc : process(ap_clk)
    begin
        if (ap_clk'event and ap_clk =  '1') then
            if (ap_rst = '1') then
                ap_enable_reg_pp0_iter1 <= ap_const_logic_0;
            else
                if ((ap_const_logic_1 = ap_condition_exit_pp0_iter0_stage0)) then 
                    ap_enable_reg_pp0_iter1 <= ap_const_logic_0;
                elsif (((ap_const_boolean_0 = ap_block_pp0_stage0_subdone) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0))) then 
                    ap_enable_reg_pp0_iter1 <= ap_start_int;
                end if; 
            end if;
        end if;
    end process;


    axi_data_V_fu_84_assign_proc : process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((ap_const_boolean_0 = ap_block_pp0_stage0_11001) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0))) then
                if ((ap_const_boolean_1 = ap_condition_224)) then 
                    axi_data_V_fu_84 <= s_axis_video_TDATA;
                elsif ((ap_loop_init = ap_const_logic_1)) then 
                    axi_data_V_fu_84 <= axi_data_V_2;
                end if;
            end if; 
        end if;
    end process;

    axi_last_V_fu_80_assign_proc : process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((ap_const_boolean_0 = ap_block_pp0_stage0_11001) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0))) then
                if ((ap_const_boolean_1 = ap_condition_224)) then 
                    axi_last_V_fu_80 <= s_axis_video_TLAST;
                elsif ((ap_loop_init = ap_const_logic_1)) then 
                    axi_last_V_fu_80 <= axi_last_V_2;
                end if;
            end if; 
        end if;
    end process;

    j_3_fu_76_assign_proc : process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((ap_const_boolean_0 = ap_block_pp0_stage0_11001) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0))) then
                if (((icmp_ln67_fu_191_p2 = ap_const_lv1_0) and (ap_start_int = ap_const_logic_1))) then 
                    j_3_fu_76 <= j_4_fu_197_p2;
                elsif ((ap_loop_init = ap_const_logic_1)) then 
                    j_3_fu_76 <= ap_const_lv11_0;
                end if;
            end if; 
        end if;
    end process;

    last_reg_151_assign_proc : process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if ((ap_const_logic_1 = ap_CS_fsm_pp0_stage0)) then
                if (((ap_const_boolean_0 = ap_block_pp0_stage0_subdone) and (ap_loop_init = ap_const_logic_1))) then 
                    last_reg_151 <= ap_const_lv1_0;
                elsif ((ap_const_boolean_1 = ap_condition_229)) then 
                    last_reg_151 <= axi_last_V_fu_80;
                end if;
            end if; 
        end if;
    end process;
    process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((ap_const_boolean_0 = ap_block_pp0_stage0_11001) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0))) then
                icmp_ln67_reg_269 <= icmp_ln67_fu_191_p2;
            end if;
        end if;
    end process;

    ap_NS_fsm_assign_proc : process (ap_CS_fsm)
    begin
        case ap_CS_fsm is
            when ap_ST_fsm_pp0_stage0 => 
                ap_NS_fsm <= ap_ST_fsm_pp0_stage0;
            when others =>  
                ap_NS_fsm <= "X";
        end case;
    end process;
    ap_CS_fsm_pp0_stage0 <= ap_CS_fsm(0);
        ap_block_pp0_stage0 <= not((ap_const_boolean_1 = ap_const_boolean_1));

    ap_block_pp0_stage0_01001_assign_proc : process(ap_enable_reg_pp0_iter1, s_axis_video_TVALID, ap_predicate_op35_read_state1, imgInput1_data238_full_n, icmp_ln67_reg_269, ap_start_int)
    begin
                ap_block_pp0_stage0_01001 <= (((icmp_ln67_reg_269 = ap_const_lv1_0) and (imgInput1_data238_full_n = ap_const_logic_0) and (ap_enable_reg_pp0_iter1 = ap_const_logic_1)) or ((ap_predicate_op35_read_state1 = ap_const_boolean_1) and (s_axis_video_TVALID = ap_const_logic_0) and (ap_start_int = ap_const_logic_1)));
    end process;


    ap_block_pp0_stage0_11001_assign_proc : process(ap_enable_reg_pp0_iter1, s_axis_video_TVALID, ap_predicate_op35_read_state1, imgInput1_data238_full_n, icmp_ln67_reg_269, ap_start_int)
    begin
                ap_block_pp0_stage0_11001 <= (((icmp_ln67_reg_269 = ap_const_lv1_0) and (imgInput1_data238_full_n = ap_const_logic_0) and (ap_enable_reg_pp0_iter1 = ap_const_logic_1)) or ((ap_predicate_op35_read_state1 = ap_const_boolean_1) and (s_axis_video_TVALID = ap_const_logic_0) and (ap_start_int = ap_const_logic_1)));
    end process;


    ap_block_pp0_stage0_subdone_assign_proc : process(ap_enable_reg_pp0_iter1, s_axis_video_TVALID, ap_predicate_op35_read_state1, imgInput1_data238_full_n, icmp_ln67_reg_269, ap_start_int)
    begin
                ap_block_pp0_stage0_subdone <= (((icmp_ln67_reg_269 = ap_const_lv1_0) and (imgInput1_data238_full_n = ap_const_logic_0) and (ap_enable_reg_pp0_iter1 = ap_const_logic_1)) or ((ap_predicate_op35_read_state1 = ap_const_boolean_1) and (s_axis_video_TVALID = ap_const_logic_0) and (ap_start_int = ap_const_logic_1)));
    end process;


    ap_block_state1_pp0_stage0_iter0_assign_proc : process(s_axis_video_TVALID, ap_predicate_op35_read_state1)
    begin
                ap_block_state1_pp0_stage0_iter0 <= ((ap_predicate_op35_read_state1 = ap_const_boolean_1) and (s_axis_video_TVALID = ap_const_logic_0));
    end process;


    ap_block_state2_pp0_stage0_iter1_assign_proc : process(imgInput1_data238_full_n, icmp_ln67_reg_269)
    begin
                ap_block_state2_pp0_stage0_iter1 <= ((icmp_ln67_reg_269 = ap_const_lv1_0) and (imgInput1_data238_full_n = ap_const_logic_0));
    end process;


    ap_condition_221_assign_proc : process(ap_enable_reg_pp0_iter1, icmp_ln67_reg_269, ap_block_pp0_stage0)
    begin
                ap_condition_221 <= ((ap_const_boolean_0 = ap_block_pp0_stage0) and (icmp_ln67_reg_269 = ap_const_lv1_0) and (ap_enable_reg_pp0_iter1 = ap_const_logic_1));
    end process;


    ap_condition_224_assign_proc : process(icmp_ln67_fu_191_p2, or_ln74_fu_203_p2, ap_start_int)
    begin
                ap_condition_224 <= ((or_ln74_fu_203_p2 = ap_const_lv1_0) and (icmp_ln67_fu_191_p2 = ap_const_lv1_0) and (ap_start_int = ap_const_logic_1));
    end process;


    ap_condition_229_assign_proc : process(ap_enable_reg_pp0_iter1, icmp_ln67_reg_269, ap_block_pp0_stage0_11001)
    begin
                ap_condition_229 <= ((ap_const_boolean_0 = ap_block_pp0_stage0_11001) and (icmp_ln67_reg_269 = ap_const_lv1_0) and (ap_enable_reg_pp0_iter1 = ap_const_logic_1));
    end process;


    ap_condition_exit_pp0_iter0_stage0_assign_proc : process(ap_CS_fsm_pp0_stage0, icmp_ln67_fu_191_p2, ap_block_pp0_stage0_subdone, ap_start_int)
    begin
        if (((ap_const_boolean_0 = ap_block_pp0_stage0_subdone) and (icmp_ln67_fu_191_p2 = ap_const_lv1_1) and (ap_start_int = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0))) then 
            ap_condition_exit_pp0_iter0_stage0 <= ap_const_logic_1;
        else 
            ap_condition_exit_pp0_iter0_stage0 <= ap_const_logic_0;
        end if; 
    end process;


    ap_done_int_assign_proc : process(ap_CS_fsm_pp0_stage0, ap_block_pp0_stage0_subdone, ap_loop_exit_ready, ap_done_reg)
    begin
        if (((ap_loop_exit_ready = ap_const_logic_1) and (ap_const_boolean_0 = ap_block_pp0_stage0_subdone) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0))) then 
            ap_done_int <= ap_const_logic_1;
        else 
            ap_done_int <= ap_done_reg;
        end if; 
    end process;

    ap_enable_pp0 <= (ap_idle_pp0 xor ap_const_logic_1);
    ap_enable_reg_pp0_iter0 <= ap_start_int;

    ap_idle_assign_proc : process(ap_CS_fsm_pp0_stage0, ap_idle_pp0, ap_start_int)
    begin
        if (((ap_idle_pp0 = ap_const_logic_1) and (ap_start_int = ap_const_logic_0) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0))) then 
            ap_idle <= ap_const_logic_1;
        else 
            ap_idle <= ap_const_logic_0;
        end if; 
    end process;


    ap_idle_pp0_assign_proc : process(ap_enable_reg_pp0_iter0, ap_enable_reg_pp0_iter1)
    begin
        if (((ap_enable_reg_pp0_iter1 = ap_const_logic_0) and (ap_enable_reg_pp0_iter0 = ap_const_logic_0))) then 
            ap_idle_pp0 <= ap_const_logic_1;
        else 
            ap_idle_pp0 <= ap_const_logic_0;
        end if; 
    end process;

    ap_loop_exit_ready <= ap_condition_exit_pp0_iter0_stage0;

    ap_phi_mux_last_phi_fu_154_p4_assign_proc : process(ap_CS_fsm_pp0_stage0, last_reg_151, ap_loop_init, axi_last_V_fu_80, ap_condition_221)
    begin
        if ((ap_const_logic_1 = ap_CS_fsm_pp0_stage0)) then
            if ((ap_loop_init = ap_const_logic_1)) then 
                ap_phi_mux_last_phi_fu_154_p4 <= ap_const_lv1_0;
            elsif ((ap_const_boolean_1 = ap_condition_221)) then 
                ap_phi_mux_last_phi_fu_154_p4 <= axi_last_V_fu_80;
            else 
                ap_phi_mux_last_phi_fu_154_p4 <= last_reg_151;
            end if;
        else 
            ap_phi_mux_last_phi_fu_154_p4 <= last_reg_151;
        end if; 
    end process;


    ap_phi_mux_start_phi_fu_165_p4_assign_proc : process(ap_CS_fsm_pp0_stage0, start_2, ap_loop_init, ap_condition_221)
    begin
        if ((ap_const_logic_1 = ap_CS_fsm_pp0_stage0)) then
            if ((ap_loop_init = ap_const_logic_1)) then 
                ap_phi_mux_start_phi_fu_165_p4 <= start_2;
            elsif ((ap_const_boolean_1 = ap_condition_221)) then 
                ap_phi_mux_start_phi_fu_165_p4 <= ap_const_lv1_0;
            else 
                ap_phi_mux_start_phi_fu_165_p4 <= start_2;
            end if;
        else 
            ap_phi_mux_start_phi_fu_165_p4 <= start_2;
        end if; 
    end process;


    ap_predicate_op35_read_state1_assign_proc : process(icmp_ln67_fu_191_p2, or_ln74_fu_203_p2)
    begin
                ap_predicate_op35_read_state1 <= ((or_ln74_fu_203_p2 = ap_const_lv1_0) and (icmp_ln67_fu_191_p2 = ap_const_lv1_0));
    end process;


    ap_ready_int_assign_proc : process(ap_CS_fsm_pp0_stage0, ap_block_pp0_stage0_subdone, ap_start_int)
    begin
        if (((ap_const_boolean_0 = ap_block_pp0_stage0_subdone) and (ap_start_int = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0))) then 
            ap_ready_int <= ap_const_logic_1;
        else 
            ap_ready_int <= ap_const_logic_0;
        end if; 
    end process;


    ap_sig_allocacmp_j_assign_proc : process(ap_CS_fsm_pp0_stage0, ap_block_pp0_stage0, ap_loop_init, j_3_fu_76)
    begin
        if (((ap_const_boolean_0 = ap_block_pp0_stage0) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0) and (ap_loop_init = ap_const_logic_1))) then 
            ap_sig_allocacmp_j <= ap_const_lv11_0;
        else 
            ap_sig_allocacmp_j <= j_3_fu_76;
        end if; 
    end process;

    axi_data_V_3_out <= axi_data_V_fu_84;

    axi_data_V_3_out_ap_vld_assign_proc : process(ap_CS_fsm_pp0_stage0, icmp_ln67_fu_191_p2, ap_block_pp0_stage0_11001)
    begin
        if (((ap_const_boolean_0 = ap_block_pp0_stage0_11001) and (icmp_ln67_fu_191_p2 = ap_const_lv1_1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0))) then 
            axi_data_V_3_out_ap_vld <= ap_const_logic_1;
        else 
            axi_data_V_3_out_ap_vld <= ap_const_logic_0;
        end if; 
    end process;

    icmp_ln67_fu_191_p2 <= "1" when (ap_sig_allocacmp_j = p_read1) else "0";

    imgInput1_data238_blk_n_assign_proc : process(ap_CS_fsm_pp0_stage0, ap_enable_reg_pp0_iter1, imgInput1_data238_full_n, icmp_ln67_reg_269, ap_block_pp0_stage0)
    begin
        if (((ap_const_boolean_0 = ap_block_pp0_stage0) and (icmp_ln67_reg_269 = ap_const_lv1_0) and (ap_enable_reg_pp0_iter1 = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0))) then 
            imgInput1_data238_blk_n <= imgInput1_data238_full_n;
        else 
            imgInput1_data238_blk_n <= ap_const_logic_1;
        end if; 
    end process;

    imgInput1_data238_din <= axi_data_V_fu_84(10 - 1 downto 0);

    imgInput1_data238_write_assign_proc : process(ap_CS_fsm_pp0_stage0, ap_enable_reg_pp0_iter1, icmp_ln67_reg_269, ap_block_pp0_stage0_11001)
    begin
        if (((ap_const_boolean_0 = ap_block_pp0_stage0_11001) and (icmp_ln67_reg_269 = ap_const_lv1_0) and (ap_enable_reg_pp0_iter1 = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0))) then 
            imgInput1_data238_write <= ap_const_logic_1;
        else 
            imgInput1_data238_write <= ap_const_logic_0;
        end if; 
    end process;

    j_4_fu_197_p2 <= std_logic_vector(unsigned(ap_sig_allocacmp_j) + unsigned(ap_const_lv11_1));
    last_out <= last_reg_151;

    last_out_ap_vld_assign_proc : process(ap_CS_fsm_pp0_stage0, icmp_ln67_fu_191_p2, ap_block_pp0_stage0_11001)
    begin
        if (((ap_const_boolean_0 = ap_block_pp0_stage0_11001) and (icmp_ln67_fu_191_p2 = ap_const_lv1_1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0))) then 
            last_out_ap_vld <= ap_const_logic_1;
        else 
            last_out_ap_vld <= ap_const_logic_0;
        end if; 
    end process;

    or_ln74_fu_203_p2 <= (ap_phi_mux_start_phi_fu_165_p4 or ap_phi_mux_last_phi_fu_154_p4);

    s_axis_video_TDATA_blk_n_assign_proc : process(ap_CS_fsm_pp0_stage0, s_axis_video_TVALID, ap_predicate_op35_read_state1, ap_block_pp0_stage0, ap_start_int)
    begin
        if (((ap_const_boolean_0 = ap_block_pp0_stage0) and (ap_predicate_op35_read_state1 = ap_const_boolean_1) and (ap_start_int = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0))) then 
            s_axis_video_TDATA_blk_n <= s_axis_video_TVALID;
        else 
            s_axis_video_TDATA_blk_n <= ap_const_logic_1;
        end if; 
    end process;


    s_axis_video_TREADY_assign_proc : process(ap_CS_fsm_pp0_stage0, ap_predicate_op35_read_state1, ap_block_pp0_stage0_11001, ap_start_int)
    begin
        if (((ap_const_boolean_0 = ap_block_pp0_stage0_11001) and (ap_predicate_op35_read_state1 = ap_const_boolean_1) and (ap_start_int = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0))) then 
            s_axis_video_TREADY <= ap_const_logic_1;
        else 
            s_axis_video_TREADY <= ap_const_logic_0;
        end if; 
    end process;

end behav;