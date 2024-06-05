----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    17:10:43 02/19/2024 
-- Design Name: 
-- Module Name:    full_adder - Behavioral 
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

entity full_adder is
    Port ( A : in  STD_LOGIC;
           B : in  STD_LOGIC;
           C_in : in  STD_LOGIC;
           S : out  STD_LOGIC;
           C_out : out  STD_LOGIC);
end full_adder;

architecture Behavioral of full_adder is

component halfadder is
	Port(
		A, B: in std_logic;
		C, S: out std_LOGIC
	);
End component halfadder;

signal e1, e2, e3: std_logic;

begin

	hf1: halfadder port map(A => A, B => B, S => e1, C => e2);
	hf2: halfadder port map(A => e1, B => C_in, S => S, C => e3);
	
	C_out <= e2 or e3;
	
end Behavioral;

