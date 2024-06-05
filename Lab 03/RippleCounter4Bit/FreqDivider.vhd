
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity FreqDivider is
    Port ( clk_in : in  STD_LOGIC;
           clk_out : out  STD_LOGIC);
end FreqDivider;

architecture Behavioral of FreqDivider is

signal count : integer := 1;
signal clk_tmp : std_logic := '0';

begin

	process(clk_in) begin
		if(clk_in = '0' and clk_in'event) then
			count <= count + 1;
			if(count = 10) then
				clk_tmp <= not clk_tmp;
				count <= 1;
			end if;
		end if;
	end process;
	
	clk_out <= clk_tmp;

end Behavioral;

