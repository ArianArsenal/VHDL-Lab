
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY ArrayMultiplier4Bit_tb IS
END ArrayMultiplier4Bit_tb;
 
ARCHITECTURE behavior OF ArrayMultiplier4Bit_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT ArrayMultiplier4Bit
    PORT(
         A : IN  std_logic_vector(3 downto 0);
         B : IN  std_logic_vector(3 downto 0);
         P : OUT  std_logic_vector(7 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal A : std_logic_vector(3 downto 0) := (others => '0');
   signal B : std_logic_vector(3 downto 0) := (others => '0');

 	--Outputs
   signal P : std_logic_vector(7 downto 0);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
BEGIN

   uut : ArrayMultiplier4Bit PORT MAP (
          A => A,
          B => B,
          P => P
    );
 

   -- Stimulus process
   tb: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;

      -- insert stimulus here 
		
		A <= "0001";
		B <= "0010";
		
		wait for 20 ns;
		
		A <= "0011";
		B <= "0110";
		
		wait for 20 ns;
		
		A <= "0101";
		B <= "0011";
		
		wait for 20 ns;
		
		A <= "0100";
		B <= "0100";
		
		wait for 20 ns;
		
		A <= "0100";
		B <= "0100";

      wait;
   end process;

END architecture;
