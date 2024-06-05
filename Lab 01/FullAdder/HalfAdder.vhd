----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    17:06:58 02/19/2024 
-- Design Name: 
-- Module Name:    halfadder - Behavioral 
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

entity halfadder is
	Port(
		A, B: in std_logic;
		S, C: out std_logic
	);
end halfadder;

architecture Behavioral of halfadder is


begin

	S <= A xor B;
	C <= A and B;

end Behavioral;

