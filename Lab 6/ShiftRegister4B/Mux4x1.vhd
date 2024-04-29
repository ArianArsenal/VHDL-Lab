
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Mux4x1 is
    Port ( I : in  STD_LOGIC_VECTOR(3 downto 0);
           S : in  STD_LOGIC_VECTOR(1 downto 0);
           O : out  STD_LOGIC);
end Mux4x1;

architecture Behavioral of Mux4x1 is

signal W : STD_LOGIC_VECTOR(3 downto 0);

begin

	W(0) <= I(0) and (not S(1) and (not S(0)));
	W(1) <= I(1) and (not S(1) and S(0));
	W(2) <= I(2) and (S(1) and (not S(0)));
	W(3) <= I(3) and S(1) and S(0);
	
	O <= W(0) or W(1) or W(2) or W(3);

end Behavioral;

