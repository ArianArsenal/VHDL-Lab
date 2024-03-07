library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Comparator4bit is
    Port ( A : in  STD_LOGIC_VECTOR(3 downto 0);
           B : in  STD_LOGIC_VECTOR(3 downto 0);
           GThan : in  STD_LOGIC;
           EQ : in  STD_LOGIC;
           LT : in  STD_LOGIC;
           A_GT_B : out  STD_LOGIC;
           A_EQ_B : out  STD_LOGIC;
           A_LT_B : out  STD_LOGIC);
end Comparator4bit;

architecture Behavioral of Comparator4bit is

component Comparator1bit is
	Port ( A : in  STD_LOGIC;
           B : in  STD_LOGIC;
           GThan : in  STD_LOGIC;
           EQ : in  STD_LOGIC;
           LT : in  STD_LOGIC;
           A_GT_B : out  STD_LOGIC;
           A_EQ_B : out  STD_LOGIC;
           A_LT_B : out  STD_LOGIC);
end component;

signal internal_eq, internal_gt, internal_lt: STD_LOGIC_VECTOR(2 downto 0);

begin
	
	comp3: Comparator1bit port map(A => A(3), B => B(3), 
									 GThan => GThan, EQ => EQ, LT => LT,
									 A_GT_B => internal_gt(2), A_EQ_B => internal_eq(2), A_LT_B => internal_lt(2));
	
	comp2: Comparator1bit port map(A => A(2), B => B(2), 
									 GThan => internal_gt(2), EQ => internal_eq(2), LT => internal_lt(2),
									 A_GT_B => internal_gt(1), A_EQ_B => internal_eq(1), A_LT_B => internal_lt(1));

	comp1: Comparator1bit port map(A => A(1), B => B(1), 
									 GThan => internal_gt(1), EQ => internal_eq(1), LT => internal_lt(1),
									 A_GT_B => internal_gt(0), A_EQ_B => internal_eq(0), A_LT_B => internal_lt(0));
									 
	comp0: Comparator1bit port map(A => A(0), B => B(0), 
									 GThan => internal_gt(0), EQ => internal_eq(0), LT => internal_lt(0),
									 A_GT_B => A_GT_B, A_EQ_B => A_EQ_B, A_LT_B => A_LT_B);

end Behavioral;

