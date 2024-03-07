library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Decoder2x4 is
    Port ( I0 : in  STD_LOGIC;
           I1 : in  STD_LOGIC;
           O0 : out  STD_LOGIC;
           O1 : out  STD_LOGIC;
           O2 : out  STD_LOGIC;
           O3 : out  STD_LOGIC);
end Decoder2x4;

architecture Behavioral of Decoder2x4 is

begin

	O0 <= (not I1) and (not I0);
	O1 <= (not I1) and I0;
	O2 <= I1 and (not I0);
	O3 <= I1 and I0;

end Behavioral;

