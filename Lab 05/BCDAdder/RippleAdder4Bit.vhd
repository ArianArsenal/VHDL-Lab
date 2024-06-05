library ieee;
use ieee.std_logic_1164.all;

entity RippleAdder4Bit is
    port (
        A : in std_logic_vector(3 downto 0);
        B : in std_logic_vector(3 downto 0);
        C_in : in std_logic;
        Sum : out std_logic_vector(3 downto 0);
        C_out : out std_logic
    );
end RippleAdder4Bit;

architecture Behavioral of RippleAdder4Bit is

component full_adder is
    port (
        A : in std_logic;
        B : in std_logic;
        C_in : in std_logic;
        S : out std_logic;
        C_out : out std_logic
    );
end component;
--signals
signal C :std_logic_vector(3 downto 0);

begin

    FA0: full_adder port map(a => A(0), b => B(0) , C_in => C_in , S => Sum(0), c_out =>C(0));
    FA1: full_adder port map(a => A(1), b => B(1) , C_in => C(0) , S => Sum(1), c_out =>C(1));
    FA2: full_adder port map(a => A(2), b => B(2) , C_in => C(1) , S => Sum(2), c_out =>C(2));
    FA3: full_adder port map(a => A(3), b => B(3) , C_in => C(2) , S => Sum(3), c_out =>C(3));

    C_out <= C(3);

end Behavioral;


