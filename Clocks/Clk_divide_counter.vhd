p_clk_divider: process(i_rst,i_clk)
begin
  if(i_rst='0') then
    clk_divider   <= (others=>'0');
  elsif(rising_edge(i_clk)) then
    clk_divider   <= clk_divider + 1;
  end if;
end process p_clk_divider;
o_clk_div2    <= clk_divider(0);
o_clk_div4    <= clk_divider(1);
o_clk_div8    <= clk_divider(2);
o_clk_div16   <= clk_divider(3);
