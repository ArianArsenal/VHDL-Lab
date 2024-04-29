
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity SimpleMultiplier4Bit is
    Port ( A : in  STD_LOGIC_VECTOR(3 downto 0);
           B : in  STD_LOGIC_VECTOR(3 downto 0);
           P : out  STD_LOGIC_VECTOR(7 downto 0));
end SimpleMultiplier4Bit;

architecture Behavioral of SimpleMultiplier4Bit is

component halfadder is
	Port(
		A, B: in std_logic;
		C, S: out std_LOGIC
	);
End component halfadder;

component full_adder is
    Port ( A : in  STD_LOGIC;
           B : in  STD_LOGIC;
           C_in : in  STD_LOGIC;
           S : out  STD_LOGIC;
           C_out : out  STD_LOGIC);
end component;

signal B0, B1, B2, B3 : STD_LOGIC_Vector(3 downto 0);
signal S0, S1 : STD_LOGIC_VECTOR(3 downto 0);
signal C0, C1, C2 : STD_LOGIC_VECTOR(3 downto 0);

begin

	H0 : HalfAdder port map(A => B0(1), B => B1(0), C => C0(0), S => S0(0));
	F0 : full_adder port map(A => B0(2), B => B1(1), C_in => C0(0), C_out => C0(1), S => S0(1));
	F1 : full_adder port map(A => B0(3), B => B1(2), C_in => C0(1), C_out => C0(2), S => S0(2));
	H1 : HalfAdder port map(A => C0(2), B => B1(3), C => C0(3), S => S0(3));
	
	H2 : HalfAdder port map(A => B2(0), B => S0(1), C => C1(0), S => S1(0));
	F2 : full_adder port map(A => B2(1), B => S0(2), C_in => C1(0), C_out => C1(1), S => S1(1));
	F3 : full_adder port map(A => B2(2), B => S0(3), C_in => C1(1), C_out => C1(2), S => S1(2));
	F4 : full_adder port map(A => B2(3), B => C0(3), C_in => C1(2), C_out => C1(3), S => S1(3));
	
	H3 : HalfAdder port map(A => B3(0), B => S1(1), C => C2(0), S => P(3));
	F5 : full_adder port map(A => B3(1), B => S1(2), C_in => C2(0), C_out => C2(1), S => P(4));
	F6 : full_adder port map(A => B3(2), B => S1(3), C_in => C2(1), C_out => C2(2), S => P(5));
	F7 : full_adder port map(A => B3(3), B => C1(3), C_in => C2(2), C_out => C2(3), S => P(6));
												 
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
	
	P(1) <= S0(0);
	P(2) <= S1(0);
	P(7) <= C2(3);

end Behavioral;

