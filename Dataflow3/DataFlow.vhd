library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;


Entity dataflow is
	port(  
		data_a : in std_logic_vector(7 downto 0);
		data_b : in std_logic_vector(5 downto 0);
		cnt_in: in std_logic_vector(4 downto 0);
		clk_2: in std_logic;
		rstn_in : in std_logic;
		en_D_in : in std_logic;
		en_M_in : in std_logic;
		d1_out : out std_logic_vector(13 downto 0);
		d2_out: out std_logic_vector(10 downto 0)
	   	);	
end entity;

architecture behave of dataflow is 

signal reg1 : std_logic_vector(7 downto 0) := (others => '0');
signal reg2 : std_logic_vector(5 downto 0) := (others => '0');
signal cnt_sig : std_logic_vector(4 downto 0) := (others => '0');

signal add1 : std_logic_vector(8 downto 0) := (others => '0');
signal add2 : std_logic_vector(8 downto 0) := (others => '0');

signal mul1 : std_logic_vector(13 downto 0) := (others => '0');
signal mul2 : std_logic_vector(10 downto 0) := (others => '0');

signal mp1 : std_logic_vector(13 downto 0) := (others => '0');
signal mp2 : std_logic_vector(10 downto 0) := (others => '0');

begin

reg_proc: process (clk_2, rstn_in)
begin
		if rstn_in = '0' then
			reg1<= (others => '0');
			reg2<= (others => '0');
			cnt_sig<= (others => '0');
		elsif rising_edge (clk_2) then
			reg1 <= data_a;
			reg2 <= data_b;
			cnt_sig <= cnt_in;			
		end if;
end process;
 
 -- concurrent statements
 
add1 <= sxt (reg1 , 9) + sxt (reg2, 9);
add2 <= sxt (reg1 , 9) + sxt (cnt_sig, 9);

mul1 <= reg1 * reg2;
mul2 <= reg2 * cnt_sig;

-- multiplexer
mp1 <= ext(add1, 14) when en_D_in = '1' else mul1;
mp2 <= ext(add2,11) when en_M_in = '1' else mul2;

final_proc: process (clk_2, rstn_in)
begin
		if rstn_in = '0' then
			d1_out<= (others => '0');
			d2_out<= (others => '0');
		elsif rising_edge (clk_2) then
			d1_out <= mp1;
			d2_out <= mp2;
		end if;
end process;


end behave;