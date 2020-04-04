-- urs_0.vhd

-- Generated using ACDS version 18.0 614

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity urs_0 is
	port (
		clk_clk            : in    std_logic                     := '0';             --      clk.clk
		memory_mem_a       : out   std_logic_vector(14 downto 0);                    --   memory.mem_a
		memory_mem_ba      : out   std_logic_vector(2 downto 0);                     --         .mem_ba
		memory_mem_ck      : out   std_logic;                                        --         .mem_ck
		memory_mem_ck_n    : out   std_logic;                                        --         .mem_ck_n
		memory_mem_cke     : out   std_logic;                                        --         .mem_cke
		memory_mem_cs_n    : out   std_logic;                                        --         .mem_cs_n
		memory_mem_ras_n   : out   std_logic;                                        --         .mem_ras_n
		memory_mem_cas_n   : out   std_logic;                                        --         .mem_cas_n
		memory_mem_we_n    : out   std_logic;                                        --         .mem_we_n
		memory_mem_reset_n : out   std_logic;                                        --         .mem_reset_n
		memory_mem_dq      : inout std_logic_vector(31 downto 0) := (others => '0'); --         .mem_dq
		memory_mem_dqs     : inout std_logic_vector(3 downto 0)  := (others => '0'); --         .mem_dqs
		memory_mem_dqs_n   : inout std_logic_vector(3 downto 0)  := (others => '0'); --         .mem_dqs_n
		memory_mem_odt     : out   std_logic;                                        --         .mem_odt
		memory_mem_dm      : out   std_logic_vector(3 downto 0);                     --         .mem_dm
		memory_oct_rzqin   : in    std_logic                     := '0';             --         .oct_rzqin
		to_hex_0_display   : out   std_logic_vector(6 downto 0);                     -- to_hex_0.display
		to_hex_1_display   : out   std_logic_vector(6 downto 0);                     -- to_hex_1.display
		to_hex_2_display   : out   std_logic_vector(6 downto 0);                     -- to_hex_2.display
		to_hex_3_display   : out   std_logic_vector(6 downto 0);                     -- to_hex_3.display
		to_hex_4_display   : out   std_logic_vector(6 downto 0);                     -- to_hex_4.display
		to_hex_5_display   : out   std_logic_vector(6 downto 0)                      -- to_hex_5.display
	);
end entity urs_0;

architecture rtl of urs_0 is
	component driver_7seg is
		port (
			avs_s0_address   : in  std_logic_vector(7 downto 0)  := (others => 'X'); -- address
			avs_s0_writedata : in  std_logic_vector(31 downto 0) := (others => 'X'); -- writedata
			avs_s0_write     : in  std_logic                     := 'X';             -- write
			clock_clk        : in  std_logic                     := 'X';             -- clk
			reset_reset      : in  std_logic                     := 'X';             -- reset
			hex0             : out std_logic_vector(6 downto 0);                     -- display
			hex1             : out std_logic_vector(6 downto 0);                     -- display
			hex2             : out std_logic_vector(6 downto 0);                     -- display
			hex3             : out std_logic_vector(6 downto 0);                     -- display
			hex4             : out std_logic_vector(6 downto 0);                     -- display
			hex5             : out std_logic_vector(6 downto 0)                      -- display
		);
	end component driver_7seg;

	component urs_0_hps_0 is
		generic (
			F2S_Width : integer := 2;
			S2F_Width : integer := 2
		);
		port (
			mem_a          : out   std_logic_vector(14 downto 0);                    -- mem_a
			mem_ba         : out   std_logic_vector(2 downto 0);                     -- mem_ba
			mem_ck         : out   std_logic;                                        -- mem_ck
			mem_ck_n       : out   std_logic;                                        -- mem_ck_n
			mem_cke        : out   std_logic;                                        -- mem_cke
			mem_cs_n       : out   std_logic;                                        -- mem_cs_n
			mem_ras_n      : out   std_logic;                                        -- mem_ras_n
			mem_cas_n      : out   std_logic;                                        -- mem_cas_n
			mem_we_n       : out   std_logic;                                        -- mem_we_n
			mem_reset_n    : out   std_logic;                                        -- mem_reset_n
			mem_dq         : inout std_logic_vector(31 downto 0) := (others => 'X'); -- mem_dq
			mem_dqs        : inout std_logic_vector(3 downto 0)  := (others => 'X'); -- mem_dqs
			mem_dqs_n      : inout std_logic_vector(3 downto 0)  := (others => 'X'); -- mem_dqs_n
			mem_odt        : out   std_logic;                                        -- mem_odt
			mem_dm         : out   std_logic_vector(3 downto 0);                     -- mem_dm
			oct_rzqin      : in    std_logic                     := 'X';             -- oct_rzqin
			h2f_rst_n      : out   std_logic;                                        -- reset_n
			h2f_lw_axi_clk : in    std_logic                     := 'X';             -- clk
			h2f_lw_AWID    : out   std_logic_vector(11 downto 0);                    -- awid
			h2f_lw_AWADDR  : out   std_logic_vector(20 downto 0);                    -- awaddr
			h2f_lw_AWLEN   : out   std_logic_vector(3 downto 0);                     -- awlen
			h2f_lw_AWSIZE  : out   std_logic_vector(2 downto 0);                     -- awsize
			h2f_lw_AWBURST : out   std_logic_vector(1 downto 0);                     -- awburst
			h2f_lw_AWLOCK  : out   std_logic_vector(1 downto 0);                     -- awlock
			h2f_lw_AWCACHE : out   std_logic_vector(3 downto 0);                     -- awcache
			h2f_lw_AWPROT  : out   std_logic_vector(2 downto 0);                     -- awprot
			h2f_lw_AWVALID : out   std_logic;                                        -- awvalid
			h2f_lw_AWREADY : in    std_logic                     := 'X';             -- awready
			h2f_lw_WID     : out   std_logic_vector(11 downto 0);                    -- wid
			h2f_lw_WDATA   : out   std_logic_vector(31 downto 0);                    -- wdata
			h2f_lw_WSTRB   : out   std_logic_vector(3 downto 0);                     -- wstrb
			h2f_lw_WLAST   : out   std_logic;                                        -- wlast
			h2f_lw_WVALID  : out   std_logic;                                        -- wvalid
			h2f_lw_WREADY  : in    std_logic                     := 'X';             -- wready
			h2f_lw_BID     : in    std_logic_vector(11 downto 0) := (others => 'X'); -- bid
			h2f_lw_BRESP   : in    std_logic_vector(1 downto 0)  := (others => 'X'); -- bresp
			h2f_lw_BVALID  : in    std_logic                     := 'X';             -- bvalid
			h2f_lw_BREADY  : out   std_logic;                                        -- bready
			h2f_lw_ARID    : out   std_logic_vector(11 downto 0);                    -- arid
			h2f_lw_ARADDR  : out   std_logic_vector(20 downto 0);                    -- araddr
			h2f_lw_ARLEN   : out   std_logic_vector(3 downto 0);                     -- arlen
			h2f_lw_ARSIZE  : out   std_logic_vector(2 downto 0);                     -- arsize
			h2f_lw_ARBURST : out   std_logic_vector(1 downto 0);                     -- arburst
			h2f_lw_ARLOCK  : out   std_logic_vector(1 downto 0);                     -- arlock
			h2f_lw_ARCACHE : out   std_logic_vector(3 downto 0);                     -- arcache
			h2f_lw_ARPROT  : out   std_logic_vector(2 downto 0);                     -- arprot
			h2f_lw_ARVALID : out   std_logic;                                        -- arvalid
			h2f_lw_ARREADY : in    std_logic                     := 'X';             -- arready
			h2f_lw_RID     : in    std_logic_vector(11 downto 0) := (others => 'X'); -- rid
			h2f_lw_RDATA   : in    std_logic_vector(31 downto 0) := (others => 'X'); -- rdata
			h2f_lw_RRESP   : in    std_logic_vector(1 downto 0)  := (others => 'X'); -- rresp
			h2f_lw_RLAST   : in    std_logic                     := 'X';             -- rlast
			h2f_lw_RVALID  : in    std_logic                     := 'X';             -- rvalid
			h2f_lw_RREADY  : out   std_logic                                         -- rready
		);
	end component urs_0_hps_0;

	component urs_0_mm_interconnect_0 is
		port (
			hps_0_h2f_lw_axi_master_awid                         : in  std_logic_vector(11 downto 0) := (others => 'X'); -- awid
			hps_0_h2f_lw_axi_master_awaddr                       : in  std_logic_vector(20 downto 0) := (others => 'X'); -- awaddr
			hps_0_h2f_lw_axi_master_awlen                        : in  std_logic_vector(3 downto 0)  := (others => 'X'); -- awlen
			hps_0_h2f_lw_axi_master_awsize                       : in  std_logic_vector(2 downto 0)  := (others => 'X'); -- awsize
			hps_0_h2f_lw_axi_master_awburst                      : in  std_logic_vector(1 downto 0)  := (others => 'X'); -- awburst
			hps_0_h2f_lw_axi_master_awlock                       : in  std_logic_vector(1 downto 0)  := (others => 'X'); -- awlock
			hps_0_h2f_lw_axi_master_awcache                      : in  std_logic_vector(3 downto 0)  := (others => 'X'); -- awcache
			hps_0_h2f_lw_axi_master_awprot                       : in  std_logic_vector(2 downto 0)  := (others => 'X'); -- awprot
			hps_0_h2f_lw_axi_master_awvalid                      : in  std_logic                     := 'X';             -- awvalid
			hps_0_h2f_lw_axi_master_awready                      : out std_logic;                                        -- awready
			hps_0_h2f_lw_axi_master_wid                          : in  std_logic_vector(11 downto 0) := (others => 'X'); -- wid
			hps_0_h2f_lw_axi_master_wdata                        : in  std_logic_vector(31 downto 0) := (others => 'X'); -- wdata
			hps_0_h2f_lw_axi_master_wstrb                        : in  std_logic_vector(3 downto 0)  := (others => 'X'); -- wstrb
			hps_0_h2f_lw_axi_master_wlast                        : in  std_logic                     := 'X';             -- wlast
			hps_0_h2f_lw_axi_master_wvalid                       : in  std_logic                     := 'X';             -- wvalid
			hps_0_h2f_lw_axi_master_wready                       : out std_logic;                                        -- wready
			hps_0_h2f_lw_axi_master_bid                          : out std_logic_vector(11 downto 0);                    -- bid
			hps_0_h2f_lw_axi_master_bresp                        : out std_logic_vector(1 downto 0);                     -- bresp
			hps_0_h2f_lw_axi_master_bvalid                       : out std_logic;                                        -- bvalid
			hps_0_h2f_lw_axi_master_bready                       : in  std_logic                     := 'X';             -- bready
			hps_0_h2f_lw_axi_master_arid                         : in  std_logic_vector(11 downto 0) := (others => 'X'); -- arid
			hps_0_h2f_lw_axi_master_araddr                       : in  std_logic_vector(20 downto 0) := (others => 'X'); -- araddr
			hps_0_h2f_lw_axi_master_arlen                        : in  std_logic_vector(3 downto 0)  := (others => 'X'); -- arlen
			hps_0_h2f_lw_axi_master_arsize                       : in  std_logic_vector(2 downto 0)  := (others => 'X'); -- arsize
			hps_0_h2f_lw_axi_master_arburst                      : in  std_logic_vector(1 downto 0)  := (others => 'X'); -- arburst
			hps_0_h2f_lw_axi_master_arlock                       : in  std_logic_vector(1 downto 0)  := (others => 'X'); -- arlock
			hps_0_h2f_lw_axi_master_arcache                      : in  std_logic_vector(3 downto 0)  := (others => 'X'); -- arcache
			hps_0_h2f_lw_axi_master_arprot                       : in  std_logic_vector(2 downto 0)  := (others => 'X'); -- arprot
			hps_0_h2f_lw_axi_master_arvalid                      : in  std_logic                     := 'X';             -- arvalid
			hps_0_h2f_lw_axi_master_arready                      : out std_logic;                                        -- arready
			hps_0_h2f_lw_axi_master_rid                          : out std_logic_vector(11 downto 0);                    -- rid
			hps_0_h2f_lw_axi_master_rdata                        : out std_logic_vector(31 downto 0);                    -- rdata
			hps_0_h2f_lw_axi_master_rresp                        : out std_logic_vector(1 downto 0);                     -- rresp
			hps_0_h2f_lw_axi_master_rlast                        : out std_logic;                                        -- rlast
			hps_0_h2f_lw_axi_master_rvalid                       : out std_logic;                                        -- rvalid
			hps_0_h2f_lw_axi_master_rready                       : in  std_logic                     := 'X';             -- rready
			clk_0_clk_clk                                        : in  std_logic                     := 'X';             -- clk
			driver_7seg_0_reset_sink_reset_bridge_in_reset_reset : in  std_logic                     := 'X';             -- reset
			driver_7seg_0_s0_address                             : out std_logic_vector(7 downto 0);                     -- address
			driver_7seg_0_s0_write                               : out std_logic;                                        -- write
			driver_7seg_0_s0_writedata                           : out std_logic_vector(31 downto 0)                     -- writedata
		);
	end component urs_0_mm_interconnect_0;

	component altera_reset_controller is
		generic (
			NUM_RESET_INPUTS          : integer := 6;
			OUTPUT_RESET_SYNC_EDGES   : string  := "deassert";
			SYNC_DEPTH                : integer := 2;
			RESET_REQUEST_PRESENT     : integer := 0;
			RESET_REQ_WAIT_TIME       : integer := 1;
			MIN_RST_ASSERTION_TIME    : integer := 3;
			RESET_REQ_EARLY_DSRT_TIME : integer := 1;
			USE_RESET_REQUEST_IN0     : integer := 0;
			USE_RESET_REQUEST_IN1     : integer := 0;
			USE_RESET_REQUEST_IN2     : integer := 0;
			USE_RESET_REQUEST_IN3     : integer := 0;
			USE_RESET_REQUEST_IN4     : integer := 0;
			USE_RESET_REQUEST_IN5     : integer := 0;
			USE_RESET_REQUEST_IN6     : integer := 0;
			USE_RESET_REQUEST_IN7     : integer := 0;
			USE_RESET_REQUEST_IN8     : integer := 0;
			USE_RESET_REQUEST_IN9     : integer := 0;
			USE_RESET_REQUEST_IN10    : integer := 0;
			USE_RESET_REQUEST_IN11    : integer := 0;
			USE_RESET_REQUEST_IN12    : integer := 0;
			USE_RESET_REQUEST_IN13    : integer := 0;
			USE_RESET_REQUEST_IN14    : integer := 0;
			USE_RESET_REQUEST_IN15    : integer := 0;
			ADAPT_RESET_REQUEST       : integer := 0
		);
		port (
			reset_in0      : in  std_logic := 'X'; -- reset
			clk            : in  std_logic := 'X'; -- clk
			reset_out      : out std_logic;        -- reset
			reset_req      : out std_logic;        -- reset_req
			reset_req_in0  : in  std_logic := 'X'; -- reset_req
			reset_in1      : in  std_logic := 'X'; -- reset
			reset_req_in1  : in  std_logic := 'X'; -- reset_req
			reset_in2      : in  std_logic := 'X'; -- reset
			reset_req_in2  : in  std_logic := 'X'; -- reset_req
			reset_in3      : in  std_logic := 'X'; -- reset
			reset_req_in3  : in  std_logic := 'X'; -- reset_req
			reset_in4      : in  std_logic := 'X'; -- reset
			reset_req_in4  : in  std_logic := 'X'; -- reset_req
			reset_in5      : in  std_logic := 'X'; -- reset
			reset_req_in5  : in  std_logic := 'X'; -- reset_req
			reset_in6      : in  std_logic := 'X'; -- reset
			reset_req_in6  : in  std_logic := 'X'; -- reset_req
			reset_in7      : in  std_logic := 'X'; -- reset
			reset_req_in7  : in  std_logic := 'X'; -- reset_req
			reset_in8      : in  std_logic := 'X'; -- reset
			reset_req_in8  : in  std_logic := 'X'; -- reset_req
			reset_in9      : in  std_logic := 'X'; -- reset
			reset_req_in9  : in  std_logic := 'X'; -- reset_req
			reset_in10     : in  std_logic := 'X'; -- reset
			reset_req_in10 : in  std_logic := 'X'; -- reset_req
			reset_in11     : in  std_logic := 'X'; -- reset
			reset_req_in11 : in  std_logic := 'X'; -- reset_req
			reset_in12     : in  std_logic := 'X'; -- reset
			reset_req_in12 : in  std_logic := 'X'; -- reset_req
			reset_in13     : in  std_logic := 'X'; -- reset
			reset_req_in13 : in  std_logic := 'X'; -- reset_req
			reset_in14     : in  std_logic := 'X'; -- reset
			reset_req_in14 : in  std_logic := 'X'; -- reset_req
			reset_in15     : in  std_logic := 'X'; -- reset
			reset_req_in15 : in  std_logic := 'X'  -- reset_req
		);
	end component altera_reset_controller;

	signal hps_0_h2f_reset_reset                        : std_logic;                     -- hps_0:h2f_rst_n -> hps_0_h2f_reset_reset:in
	signal hps_0_h2f_lw_axi_master_awburst              : std_logic_vector(1 downto 0);  -- hps_0:h2f_lw_AWBURST -> mm_interconnect_0:hps_0_h2f_lw_axi_master_awburst
	signal hps_0_h2f_lw_axi_master_arlen                : std_logic_vector(3 downto 0);  -- hps_0:h2f_lw_ARLEN -> mm_interconnect_0:hps_0_h2f_lw_axi_master_arlen
	signal hps_0_h2f_lw_axi_master_wstrb                : std_logic_vector(3 downto 0);  -- hps_0:h2f_lw_WSTRB -> mm_interconnect_0:hps_0_h2f_lw_axi_master_wstrb
	signal hps_0_h2f_lw_axi_master_wready               : std_logic;                     -- mm_interconnect_0:hps_0_h2f_lw_axi_master_wready -> hps_0:h2f_lw_WREADY
	signal hps_0_h2f_lw_axi_master_rid                  : std_logic_vector(11 downto 0); -- mm_interconnect_0:hps_0_h2f_lw_axi_master_rid -> hps_0:h2f_lw_RID
	signal hps_0_h2f_lw_axi_master_rready               : std_logic;                     -- hps_0:h2f_lw_RREADY -> mm_interconnect_0:hps_0_h2f_lw_axi_master_rready
	signal hps_0_h2f_lw_axi_master_awlen                : std_logic_vector(3 downto 0);  -- hps_0:h2f_lw_AWLEN -> mm_interconnect_0:hps_0_h2f_lw_axi_master_awlen
	signal hps_0_h2f_lw_axi_master_wid                  : std_logic_vector(11 downto 0); -- hps_0:h2f_lw_WID -> mm_interconnect_0:hps_0_h2f_lw_axi_master_wid
	signal hps_0_h2f_lw_axi_master_arcache              : std_logic_vector(3 downto 0);  -- hps_0:h2f_lw_ARCACHE -> mm_interconnect_0:hps_0_h2f_lw_axi_master_arcache
	signal hps_0_h2f_lw_axi_master_wvalid               : std_logic;                     -- hps_0:h2f_lw_WVALID -> mm_interconnect_0:hps_0_h2f_lw_axi_master_wvalid
	signal hps_0_h2f_lw_axi_master_araddr               : std_logic_vector(20 downto 0); -- hps_0:h2f_lw_ARADDR -> mm_interconnect_0:hps_0_h2f_lw_axi_master_araddr
	signal hps_0_h2f_lw_axi_master_arprot               : std_logic_vector(2 downto 0);  -- hps_0:h2f_lw_ARPROT -> mm_interconnect_0:hps_0_h2f_lw_axi_master_arprot
	signal hps_0_h2f_lw_axi_master_awprot               : std_logic_vector(2 downto 0);  -- hps_0:h2f_lw_AWPROT -> mm_interconnect_0:hps_0_h2f_lw_axi_master_awprot
	signal hps_0_h2f_lw_axi_master_wdata                : std_logic_vector(31 downto 0); -- hps_0:h2f_lw_WDATA -> mm_interconnect_0:hps_0_h2f_lw_axi_master_wdata
	signal hps_0_h2f_lw_axi_master_arvalid              : std_logic;                     -- hps_0:h2f_lw_ARVALID -> mm_interconnect_0:hps_0_h2f_lw_axi_master_arvalid
	signal hps_0_h2f_lw_axi_master_awcache              : std_logic_vector(3 downto 0);  -- hps_0:h2f_lw_AWCACHE -> mm_interconnect_0:hps_0_h2f_lw_axi_master_awcache
	signal hps_0_h2f_lw_axi_master_arid                 : std_logic_vector(11 downto 0); -- hps_0:h2f_lw_ARID -> mm_interconnect_0:hps_0_h2f_lw_axi_master_arid
	signal hps_0_h2f_lw_axi_master_arlock               : std_logic_vector(1 downto 0);  -- hps_0:h2f_lw_ARLOCK -> mm_interconnect_0:hps_0_h2f_lw_axi_master_arlock
	signal hps_0_h2f_lw_axi_master_awlock               : std_logic_vector(1 downto 0);  -- hps_0:h2f_lw_AWLOCK -> mm_interconnect_0:hps_0_h2f_lw_axi_master_awlock
	signal hps_0_h2f_lw_axi_master_awaddr               : std_logic_vector(20 downto 0); -- hps_0:h2f_lw_AWADDR -> mm_interconnect_0:hps_0_h2f_lw_axi_master_awaddr
	signal hps_0_h2f_lw_axi_master_bresp                : std_logic_vector(1 downto 0);  -- mm_interconnect_0:hps_0_h2f_lw_axi_master_bresp -> hps_0:h2f_lw_BRESP
	signal hps_0_h2f_lw_axi_master_arready              : std_logic;                     -- mm_interconnect_0:hps_0_h2f_lw_axi_master_arready -> hps_0:h2f_lw_ARREADY
	signal hps_0_h2f_lw_axi_master_rdata                : std_logic_vector(31 downto 0); -- mm_interconnect_0:hps_0_h2f_lw_axi_master_rdata -> hps_0:h2f_lw_RDATA
	signal hps_0_h2f_lw_axi_master_awready              : std_logic;                     -- mm_interconnect_0:hps_0_h2f_lw_axi_master_awready -> hps_0:h2f_lw_AWREADY
	signal hps_0_h2f_lw_axi_master_arburst              : std_logic_vector(1 downto 0);  -- hps_0:h2f_lw_ARBURST -> mm_interconnect_0:hps_0_h2f_lw_axi_master_arburst
	signal hps_0_h2f_lw_axi_master_arsize               : std_logic_vector(2 downto 0);  -- hps_0:h2f_lw_ARSIZE -> mm_interconnect_0:hps_0_h2f_lw_axi_master_arsize
	signal hps_0_h2f_lw_axi_master_bready               : std_logic;                     -- hps_0:h2f_lw_BREADY -> mm_interconnect_0:hps_0_h2f_lw_axi_master_bready
	signal hps_0_h2f_lw_axi_master_rlast                : std_logic;                     -- mm_interconnect_0:hps_0_h2f_lw_axi_master_rlast -> hps_0:h2f_lw_RLAST
	signal hps_0_h2f_lw_axi_master_wlast                : std_logic;                     -- hps_0:h2f_lw_WLAST -> mm_interconnect_0:hps_0_h2f_lw_axi_master_wlast
	signal hps_0_h2f_lw_axi_master_rresp                : std_logic_vector(1 downto 0);  -- mm_interconnect_0:hps_0_h2f_lw_axi_master_rresp -> hps_0:h2f_lw_RRESP
	signal hps_0_h2f_lw_axi_master_awid                 : std_logic_vector(11 downto 0); -- hps_0:h2f_lw_AWID -> mm_interconnect_0:hps_0_h2f_lw_axi_master_awid
	signal hps_0_h2f_lw_axi_master_bid                  : std_logic_vector(11 downto 0); -- mm_interconnect_0:hps_0_h2f_lw_axi_master_bid -> hps_0:h2f_lw_BID
	signal hps_0_h2f_lw_axi_master_bvalid               : std_logic;                     -- mm_interconnect_0:hps_0_h2f_lw_axi_master_bvalid -> hps_0:h2f_lw_BVALID
	signal hps_0_h2f_lw_axi_master_awsize               : std_logic_vector(2 downto 0);  -- hps_0:h2f_lw_AWSIZE -> mm_interconnect_0:hps_0_h2f_lw_axi_master_awsize
	signal hps_0_h2f_lw_axi_master_awvalid              : std_logic;                     -- hps_0:h2f_lw_AWVALID -> mm_interconnect_0:hps_0_h2f_lw_axi_master_awvalid
	signal hps_0_h2f_lw_axi_master_rvalid               : std_logic;                     -- mm_interconnect_0:hps_0_h2f_lw_axi_master_rvalid -> hps_0:h2f_lw_RVALID
	signal mm_interconnect_0_driver_7seg_0_s0_address   : std_logic_vector(7 downto 0);  -- mm_interconnect_0:driver_7seg_0_s0_address -> driver_7seg_0:avs_s0_address
	signal mm_interconnect_0_driver_7seg_0_s0_write     : std_logic;                     -- mm_interconnect_0:driver_7seg_0_s0_write -> driver_7seg_0:avs_s0_write
	signal mm_interconnect_0_driver_7seg_0_s0_writedata : std_logic_vector(31 downto 0); -- mm_interconnect_0:driver_7seg_0_s0_writedata -> driver_7seg_0:avs_s0_writedata
	signal rst_controller_reset_out_reset               : std_logic;                     -- rst_controller:reset_out -> [driver_7seg_0:reset_reset, mm_interconnect_0:driver_7seg_0_reset_sink_reset_bridge_in_reset_reset]
	signal hps_0_h2f_reset_reset_ports_inv              : std_logic;                     -- hps_0_h2f_reset_reset:inv -> rst_controller:reset_in0

begin

	driver_7seg_0 : component driver_7seg
		port map (
			avs_s0_address   => mm_interconnect_0_driver_7seg_0_s0_address,   --            s0.address
			avs_s0_writedata => mm_interconnect_0_driver_7seg_0_s0_writedata, --              .writedata
			avs_s0_write     => mm_interconnect_0_driver_7seg_0_s0_write,     --              .write
			clock_clk        => clk_clk,                                      --    clock_sink.clk
			reset_reset      => rst_controller_reset_out_reset,               --    reset_sink.reset
			hex0             => to_hex_0_display,                             --   conduit_end.display
			hex1             => to_hex_1_display,                             -- conduit_end_1.display
			hex2             => to_hex_2_display,                             -- conduit_end_2.display
			hex3             => to_hex_3_display,                             -- conduit_end_3.display
			hex4             => to_hex_4_display,                             -- conduit_end_4.display
			hex5             => to_hex_5_display                              -- conduit_end_5.display
		);

	hps_0 : component urs_0_hps_0
		generic map (
			F2S_Width => 0,
			S2F_Width => 0
		)
		port map (
			mem_a          => memory_mem_a,                    --            memory.mem_a
			mem_ba         => memory_mem_ba,                   --                  .mem_ba
			mem_ck         => memory_mem_ck,                   --                  .mem_ck
			mem_ck_n       => memory_mem_ck_n,                 --                  .mem_ck_n
			mem_cke        => memory_mem_cke,                  --                  .mem_cke
			mem_cs_n       => memory_mem_cs_n,                 --                  .mem_cs_n
			mem_ras_n      => memory_mem_ras_n,                --                  .mem_ras_n
			mem_cas_n      => memory_mem_cas_n,                --                  .mem_cas_n
			mem_we_n       => memory_mem_we_n,                 --                  .mem_we_n
			mem_reset_n    => memory_mem_reset_n,              --                  .mem_reset_n
			mem_dq         => memory_mem_dq,                   --                  .mem_dq
			mem_dqs        => memory_mem_dqs,                  --                  .mem_dqs
			mem_dqs_n      => memory_mem_dqs_n,                --                  .mem_dqs_n
			mem_odt        => memory_mem_odt,                  --                  .mem_odt
			mem_dm         => memory_mem_dm,                   --                  .mem_dm
			oct_rzqin      => memory_oct_rzqin,                --                  .oct_rzqin
			h2f_rst_n      => hps_0_h2f_reset_reset,           --         h2f_reset.reset_n
			h2f_lw_axi_clk => clk_clk,                         --  h2f_lw_axi_clock.clk
			h2f_lw_AWID    => hps_0_h2f_lw_axi_master_awid,    -- h2f_lw_axi_master.awid
			h2f_lw_AWADDR  => hps_0_h2f_lw_axi_master_awaddr,  --                  .awaddr
			h2f_lw_AWLEN   => hps_0_h2f_lw_axi_master_awlen,   --                  .awlen
			h2f_lw_AWSIZE  => hps_0_h2f_lw_axi_master_awsize,  --                  .awsize
			h2f_lw_AWBURST => hps_0_h2f_lw_axi_master_awburst, --                  .awburst
			h2f_lw_AWLOCK  => hps_0_h2f_lw_axi_master_awlock,  --                  .awlock
			h2f_lw_AWCACHE => hps_0_h2f_lw_axi_master_awcache, --                  .awcache
			h2f_lw_AWPROT  => hps_0_h2f_lw_axi_master_awprot,  --                  .awprot
			h2f_lw_AWVALID => hps_0_h2f_lw_axi_master_awvalid, --                  .awvalid
			h2f_lw_AWREADY => hps_0_h2f_lw_axi_master_awready, --                  .awready
			h2f_lw_WID     => hps_0_h2f_lw_axi_master_wid,     --                  .wid
			h2f_lw_WDATA   => hps_0_h2f_lw_axi_master_wdata,   --                  .wdata
			h2f_lw_WSTRB   => hps_0_h2f_lw_axi_master_wstrb,   --                  .wstrb
			h2f_lw_WLAST   => hps_0_h2f_lw_axi_master_wlast,   --                  .wlast
			h2f_lw_WVALID  => hps_0_h2f_lw_axi_master_wvalid,  --                  .wvalid
			h2f_lw_WREADY  => hps_0_h2f_lw_axi_master_wready,  --                  .wready
			h2f_lw_BID     => hps_0_h2f_lw_axi_master_bid,     --                  .bid
			h2f_lw_BRESP   => hps_0_h2f_lw_axi_master_bresp,   --                  .bresp
			h2f_lw_BVALID  => hps_0_h2f_lw_axi_master_bvalid,  --                  .bvalid
			h2f_lw_BREADY  => hps_0_h2f_lw_axi_master_bready,  --                  .bready
			h2f_lw_ARID    => hps_0_h2f_lw_axi_master_arid,    --                  .arid
			h2f_lw_ARADDR  => hps_0_h2f_lw_axi_master_araddr,  --                  .araddr
			h2f_lw_ARLEN   => hps_0_h2f_lw_axi_master_arlen,   --                  .arlen
			h2f_lw_ARSIZE  => hps_0_h2f_lw_axi_master_arsize,  --                  .arsize
			h2f_lw_ARBURST => hps_0_h2f_lw_axi_master_arburst, --                  .arburst
			h2f_lw_ARLOCK  => hps_0_h2f_lw_axi_master_arlock,  --                  .arlock
			h2f_lw_ARCACHE => hps_0_h2f_lw_axi_master_arcache, --                  .arcache
			h2f_lw_ARPROT  => hps_0_h2f_lw_axi_master_arprot,  --                  .arprot
			h2f_lw_ARVALID => hps_0_h2f_lw_axi_master_arvalid, --                  .arvalid
			h2f_lw_ARREADY => hps_0_h2f_lw_axi_master_arready, --                  .arready
			h2f_lw_RID     => hps_0_h2f_lw_axi_master_rid,     --                  .rid
			h2f_lw_RDATA   => hps_0_h2f_lw_axi_master_rdata,   --                  .rdata
			h2f_lw_RRESP   => hps_0_h2f_lw_axi_master_rresp,   --                  .rresp
			h2f_lw_RLAST   => hps_0_h2f_lw_axi_master_rlast,   --                  .rlast
			h2f_lw_RVALID  => hps_0_h2f_lw_axi_master_rvalid,  --                  .rvalid
			h2f_lw_RREADY  => hps_0_h2f_lw_axi_master_rready   --                  .rready
		);

	mm_interconnect_0 : component urs_0_mm_interconnect_0
		port map (
			hps_0_h2f_lw_axi_master_awid                         => hps_0_h2f_lw_axi_master_awid,                 --                        hps_0_h2f_lw_axi_master.awid
			hps_0_h2f_lw_axi_master_awaddr                       => hps_0_h2f_lw_axi_master_awaddr,               --                                               .awaddr
			hps_0_h2f_lw_axi_master_awlen                        => hps_0_h2f_lw_axi_master_awlen,                --                                               .awlen
			hps_0_h2f_lw_axi_master_awsize                       => hps_0_h2f_lw_axi_master_awsize,               --                                               .awsize
			hps_0_h2f_lw_axi_master_awburst                      => hps_0_h2f_lw_axi_master_awburst,              --                                               .awburst
			hps_0_h2f_lw_axi_master_awlock                       => hps_0_h2f_lw_axi_master_awlock,               --                                               .awlock
			hps_0_h2f_lw_axi_master_awcache                      => hps_0_h2f_lw_axi_master_awcache,              --                                               .awcache
			hps_0_h2f_lw_axi_master_awprot                       => hps_0_h2f_lw_axi_master_awprot,               --                                               .awprot
			hps_0_h2f_lw_axi_master_awvalid                      => hps_0_h2f_lw_axi_master_awvalid,              --                                               .awvalid
			hps_0_h2f_lw_axi_master_awready                      => hps_0_h2f_lw_axi_master_awready,              --                                               .awready
			hps_0_h2f_lw_axi_master_wid                          => hps_0_h2f_lw_axi_master_wid,                  --                                               .wid
			hps_0_h2f_lw_axi_master_wdata                        => hps_0_h2f_lw_axi_master_wdata,                --                                               .wdata
			hps_0_h2f_lw_axi_master_wstrb                        => hps_0_h2f_lw_axi_master_wstrb,                --                                               .wstrb
			hps_0_h2f_lw_axi_master_wlast                        => hps_0_h2f_lw_axi_master_wlast,                --                                               .wlast
			hps_0_h2f_lw_axi_master_wvalid                       => hps_0_h2f_lw_axi_master_wvalid,               --                                               .wvalid
			hps_0_h2f_lw_axi_master_wready                       => hps_0_h2f_lw_axi_master_wready,               --                                               .wready
			hps_0_h2f_lw_axi_master_bid                          => hps_0_h2f_lw_axi_master_bid,                  --                                               .bid
			hps_0_h2f_lw_axi_master_bresp                        => hps_0_h2f_lw_axi_master_bresp,                --                                               .bresp
			hps_0_h2f_lw_axi_master_bvalid                       => hps_0_h2f_lw_axi_master_bvalid,               --                                               .bvalid
			hps_0_h2f_lw_axi_master_bready                       => hps_0_h2f_lw_axi_master_bready,               --                                               .bready
			hps_0_h2f_lw_axi_master_arid                         => hps_0_h2f_lw_axi_master_arid,                 --                                               .arid
			hps_0_h2f_lw_axi_master_araddr                       => hps_0_h2f_lw_axi_master_araddr,               --                                               .araddr
			hps_0_h2f_lw_axi_master_arlen                        => hps_0_h2f_lw_axi_master_arlen,                --                                               .arlen
			hps_0_h2f_lw_axi_master_arsize                       => hps_0_h2f_lw_axi_master_arsize,               --                                               .arsize
			hps_0_h2f_lw_axi_master_arburst                      => hps_0_h2f_lw_axi_master_arburst,              --                                               .arburst
			hps_0_h2f_lw_axi_master_arlock                       => hps_0_h2f_lw_axi_master_arlock,               --                                               .arlock
			hps_0_h2f_lw_axi_master_arcache                      => hps_0_h2f_lw_axi_master_arcache,              --                                               .arcache
			hps_0_h2f_lw_axi_master_arprot                       => hps_0_h2f_lw_axi_master_arprot,               --                                               .arprot
			hps_0_h2f_lw_axi_master_arvalid                      => hps_0_h2f_lw_axi_master_arvalid,              --                                               .arvalid
			hps_0_h2f_lw_axi_master_arready                      => hps_0_h2f_lw_axi_master_arready,              --                                               .arready
			hps_0_h2f_lw_axi_master_rid                          => hps_0_h2f_lw_axi_master_rid,                  --                                               .rid
			hps_0_h2f_lw_axi_master_rdata                        => hps_0_h2f_lw_axi_master_rdata,                --                                               .rdata
			hps_0_h2f_lw_axi_master_rresp                        => hps_0_h2f_lw_axi_master_rresp,                --                                               .rresp
			hps_0_h2f_lw_axi_master_rlast                        => hps_0_h2f_lw_axi_master_rlast,                --                                               .rlast
			hps_0_h2f_lw_axi_master_rvalid                       => hps_0_h2f_lw_axi_master_rvalid,               --                                               .rvalid
			hps_0_h2f_lw_axi_master_rready                       => hps_0_h2f_lw_axi_master_rready,               --                                               .rready
			clk_0_clk_clk                                        => clk_clk,                                      --                                      clk_0_clk.clk
			driver_7seg_0_reset_sink_reset_bridge_in_reset_reset => rst_controller_reset_out_reset,               -- driver_7seg_0_reset_sink_reset_bridge_in_reset.reset
			driver_7seg_0_s0_address                             => mm_interconnect_0_driver_7seg_0_s0_address,   --                               driver_7seg_0_s0.address
			driver_7seg_0_s0_write                               => mm_interconnect_0_driver_7seg_0_s0_write,     --                                               .write
			driver_7seg_0_s0_writedata                           => mm_interconnect_0_driver_7seg_0_s0_writedata  --                                               .writedata
		);

	rst_controller : component altera_reset_controller
		generic map (
			NUM_RESET_INPUTS          => 1,
			OUTPUT_RESET_SYNC_EDGES   => "deassert",
			SYNC_DEPTH                => 2,
			RESET_REQUEST_PRESENT     => 0,
			RESET_REQ_WAIT_TIME       => 1,
			MIN_RST_ASSERTION_TIME    => 3,
			RESET_REQ_EARLY_DSRT_TIME => 1,
			USE_RESET_REQUEST_IN0     => 0,
			USE_RESET_REQUEST_IN1     => 0,
			USE_RESET_REQUEST_IN2     => 0,
			USE_RESET_REQUEST_IN3     => 0,
			USE_RESET_REQUEST_IN4     => 0,
			USE_RESET_REQUEST_IN5     => 0,
			USE_RESET_REQUEST_IN6     => 0,
			USE_RESET_REQUEST_IN7     => 0,
			USE_RESET_REQUEST_IN8     => 0,
			USE_RESET_REQUEST_IN9     => 0,
			USE_RESET_REQUEST_IN10    => 0,
			USE_RESET_REQUEST_IN11    => 0,
			USE_RESET_REQUEST_IN12    => 0,
			USE_RESET_REQUEST_IN13    => 0,
			USE_RESET_REQUEST_IN14    => 0,
			USE_RESET_REQUEST_IN15    => 0,
			ADAPT_RESET_REQUEST       => 0
		)
		port map (
			reset_in0      => hps_0_h2f_reset_reset_ports_inv, -- reset_in0.reset
			clk            => clk_clk,                         --       clk.clk
			reset_out      => rst_controller_reset_out_reset,  -- reset_out.reset
			reset_req      => open,                            -- (terminated)
			reset_req_in0  => '0',                             -- (terminated)
			reset_in1      => '0',                             -- (terminated)
			reset_req_in1  => '0',                             -- (terminated)
			reset_in2      => '0',                             -- (terminated)
			reset_req_in2  => '0',                             -- (terminated)
			reset_in3      => '0',                             -- (terminated)
			reset_req_in3  => '0',                             -- (terminated)
			reset_in4      => '0',                             -- (terminated)
			reset_req_in4  => '0',                             -- (terminated)
			reset_in5      => '0',                             -- (terminated)
			reset_req_in5  => '0',                             -- (terminated)
			reset_in6      => '0',                             -- (terminated)
			reset_req_in6  => '0',                             -- (terminated)
			reset_in7      => '0',                             -- (terminated)
			reset_req_in7  => '0',                             -- (terminated)
			reset_in8      => '0',                             -- (terminated)
			reset_req_in8  => '0',                             -- (terminated)
			reset_in9      => '0',                             -- (terminated)
			reset_req_in9  => '0',                             -- (terminated)
			reset_in10     => '0',                             -- (terminated)
			reset_req_in10 => '0',                             -- (terminated)
			reset_in11     => '0',                             -- (terminated)
			reset_req_in11 => '0',                             -- (terminated)
			reset_in12     => '0',                             -- (terminated)
			reset_req_in12 => '0',                             -- (terminated)
			reset_in13     => '0',                             -- (terminated)
			reset_req_in13 => '0',                             -- (terminated)
			reset_in14     => '0',                             -- (terminated)
			reset_req_in14 => '0',                             -- (terminated)
			reset_in15     => '0',                             -- (terminated)
			reset_req_in15 => '0'                              -- (terminated)
		);

	hps_0_h2f_reset_reset_ports_inv <= not hps_0_h2f_reset_reset;

end architecture rtl; -- of urs_0
