library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity counter is 
	port (
			clk : In std_logic;
			rst : in std_logic;
			Q   : out std_logic_vector(3 downto 0);
			en : in std_logic
	);
end entity;

architecture behave of counter is 

signal cnt_int : std_logic_vector(3 downto 0);
begin

cnt_proc : process (clk,rst)

begin

--active high reset,sync.reset, trigger on falling edge

	if falling_edge (clk) then 
		if rst = '0' then
			cnt_int<= (others => '0');
		elsif en = '1' then
			cnt_int <= cnt_int+1;
		else
			cnt_int <= cnt_int-1;
		end if;
	end if;

end process;

q <= cnt_int;

end behave;