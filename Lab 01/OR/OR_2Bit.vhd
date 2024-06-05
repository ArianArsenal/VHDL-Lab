library ieee;
use ieee.std_logic_1164.all;
--use ieee.numeric_std.all;

entity OR_2Bit is
    port (
        A,B : in std_logic;
        C : out std_logic
    );
end OR_2Bit;

architecture behavioral of OR_2Bit is
begin

    C <= A or B;

end behavioral;


