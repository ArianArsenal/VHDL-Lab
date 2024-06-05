
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity ShiftRegister4B is
    Port ( Reset : in  STD_LOGIC;
           Load : in  STD_LOGIC;
           L : in  STD_LOGIC;
           R : in  STD_LOGIC;
           D : in  STD_LOGIC_VECTOR(3 downto 0);
           Q : out  STD_LOGIC_VECTOR(3 downto 0);
			  clk : in STD_LOGIC);
end ShiftRegister4B;

architecture Behavioral of ShiftRegister4B is

component DFF is
    Port ( D : in  STD_LOGIC;
			  Load : in STD_LOGIC;
           clk : in  STD_LOGIC;
           Q : out  STD_LOGIC);
end component;

component Mux4x1 is
    Port ( I : in  STD_LOGIC_VECTOR(3 downto 0);
           S : in  STD_LOGIC_VECTOR(1 downto 0);
           O : out  STD_LOGIC);
end component;

component PriorityEncoder4x2 is
    Port ( I : in  STD_LOGIC_VECTOR(3 downto 0);
           O : out  STD_LOGIC_VECTOR(1 downto 0);
			  V : OUT STD_LOGIC);
end component;

signal M, Q_tmp : STD_LOGIC_VECTOR(3 downto 0);
signal P : STD_LOGIC_VECTOR(1 downto 0);
signal Valid : STD_LOGIC;

begin
	
	priorityEncoder1 : PriorityEncoder4x2 Port Map(I(0) => Reset, I(1) => Load, 
																  I(2) => L, I(3) => R, O => P, V => Valid);
	
	Mux3 : Mux4x1 Port Map(I(0) => '0', I(1) => D(3), I(2) => Q_tmp(2), I(3) => '0', 
								  S => P, O => M(3));
	Mux2 : Mux4x1 Port Map(I(0) => '0', I(1) => D(2), I(2) => Q_tmp(1), I(3) => Q_tmp(3), 
								  S => P, O => M(2));
	Mux1 : Mux4x1 Port Map(I(0) => '0', I(1) => D(1), I(2) => Q_tmp(0), I(3) => Q_tmp(2), 
								  S => P, O => M(1));
	Mux0 : Mux4x1 Port Map(I(0) => '0', I(1) => D(0), I(2) => '0', I(3) => Q_tmp(1), 
								  S => P, O => M(0));
	
	Q <= Q_tmp;
	
	DFF3 : DFF Port Map(D => M(3), Load => Valid, clk => clk, Q => Q_tmp(3));
	DFF2 : DFF Port Map(D => M(2), Load => Valid, clk => clk, Q => Q_tmp(2));
	DFF1 : DFF Port Map(D => M(1), Load => Valid, clk => clk, Q => Q_tmp(1));
	DFF0 : DFF Port Map(D => M(0), Load => Valid, clk => clk, Q => Q_tmp(0));


end Behavioral;

