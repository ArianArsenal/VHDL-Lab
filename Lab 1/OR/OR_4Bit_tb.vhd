LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
ENTITY OR_4Bit_tb IS
END OR_4Bit_tb;
 
ARCHITECTURE behavior OF OR_4Bit_tb IS 
 
   -- Component Declaration for the Unit Under Test (UUT)
 
   COMPONENT OR_4Bit
   PORT(
      A : IN  std_logic_vector(3 downto 0);
      B : out  std_logic
      );
   END COMPONENT;
   
   --Inputs
   signal A : std_logic_vector(3 downto 0) := "0000";

 	--Outputs
   signal B : std_logic;

   
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: OR_4Bit PORT MAP 
      (
         A => A,
         B => B
      );
        
   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
		
      wait for 20 ns;

      A <= "1000";
      wait for 20 ns;

      A <= "0010";
      wait for 20 ns;

      A <= "0100";
      wait for 20 ns;


      wait for 100 ns;	


      wait;
   end process;

END;
