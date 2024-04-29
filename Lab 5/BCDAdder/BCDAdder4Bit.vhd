
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity BCDAdder4Bit is
    Port ( A : in  STD_LOGIC_VECTOR(3 downto 0);
           B : in  STD_LOGIC_VECTOR(3 downto 0);
           S : out  STD_LOGIC_VECTOR(3 downto 0);
           C : out  STD_LOGIC);
end BCDAdder4Bit;

architecture Behavioral of BCDAdder4Bit is

component RippleAdder4Bit is
    port (
        A : in std_logic_vector(3 downto 0);
        B : in std_logic_vector(3 downto 0);
        C_in : in std_logic;
        Sum : out std_logic_vector(3 downto 0);
        C_out : out std_logic
    );
end component;

signal S0 : STD_LOGIC_VECTOR(3 downto 0);
signal C0, C1 : std_logic;
signal and1, andd2 : std_logic;
signal or1 : std_logic;

begin

	ripple1 : RippleAdder4Bit port map(A => A, B => B, C_in => '0', Sum => S0, C_Out => C0);
	ripple2 : RippleAdder4Bit port map(A => S0, B(0) => '0', B(1) => or1, B(2) => or1, B(3) => '0', C_in => '0', Sum => S, C_Out => C1);
	
	and1 <= s0(3) and s0(2);
	andd2 <= s0(3) and s0(1);
	or1 <= c0 or and1 or andd2;
	C <= or1;

end Behavioral;

