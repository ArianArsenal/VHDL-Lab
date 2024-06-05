library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Encoder4x2 is
    Port ( I0 : in  STD_LOGIC;
           I1 : in  STD_LOGIC;
           I2 : in  STD_LOGIC;
           I3 : in  STD_LOGIC;
           O0 : out  STD_LOGIC;
           O1 : out  STD_LOGIC;
           V : out  STD_LOGIC);
end Encoder4x2;

architecture Behavioral of Encoder4x2 is

begin

	O0 <= I1 or I3;
	O1 <= I2 or I3;
	V <= I0 or I1 or I2 or I3;

end Behavioral;