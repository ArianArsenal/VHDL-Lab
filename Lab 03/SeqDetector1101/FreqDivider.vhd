----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    17:43:44 03/04/2024 
-- Design Name: 
-- Module Name:    FreqDivider - Behavioral 
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

entity FreqDivider is
    Port ( clk_in : in  STD_LOGIC;
           clk_out : out  STD_LOGIC);
end FreqDivider;

architecture Behavioral of FreqDivider is

signal count : integer := 1;
signal clk_tmp : std_logic := '0';

begin

	process(clk_in) begin
		if(clk_in = '0' and clk_in'event) then
			count <= count + 1;
			if(count = 25000) then
				clk_tmp <= not clk_tmp;
				count <= 1;
			end if;
		end if;
	end process;
	
	clk_out <= clk_tmp;

end Behavioral;

