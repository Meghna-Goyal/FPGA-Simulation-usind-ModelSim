-- basic program for flip flop with bit and bus
-- sync and asyn active reset
-- with 2 input when enable =1 din = dout and if enable =0 dout = dout (o/p is 0 only when the reset is high)
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity ff is 
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
end entity;

architecture behave of ff is

signal dout_int : std_logic_vector(3 downto 0);

begin

-- async. reset, active high
-- async_proc: process (rst,clk)
-- begin
	-- if rst = '1' then --active high reset
		-- --Dout <= '0'; --for std_logic
		-- --Dout <= "0000"; --for std_logic_vector
		-- Dout <= (others => '0'); --for std_logic_vector all bits are assigned to zero
	-- elsif rising_edge (clk) then	
		-- dout <= din ; --for same size
		-- --dout <= x"0" & din; --for different size
	-- end if;
-- end process;

---------------------------------------------------------
---------------------------------------------------------
-- sync. reset active high
sync_proc : process(rst,clk)
begin
	if rising_edge(clk) then
		if rst = '1' then
			dout <= (others => '0');
		elsif enable = '1' then	
			dout_int <= din; --internal s/g dout_int to use the value of o/p as a part of process
		else
			dout_int <= dout_int;
		end if;
	end if ;	
end process;

	dout <= dout_int;
	
end behave;
 
	