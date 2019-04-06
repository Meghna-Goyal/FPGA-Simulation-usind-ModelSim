library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_SIGNED.ALL;


entity clk is 
Port (	
	Clk		: in STD_LOGIC;
	
		Clk_2		: out STD_LOGIC;
		Clk_4		: out STD_LOGIC
	);
end entity;

architecture bahve of clk is

signal	clk_sig : std_logic := '0';
signal	clk_sig1 : std_logic := '0';

begin 

clk2_proc: process(clk)
begin
		
		--clk_sig1 <= '0';
	if rising_edge (clk) then
		clk_sig <= not clk_sig;
	end if;
end process;

clk4_proc: process(clk)
begin
		--clk_sig <= '0';
		--clk_sig1 <= '0';
	if rising_edge (clk) then
		if clk_sig = '1' then
		clk_sig1 <= not clk_sig1;	
		else
		clk_sig1 <= clk_sig1;
	end if;
	end if;
end process;

Clk_2 <= clk_sig;
Clk_4 <= clk_sig1;
end bahve;
