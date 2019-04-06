-- test bench for two source file CounterEn and CounterEn1 where counterEn enables 
-- signal when counter2 = 10 and then the counter 3 starts counting

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
			en : out std_logic;
			qout  : out std_logic_vector(5 downto 0)
	);
end component;

component counter1 is 
	port (
			clk : In std_logic;
			rst : in std_logic;
			en_n : in std_logic;
			q_n  : out std_logic_vector(3 downto 0)
	);
end component;


signal clk_sim: std_logic;
signal rst_sim : std_logic;
signal q_sim : std_logic_vector (5 downto 0);
signal q_sim1 : std_logic_vector (3 downto 0);
signal en_sim : std_logic;

constant clk_per : time := 40 ns;

begin

cnt_inst : counter port map(
					clk => clk_sim,
					rst => rst_sim,
					en => en_sim,
					qout => q_sim
				   );
				   
cnt_inst1 : counter1 port map(
					clk => clk_sim,
					rst => rst_sim,
					en_n => en_sim,
					q_n => q_sim1
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
