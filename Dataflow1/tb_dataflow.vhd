library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;


entity tb_dataflow is
end entity;

architecture behave of tb_dataflow is
component DT is
	port ( clk	: IN std_logic; 
	       rst	: IN std_logic;
	       D1	: IN std_logic_vector(5 downto 0); 
		   D2	: IN std_logic_vector(3 downto 0); 
		   Dout	: OUT std_logic_vector(11 downto 0)   
		 );
	
end component;

signal clk_sim: std_logic;
signal rst_sim : std_logic;
signal D1_sim : std_logic_vector (5 downto 0);
signal d2_sim : std_logic_vector (3 downto 0);
signal dout_sim : std_logic_vector (11 downto 0);

--clock is 25 MHZ
constant clk_per : time := 40 ns;

begin
DF_inst : DT port map(
					clk => clk_sim,
					rst => rst_sim,
					D1 => d1_sim,
					D2 => d2_sim,
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


--	d1_sim <= "0001" ;--X"9"   -- d1_sim has 6bit (5 downto 0)
d1_sim <= "000001" ;--X"9"
d2_sim <= "0001" ;

end behave;