library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity tb_counter is
end entity;

architecture behave of tb_counter is

component counter is
	port( 
	clk: in std_logic ;
	rst : in std_logic;
	Q : out std_logic_vector (3 downto 0);
	en : in std_logic
	);
end component;

signal clk_sim: std_logic;
signal rst_sim : std_logic;
signal q_sim : std_logic_vector (3 downto 0);
signal en_sim : std_logic ;
--clock is 25 MHZ
constant clk_per : time := 40 ns; --duration of 1 period

begin

cnt_inst : counter port map(
					clk => clk_sim,
					rst => rst_sim,
					q => q_sim,
					en => en_sim
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
	rst_sim <= '0';
	wait for clk_per*10;
	rst_sim <= not rst_sim;
	wait;
end process;

En_sim <= '1',
		  '0' after clk_per*12,
		  '1' after clk_per*20;


end behave;