
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity ArrayMultiplier4Bit is
    Port ( A : in  STD_LOGIC_VECTOR(3 downto 0);
           B : in  STD_LOGIC_VECTOR(3 downto 0);
           P : out  STD_LOGIC_VECTOR(7 downto 0));
end ArrayMultiplier4Bit;

architecture Behavioral of ArrayMultiplier4Bit is

component RippleAdder4Bit is
    port (
        A : in std_logic_vector(3 downto 0);
        B : in std_logic_vector(3 downto 0);
        C_in : in std_logic;
        Sum : out std_logic_vector(3 downto 0);
        C_out : out std_logic
    );
end component;

signal B0, B1, B2, B3 : STD_LOGIC_Vector(3 downto 0);
signal S0, S1 : STD_LOGIC_VECTOR(3 downto 0);

begin

	Adder1 : RippleAdder4Bit port map(A(0) => B0(1), A(1) => B0(2), A(2) => B0(3), A(3) => '0',
												 B => B1,
												 C_in => '0', Sum(0) => P(1), Sum(1) => S0(0), Sum(2) => S0(1), Sum(3) => S0(2), C_out => S0(3));
	
	Adder2 : RippleAdder4Bit port map(A => S0,
												 B => B2,
												 C_in => '0', Sum(0) => P(2), Sum(1) => S1(0), Sum(2) => S1(1), Sum(3) => S1(2), C_out => S1(3));
	
	Adder3 : RippleAdder4Bit port map(A => S1,
												 B => B3,
												 C_in => '0', Sum(0) => P(3), Sum(1) => P(4), Sum(2) => P(5), Sum(3) => P(6), C_out => P(7));
												 
	B0(0) <= B(0) and A(0);
	B0(1) <= B(0) and A(1);
	B0(2) <= B(0) and A(2);
	B0(3) <= B(0) and A(3);
	
	B1(0) <= B(1) and A(0);
	B1(1) <= B(1) and A(1);
	B1(2) <= B(1) and A(2);
	B1(3) <= B(1) and A(3);
	
	B2(0) <= B(2) and A(0);
	B2(1) <= B(2) and A(1);
	B2(2) <= B(2) and A(2);
	B2(3) <= B(2) and A(3);

	B3(0) <= B(3) and A(0);
	B3(1) <= B(3) and A(1);
	B3(2) <= B(3) and A(2);
	B3(3) <= B(3) and A(3);
	
	P(0) <= B0(0);

end Behavioral;

