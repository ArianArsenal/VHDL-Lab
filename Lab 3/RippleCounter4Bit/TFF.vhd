
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity TFF is
    Port ( T : in  STD_LOGIC;
           rst : in  STD_LOGIC;
           clk : in  STD_LOGIC;
           Q : out  STD_LOGIC);
end TFF;

architecture Behavioral of TFF is
signal t_temp : std_logic;
begin

	process(clk,rst)begin
		if(rst = '1')then
			t_temp <= '0';
		elsif(clk = '0' and clk'event and T = '1')then
			t_temp <= not t_temp;
		end if;
	end process;
Q <= t_temp;

end Behavioral;

