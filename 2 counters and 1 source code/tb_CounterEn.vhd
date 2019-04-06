library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity tb_counter is
end entity;

architecture behave of tb_counter is

component counter is 
	port (
			clk : In std_logic;
			rst : in std_logic;
			qout  : out std_logic_vector(5 downto 0)
	);
end component;


signal clk_sim: std_logic;
signal rst_sim : std_logic;
signal q_sim : std_logic_vector (5 downto 0);

constant clk_per : time := 40 ns; -- recommended  to use 25MHz clock

begin
-- source file for the test bench-- for connecting the 
--component to the signals
cnt_inst : counter port map(
					clk => clk_sim,
					rst => rst_sim,
					qout => q_sim
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

end behave;			   
