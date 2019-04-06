library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_SIGNED.ALL;

entity tb_clk is
begin 
end entity;

architecture arc of tb_clk is

component clk is 
Port (	
	Clk		: in STD_LOGIC;
		Clk_2		: out STD_LOGIC;
		Clk_4		: out STD_LOGIC
	);
end component;


signal clk_sim: std_logic;
signal clk_4s: std_logic;
signal clk_2s: std_logic;


constant clk_per : time := 40 ns; --duration of 1 period

begin

cnt_inst : clk port map(
					clk => clk_sim,
					clk_4 => clk_4s,
					clk_2 => clk_2s
				   );
 clk_proc: process
begin
	clk_sim <= '0';
	wait for clk_per/2;
	clk_sim <= not clk_sim;
	wait for clk_per/2;
end process; 
end arc;