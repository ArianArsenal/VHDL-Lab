library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity T_flipflop is
    port (
        clk : in std_logic;
        rst : in std_logic;
        T : in std_logic;
        Q : out std_logic
    );
end T_flipflop;

architecture rtl of T_flipflop is
signal t_temp <= T;
    
begin

    process(clk,rst)

        if(rst = '1') then
            t_temp <= '0';
        elsif(clk = '0' and clk'event) then
            t_temp <= not t_temp;
        end if;
            
    end process;

end architecture;