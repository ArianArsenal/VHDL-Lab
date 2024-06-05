library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity CarryLookahead4Bit is
    port (
        a, b : in std_logic_vector(3 downto 0);
        cin : in std_logic;

        s : out std_logic_vector(3 downto 0);
        cout : out std_logic
    );
end CarryLookahead4Bit;

architecture Behavioral of CarryLookahead4Bit is

    component full_adder is
        Port ( A : in  STD_LOGIC;
               B : in  STD_LOGIC;
               C_in : in  STD_LOGIC;
               S : out  STD_LOGIC;
               C_out : out  STD_LOGIC);
    end component full_adder;

    signal p, g, c, tmp_c : std_logic_vector(3 downto 0);
    

    begin
        g <= a and b;
        p <= a xor b;

        c(0) <= g(0) or (p(0) and cin);
        c(1) <= g(1) or (p(1) and g(0)) or (p(1) and p(0) and cin);
        c(2) <= g(2) or (p(2) and g(1)) or (p(2) and p(1) and g(0)) or (p(2) and p(1) and p(0) and cin);
        c(3) <= g(3) or (p(3) and g(2)) or (p(3) and p(2) and g(1)) or (P(3) and p(2) and p(1) and g(0)) or (p(3) and p(2) and p(1) and p(0) and cin);

        FA0: full_adder port map(a => A(0), b => B(0) , C_in => Cin , S => s(0), c_out =>tmp_c(0));
        FA1: full_adder port map(a => A(1), b => B(1) , C_in => C(0) , S => s(1), c_out =>tmp_c(1));
        FA2: full_adder port map(a => A(2), b => B(2) , C_in => C(1) , S => s(2), c_out =>tmp_c(2));
        FA3: full_adder port map(a => A(3), b => B(3) , C_in => C(2) , S => s(3), c_out =>tmp_c(3));

        cout <= c(3);
    
end architecture;
