library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity D_flipflop is
    port (
        D : in std_logic;
        clk : in std_logic;
        rst : in std_logic;
        Q : out std_logic
    );
end D_flipflop;

architecture rtl of D_flipflop is

begin
    process(clk,rst)
        begin
            if(rst = '1') then 
            Q <= '0'; 
            
        elsif(clk = 0 and clk'event) then
            Q <= D;

        end if;
    end process;

end architecture;