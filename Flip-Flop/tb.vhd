-- a test file to test the code for flipflop 
--for simulation

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity tb_ff is 
end entity;

architecture behave of tb_ff is 
--component /signal /constant
component ff is 
	port(
		clk : IN std_logic;  --std_logic takes 8 possiblities of input whereas bit has only 0/1 as i/p
		RST : IN std_logic;
		--Din : In std_logic; 
		Din : In std_logic_vector (3 downto 0);		
		--Dout : Out std_logic
		Dout : Out std_logic_vector(3 downto 0);
		-- Dout : Out std_logic_vector(7 downto 0); size of input and output is not the same
		Enable : in std_logic
	);
end component;

signal clk_sim : std_logic; --name prefer to be same as that of ports and datatype same as that of ports
signal RST_sim : std_logic;
signal Enable_sim : std_logic;
signal Din_sim : std_logic_vector (3 downto 0):= "0000" ; --initiAlize
signal Dout_sim : std_logic_vector (3 downto 0);

constant clk_per: time := 10 ns ; --100MHz clock

begin

ff_inst : ff port map (
						clk => clk_sim,
						rst => rst_sim,
						enable => Enable_sim,
						din => din_sim,
						dout => dout_sim
					);
clk_proc:process
begin
	clk_sim <= '0';
	wait for clk_per/2;
	clk_sim <= not clk_sim;
	wait for clk_per/2;
end process;

rst_proc:process
begin
	rst_sim <= '1' ;
	wait for clk_per *2;
	rst_sim <= not rst_sim;
	wait;
end process;

Enable_sim <= '0',
			  '1' after clk_per*12,
			  '0' after clk_per*20;

din_sim <= "0101", --X"9"
		   "1101" after clk_per*15;			  

end behave;

