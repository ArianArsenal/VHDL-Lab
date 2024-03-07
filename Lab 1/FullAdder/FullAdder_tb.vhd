--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   17:20:58 02/19/2024
-- Design Name:   
-- Module Name:   D:/ParsAri/FullAdderLAB1/fulladder_tb.vhd
-- Project Name:  FullAdderLAB1
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: full_adder
-- 
-- Dependencies:
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
--
-- Notes: 
-- This testbench has been automatically generated using types std_logic and
-- std_logic_vector for the ports of the unit under test.  Xilinx recommends
-- that these types always be used for the top-level I/O of a design in order
-- to guarantee that the testbench will bind correctly to the post-implementation 
-- simulation model.
--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY fulladder_tb IS
END fulladder_tb;
 
ARCHITECTURE behavior OF fulladder_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT full_adder
    PORT(
         A : IN  std_logic;
         B : IN  std_logic;
         C_in : IN  std_logic;
         S : OUT  std_logic;
         C_out : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal A : std_logic := '0';
   signal B : std_logic := '0';
   signal C_in : std_logic := '0';

 	--Outputs
   signal S : std_logic;
   signal C_out : std_logic;
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
   
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: full_adder PORT MAP (
          A => A,
          B => B,
          C_in => C_in,
          S => S,
          C_out => C_out
        );

   -- Clock process definitions
  

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
		
		A <= '0', '1' after 25 ns;
		B <= '0', '1' after 50 ns;
		C_in <= '0', '1' after 100 ns;
		
      wait for 100 ns;	

      

      -- insert stimulus here 

      wait;
   end process;

END;
