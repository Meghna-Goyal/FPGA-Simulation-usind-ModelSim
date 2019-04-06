library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;


Entity counter is
	port(  
			clk : In std_logic;
			rst : in std_logic;
			en  : in std_logic;
			rstn: out std_logic;
			clk_2: out std_logic;
			qout : out std_logic_vector(4 downto 0);
			en_D : out std_logic;
			en_M : out std_logic
	   	);
		
end entity;

architecture behave of counter is

signal cnt_int1 : std_logic_vector(1 downto 0) := (others => '0');
signal cnt_int2 : std_logic_vector(4 downto 0) := (others => '0');
signal	clk_sig : std_logic := '0';

begin

cnt_proc : process (clk,rst)

begin
		if rst = '1' then
			cnt_int1<= (others => '0');
			cnt_int2<= (others => '0');
		elsif rising_edge (clk) then
			if en = '1' then
				cnt_int1 <= cnt_int1+1;
			else
				cnt_int1 <= cnt_int1;
			end if;
			
			if cnt_int1 = "10" then
				cnt_int2 <= cnt_int2+1;
			else
				cnt_int2 <= cnt_int2;
			end if;
			
			if cnt_int2 = "01001" then
			en_d <= '1';
			elsif cnt_int2 = "11010" then
			en_M <= '1';
			end if;
			
		end if;
end process;

clk2_proc: process(clk, rst)
begin
	if rst = '1' then
		clk_sig <= '0';
	elsif rising_edge (clk) then
		clk_sig <= not clk_sig;
	end if;
end process;

rstn_proc: process(clk, rst)
begin
	if rst = '1' then
		rstn <= '0';
	elsif rising_edge (clk) then
		rstn <= not rst;
	end if;
end process;

qout <= cnt_int2;
clk_2 <= clk_sig;

end behave;		