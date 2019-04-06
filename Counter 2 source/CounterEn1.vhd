library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity counter1 is 
	port (
			clk : In std_logic;
			rst : in std_logic;
			en_n : in std_logic;
			q_n  : out std_logic_vector(3 downto 0)
	);
end entity;

architecture behave of counter1 is

signal cnt_int3 : std_logic_vector (3 downto 0);
begin

proc_clk : process (rst, clk)
begin
 if rst = '1' then
 cnt_int3 <= (others => '0');
 elsif rising_edge (clk) then
	if en_n = '1' then
		cnt_int3 <= cnt_int3 +1;
	else
		cnt_int3 <= cnt_int3;
	end if;
	end if;
end process;

q_n <= cnt_int3;

end behave;

