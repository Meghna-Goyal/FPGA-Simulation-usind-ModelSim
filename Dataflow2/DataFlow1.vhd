
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;


entity DF is 
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
end Entity;

architecture behave of DF is 

signal latch1 : std_logic_vector(7 downto 0) := (others => '0');
signal latch2 : std_logic_vector(7 downto 0) := (others => '0');
signal latch3 : std_logic_vector(7 downto 0) := (others => '0');
signal latch4 : std_logic_vector(7 downto 0) := (others => '0');
signal latch5 : std_logic_vector(7 downto 0) := (others => '0');
signal latch6 : std_logic_vector(7 downto 0) := (others => '0');

signal d1_reg1 : std_logic_vector(7 downto 0) := (others => '0');
signal d1_reg2 : std_logic_vector(7 downto 0) := (others => '0');
signal d1_reg3 : std_logic_vector(7 downto 0) := (others => '0');

signal mul1 : std_logic_vector (15 downto 0);
signal mul2 : std_logic_vector (15 downto 0);
signal mul3 : std_logic_vector (15 downto 0);

signal add1: std_logic_vector (16 downto 0);
signal add2: std_logic_vector (17 downto 0);

signal Reg_Out: std_logic_vector (17 downto 0);


begin

latch1_proc : process (lad1, D1)
begin 
		if lad1 = '1' then
		 latch1 <= D1;
		else
		 latch1 <= latch1;
		end if;

end process;

latch4_proc : process (latch1, lad4)
begin 
		if lad4 = '1' then
		 latch4 <= latch1;
		else
		 latch4 <= latch4;
		end if;
end process;

latch2_proc : process (lad2, D1)
begin 
		if lad2 = '1' then
		 latch2 <= D1;
		else
		 latch2 <= latch2;
		end if;

end process;

latch5_proc : process (latch2, lad4)
begin 
		if lad4 = '1' then
		 latch5 <= latch2;
		else
		 latch5 <= latch5;
		end if;
end process;

latch3_proc : process (lad3, D1)
begin 
		if lad3 = '1' then
		 latch3 <= D1;
		else
		 latch3 <= latch3;
		end if;

end process;

latch6_proc : process (latch3, lad4)
begin 
		if lad4 = '1' then
		 latch6 <= latch3;
		else
		 latch6 <= latch6;
		end if;
end process;

reg_proc : process (rst, clk)
	begin
		if rising_edge (clk) then
		
		D1_reg1 <= D1;
		D1_reg2 <= D1_reg1;
		d1_reg3 <= D1_reg2;
	    reg_out <= add2;
		else
		
		D1_reg1 <= D1_reg1;
		D1_reg2 <= D1_reg2;
		d1_reg3 <= D1_reg3;
		Reg_Out <= Reg_Out;
		end if;
end process;


	mul1 <= latch4 * D1_reg1;
	mul2 <= latch5 * d1_reg2;
	mul3 <= latch6 * d1_reg3;
	
	add1 <= eXT(mul1, 17) + eXT(mul2, 17);
	add2 <= eXT(add1, 18) + eXT(mul3, 18);

	dout <= Reg_Out;
end behave;