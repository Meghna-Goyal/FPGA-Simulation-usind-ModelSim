library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity tb_cntdf is
begin
end entity;

architecture behave of tb_cntdf is

component counter is
	port(  
			clk : In std_logic;
			rst : in std_logic;
			en  : in std_logic;
			rstn: out std_logic;
			clk_2: out std_logic;
			qout : out std_logic_vector(4 downto 0);
			en_D : out std_logic;
			en_M : out std_logic
	   	);
		
end component;

component dataflow is
	port(  
		data_a : in std_logic_vector(7 downto 0);
		data_b : in std_logic_vector(5 downto 0);
		cnt_in: in std_logic_vector(4 downto 0);
		clk_2: in std_logic;
		rstn_in : in std_logic;
		en_D_in : in std_logic;
		en_M_in : in std_logic;
		d1_out : out std_logic_vector(13 downto 0);
		d2_out : out std_logic_vector(10 downto 0)
	   	);	
end component;

signal clk_sim: std_logic;
signal rst_sim : std_logic;
signal en_sim : std_logic;
signal rstn_con : std_logic;
signal clk2_con : std_logic;
signal qout_con : std_logic_vector (4 downto 0);
signal en_D_con : std_logic;
signal en_m_con : std_logic;

signal q1_sim : std_logic_vector (7 downto 0);
signal q2_sim : std_logic_vector (5 downto 0);
signal D1_out_sim : std_logic_vector (13 downto 0);
signal D2_out_sim : std_logic_vector (10 downto 0);

--clk of 100 MHz
constant clk_per : time := 10 ns;

begin
cnt_inst : counter port map(
					clk => clk_sim,
					rst => rst_sim,
					en => en_sim,
					rstn => rstn_con,
					clk_2 => clk2_con,
					qout => qout_con,
					en_D => en_D_con,
					en_M => en_m_con
					);
				   
cnt_inst1 : dataflow port map(
					data_a => q1_sim, 
				   data_b => q2_sim,
                    cnt_in => qout_con,
                    clk_2 => clk2_con,
                    rstn_in => rstn_con,
                    en_D_in => en_D_con,
                    en_M_in => en_m_con,
                    d1_out => D1_out_sim,
                    d2_out => D2_out_sim
					
					);
					
					clk_proc: process
begin
	clk_sim <= '0';
	wait for clk_per/2;
	clk_sim <= not clk_sim;
	wait for clk_per/2;
end process;

rst_proc : process
begin
	rst_sim <= '1';
	wait for clk_per*10;
	rst_sim <= not rst_sim;
	wait;
end process;

en_sim <= '0',
		'1' after clk_per*6;
		
q1_sim <= "00000001";
q2_sim <= "000001";		


end behave;