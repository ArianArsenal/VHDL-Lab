library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity OR_4Bit is
    port (
        A : in std_logic_vector(3 downto 0);
        B : out std_logic
    );
end OR_4Bit;

architecture behavioral of OR_4Bit is
signal output1, output2 : std_logic;

component OR_2Bit is 
    port (
        A,B : in std_logic;
        C : out std_logic
    );
end component;


begin

    OR1 : OR_2Bit port map (A => A(0), B => A(1), C => output1);
    OR2 : OR_2Bit port map (A => A(2), B => A(3), C => output2);
    OR3 : OR_2Bit port map (A => output1, B => output2, C => B);

end architecture;