
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity DFF is
    Port ( D : in  STD_LOGIC;
			  Load : in STD_LOGIC;
           clk : in  STD_LOGIC;
           Q : out  STD_LOGIC);
end DFF;

architecture Behavioral of DFF is

begin
	process(clk)
		begin 
			if(clk = '1' and clk'event and Load = '1') then
				Q <= D;
			end if;
	end process;


end Behavioral;

