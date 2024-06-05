
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity ALU is
    Port ( a : in  STD_LOGIC_vector(7 downto 0);
           b : in  STD_LOGIC_vector(7 downto 0);
           sel : in  STD_LOGIC_vector(2 downto 0);
           outmux : out  STD_LOGIC_vector(7 downto 0)
			  );
end ALU;

architecture Behavioral of ALU is

component Divider is
    port (
         a : in std_logic_vector(7 downto 0);
         b : in std_logic_vector(3 downto 0);
         Wrong : out std_logic := '0';
         remainder : out std_logic_vector(3 downto 0);
         quotient : out std_logic_vector(3 downto 0)
    );
end component;

component Multiply4Bit is
    Port ( A : in  STD_LOGIC_VECTOR(3 downto 0);
           B : in  STD_LOGIC_VECTOR(3 downto 0);
           P : out  STD_LOGIC_VECTOR(7 downto 0));
end component;

component RippleAdder4Bit is
    port (
        A : in std_logic_vector(3 downto 0);
        B : in std_logic_vector(3 downto 0);
        C_in : in std_logic;
        Sum : out std_logic_vector(3 downto 0);
        C_out : out std_logic
    );
end component;

component Mux8x1 is
    Port ( In0 : in  STD_LOGIC_VECTOR(7 downto 0);
			  In1 : in  STD_LOGIC_VECTOR(7 downto 0);
			  In2 : in  STD_LOGIC_VECTOR(7 downto 0);
			  In3 : in  STD_LOGIC_VECTOR(7 downto 0);
			  In4 : in  STD_LOGIC_VECTOR(7 downto 0);
			  In5 : in  STD_LOGIC_VECTOR(7 downto 0);
			  In6 : in  STD_LOGIC_VECTOR(7 downto 0);
           S : in  STD_LOGIC_VECTOR(2 downto 0);
           Out_data : out  STD_LOGIC_VECTOR(7 downto 0));
end component;

signal Ands : STD_LOGIC_VECTOR(7 downto 0);
signal Ors : STD_LOGIC_VECTOR(7 downto 0);
signal Xors : STD_LOGIC_VECTOR(7 downto 0);
signal Adds1 : STD_LOGIC_VECTOR(3 downto 0);
signal Adds2 : STD_LOGIC_VECTOR(3 downto 0);
signal carry1 : STD_LOGIC;
signal Subtracts1 : STD_LOGIC_VECTOR(3 downto 0);
signal Subtracts2 : STD_LOGIC_VECTOR(3 downto 0);
signal carry2 : STD_LOGIC;
signal Multiplys : STD_LOGIC_VECTOR(7 downto 0);
signal Divides : STD_LOGIC_VECTOR(7 downto 0);

signal Adds : STD_LOGIC_VECTOR(7 downto 0);
signal Subtracts : STD_LOGIC_VECTOR(7 downto 0);

signal nb : STD_LOGIC_VECTOR(7 downto 0);

begin

	multiplexer : Mux8x1 port map(In0 => Ands, In1 => Ors, In2 => Xors, In3 => Adds, In4 => Subtracts, In5 => Multiplys, In6 => Divides, S => sel, Out_data => outmux);
	Ands <= (a and b);
	Ors <= (a or b);
	Xors <= (a xor b);
	Add1 : RippleAdder4Bit port map(A => a(3 downto 0), B => b(3 downto 0), C_in => '0', Sum => Adds1, C_out => carry1);
	Add2 : RippleAdder4Bit port map(A => a(7 downto 4), B => b(7 downto 4), C_in => carry1, Sum => Adds2, C_out => open);
	Sub1 : RippleAdder4Bit port map(A => a(3 downto 0), B => nb(3 downto 0), C_in => '1', Sum => Subtracts1, C_out => carry2);
	Sub2 : RippleAdder4Bit port map(A => a(7 downto 4), B => nb(7 downto 4), C_in => carry2, Sum => Subtracts2, C_out => open);
	mult : Multiply4Bit port map(A => a(3 downto 0), B => b(3 downto 0), P => Multiplys);
	divide : Divider port map(a => a, b => b(3 downto 0), wrong => open, quotient => Divides(7 downto 4), remainder => Divides(3 downto 0));
	
	Adds <= Adds2 & Adds1;
	Subtracts <= Subtracts2 & Subtracts1;
	nb <= not b;
	
end Behavioral;

