library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity Mux2x1 is
    port (
        a : in std_logic; --I0
        b : in std_logic; --I1
        s : in std_logic; --Select
        O : out std_logic --Output
    );
end Mux2x1;

architecture Behavioral of Mux2x1 is
begin
    process (a,b,s)
    begin
        if s = '0' then
            O <= a;
          else
            O <= b;
          end if;
        end process;
end Behavioral;
