library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity CarrySelectAdder4Bit is
    port (
        a : in std_logic_vector(3 downto 0);
        b : in std_logic_vector(3 downto 0);
        Cin : in std_logic;
        Sum : out std_logic_vector(3 downto 0);
        Cout : out std_logic
    );
end CarrySelectAdder4Bit;

architecture Behavioral of CarrySelectAdder4Bit is

component CarryLookahead4Bit is
    port (
        a, b : in std_logic_vector(3 downto 0);
        cin : in std_logic;

        s : out std_logic_vector(3 downto 0);
        cout : out std_logic
    );
end component;

component Mux2x1 is
    port (
        a : in std_logic; --I0
        b : in std_logic; --I1
        s : in std_logic; --Select
        O : out std_logic --Output
    );
end component;

signal s0, s1: std_logic_vector(3 downto 0);
signal c0, c1: std_logic;

begin

    CLH0: CarryLookahead4Bit port map(a => a, b => b, cin => '0', s => s0, cout => c0);
    CLH1: CarryLookahead4Bit port map(a => a, b => b, cin => '1', s => s1, cout => c1);

    M0: Mux2x1 port map(a => s0(0), b => s1(0), s => cin, O => sum(0));
    M1: Mux2x1 port map(a => s0(1), b => s1(1), s => cin, O => sum(1));
    M2: Mux2x1 port map(a => s0(2), b => s1(2), s => cin, O => sum(2));
    M3: Mux2x1 port map(a => s0(3), b => s1(3), s => cin, O => sum(3));

    M4: Mux2x1 port map(a => c0, b => c1, s => cin, O => cout);

end architecture;