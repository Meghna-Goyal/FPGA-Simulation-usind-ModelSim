--multiple doesnot have clock so either keep it as separate statements(concurrent process)
-- or keep them in a separate process

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;


entity DT is
	port ( clk	: IN std_logic; 
	       rst	: IN std_logic;
	       D1	: IN std_logic_vector(5 downto 0); 
		   D2	: IN std_logic_vector(3 downto 0); 
		   Dout	: OUT std_logic_vector(11 downto 0)   
		 );
	
end entity;

architecture behave of dT is

signal D1_reg1 : std_logic_vector ( 5 downto 0) := (others => '0');
signal D1_reg2 : std_logic_vector(5 downto 0) := (others => '0');
signal d1_reg3 : std_logic_vector(5 downto 0) := (others => '0');

signal d2_reg1 : std_logic_vector (3 downto 0) := (others => '0');
signal d2_reg2 : std_logic_vector(3 downto 0) := (others => '0');
signal d2_reg3 : std_logic_vector(3 downto 0) := (others => '0');

signal mul1 : std_logic_vector (9 downto 0);
signal mul2 : std_logic_vector (9 downto 0);
signal mul3 : std_logic_vector (9 downto 0);

signal add1: std_logic_vector (10 downto 0);
signal add2: std_logic_vector (11 downto 0);

begin
reg1_proc : process (rst, clk)
	begin
		if rst = '0' then
		D1_reg1 <= (others => '0');
		D1_reg2 <= (others => '0');
		d1_reg3 <= (others => '0');
	
		elsif rising_edge (clk) then
		
		D1_reg1 <= d1;
		D1_reg2 <= D1_reg1;
		d1_reg3 <= D1_reg2;
	    
		end if;
end process;

reg2_proc : process (rst, clk)
	begin
		if rst = '0' then
		
		d2_reg1 <= (others => '0');
		d2_reg2 <= (others => '0');
		d2_reg3 <= (others => '0');
		
		elsif rising_edge (clk) then

        d2_reg1 <= d2;
        d2_reg2 <= d2_reg1;
        d2_reg3 <= d2_reg2;
		
		end if;
end process;
 -- concurrent statements
 
--	mul1 <= D1_reg1 * D1_reg1;	-- multiply d1_reg1 * d2_reg1
	mul1 <= D1_reg1 * D2_reg1;
	
	mul2 <= D1_reg2 * d2_reg2;
	mul3 <= d1_reg3 * d2_reg3;

	add1 <= eXT(mul1, 11) + eXT(mul2, 11);
	add2 <= eXT(add1, 12) + eXT(mul3, 12);

proc_df : process (rst, clk)
begin
		if rst = '0' then	
			  dout <=(others => '0');
		elsif rising_edge (clk) then
	      dout <= add2;
	   end if;  
	end process;

end behave;