--2 counters each one has clock and reset 
-- counter1 = 3 bit, counter2 = 6 bit
-- for every 5th value of counter1, counter2 should be incremented by 1
-- value of counter2 is incremented one clock later the value for counter1 is 5
--rising edge clock
-- active high, async reset

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity counter is 
	port (
			clk : In std_logic;
			rst : in std_logic;
			qout  : out std_logic_vector(5 downto 0)
	);
end entity;

architecture behave of counter is 

signal cnt_int1 : std_logic_vector(2 downto 0) := (others => '0');
signal cnt_int2 : std_logic_vector(5 downto 0) := (others => '0');

begin

cnt_proc1 : process (clk,rst)
begin
--active high reset,async.reset, trigger on rising edge

		if rst = '1' then
			cnt_int1<= (others => '0');
		elsif rising_edge (clk) then 
			cnt_int1 <= cnt_int1+1;
	end if;
end process;
	
cnt_proc2 : process (clk,rst)

begin

--active high reset,async.reset, trigger on rising edge

		if rst = '1' then
			cnt_int2<= (others => '0');
		elsif rising_edge (clk) then
			if cnt_int1 = 5 then 
			cnt_int2 <= cnt_int2+1;
			end if;
	end if;

end process;
-- (other method with single process)
--cnt_proc : process (clk,rst)

--begin
--			if rst = '1' then
--			cnt_int2<= (others => '0');
--			cnt_int2<= (others => '0');
--		elsif rising_edge (clk) then
--			cnt_int1 <= cnt_int1+1;
--			if cnt_int1 = "101" then 
--			cnt_int2 <= cnt_int2+1;
--			else
--			cnt_int2 <= cnt_int2;
--			end if;
--	end if;
--end process;
qout <= cnt_int2;

end behave;


