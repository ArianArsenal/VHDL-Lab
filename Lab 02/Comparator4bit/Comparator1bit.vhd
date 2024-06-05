library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Comparator1bit is
    Port ( A : in  STD_LOGIC;
           B : in  STD_LOGIC;
           GThan : in  STD_LOGIC;
           EQ : in  STD_LOGIC;
           LT : in  STD_LOGIC;
           A_GT_B : out  STD_LOGIC;
           A_EQ_B : out  STD_LOGIC;
           A_LT_B : out  STD_LOGIC);
end Comparator1bit;

architecture Behavioral of Comparator1bit is

begin
	
	A_GT_B <= (A and (not B) and EQ) or GThan;
	A_EQ_B <= (A xnor B) and EQ;
	A_LT_B <= ((not A) and B and EQ) or LT;
	
end Behavioral;

