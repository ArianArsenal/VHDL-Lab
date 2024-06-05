library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity Divider is
    port (
         a : in std_logic_vector(7 downto 0);
         b : in std_logic_vector(3 downto 0);
         Wrong : out std_logic := '0';
         remainder : out std_logic_vector(3 downto 0);
         quotient : out std_logic_vector(3 downto 0)
    );
end Divider;

architecture behavior of Divider is

begin 
    process(a, b)

    variable quotienttmp : unsigned(7 downto 0);
    variable remaindertmp : unsigned(7 downto 0);
   
    begin
            Wrong <= '0';
            if b = "0000" then -- if b = 0 its wrong (divide by zero)
                Wrong <= '1';
            elsif unsigned(a(7 downto 4)) >= unsigned(b) then -- tazmin mishavad quotient 4 bit ast
                Wrong <= '1';
            else
                quotienttmp := (others => '0');
                remaindertmp := (others => '0');
            
                for i in 7 downto 0 loop

                    remaindertmp(6 downto 1) := remaindertmp(5 downto 0);
                    remaindertmp(0) := a(i);
                    
                    if remaindertmp >= unsigned(b) then
                        remaindertmp := remaindertmp - unsigned(b);
                        quotienttmp(i) := '1';
                    end if;
                end loop;
                
                remainder <= std_logic_vector(remaindertmp(3 downto 0));
                quotient <= std_logic_vector(quotienttmp(3 downto 0));
            end if;
    end process;

end behavior;