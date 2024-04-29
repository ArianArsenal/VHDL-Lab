library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity FreqDivider is
    Port ( clk_in : in  STD_LOGIC;
           clk_out : out  STD_LOGIC);
end FreqDivider;

architecture Behavioral of FreqDivider is

signal counter : INTEGER := 0;
signal clk_out_tmp : STD_LOGIC := '0';

begin

	process(clk_in) begin
		if(clk_in = '1' and clk_in'event) then
			counter <= counter + 1;
			if(counter = 40000000) then
				counter <= 0;
				clk_out_tmp <= not clk_out_tmp;
			end if;
		end if;
	end process;
	
	clk_out <= clk_out_tmp;

end Behavioral;

