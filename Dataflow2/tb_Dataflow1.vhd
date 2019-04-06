
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity tb_dataflow1 is
end entity;

architecture behave of tb_dataflow1 is

component DF is 
	port ( clk	: IN std_logic; 
	       rst	: IN std_logic;
		   Lad1	: IN std_logic;
		   lad2	: IN std_logic;
		   lad3	: IN std_logic;
		   lad4	: IN std_logic;
	       D1	: IN std_logic_vector(7 downto 0); 
		   D2	: IN std_logic_vector(7 downto 0); 
		   Dout	: OUT std_logic_vector(17 downto 0)   
		 );
end component;

signal clk_sim: std_logic;
signal rst_sim : std_logic;
signal D1_sim : std_logic_vector (7 downto 0);
signal d2_sim : std_logic_vector (7 downto 0);
signal dout_sim : std_logic_vector (17 downto 0);
signal lad1_sim: std_logic;
signal lad2_sim : std_logic;
signal lad3_sim: std_logic;
signal lad4_sim : std_logic;

--clock is 25 MHZ
constant clk_per : time := 40 ns;

begin
DF_inst : DF port map(
					clk => clk_sim,
					rst => rst_sim,
					D1 => d1_sim,
					D2 => d2_sim,
					lad1 => lad1_sim,
					lad2 => lad2_sim,
					lad3 => lad3_sim,
					lad4 => lad4_sim,
					dout => dout_sim
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

lad_proc : process
begin
	lad1_sim <= '0';
	lad2_sim <= '0';
	lad3_sim <= '0';
	lad4_sim <= '0';
	wait for clk_per*10;
	lad1_sim <= '1';
	lad2_sim <= '1';
	lad3_sim <= '1';
	lad4_sim <= '1';
	wait;
end process;



d1_sim <= "00000001" ;
d2_sim <= "00000001" ;

end behave;