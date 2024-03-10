----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    16:40:22 03/04/2024 
-- Design Name: 
-- Module Name:    TFF - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity T_flipflop is
    Port ( T : in  STD_LOGIC;
           rst : in  STD_LOGIC;
           clk : in  STD_LOGIC;
           Q : out  STD_LOGIC);
end T_flipflop;

architecture Behavioral of T_flipflop is
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

