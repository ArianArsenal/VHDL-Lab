
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity PriorityEncoder4x2 is
    Port ( I : in  STD_LOGIC_VECTOR(3 downto 0);
           O : out  STD_LOGIC_VECTOR(1 downto 0);
			  V : OUT STD_LOGIC);
end PriorityEncoder4x2;

architecture Behavioral of PriorityEncoder4x2 is

begin

	process(I) begin
		if(I(0) = '1') then
			O <= "00";
			V <= '1';
		elsif(I(1) = '1') then
			O <= "01";
			V <= '1';
		elsif(I(2) = '1') then
			O <= "10";
			V <= '1';
		elsif(I(3) = '1') then
			O <= "11";
			V <= '1';
		else
			O <= "00";
			V <= '0';
		end if;
	end process;

end Behavioral;

