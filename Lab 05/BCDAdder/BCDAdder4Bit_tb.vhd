
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
ENTITY BCDAdder4Bit_tb IS
END BCDAdder4Bit_tb;
 
ARCHITECTURE behavior OF BCDAdder4Bit_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT BCDAdder4Bit
    PORT(
         A : IN  std_logic_vector(3 downto 0);
         B : IN  std_logic_vector(3 downto 0);
         S : OUT  std_logic_vector(3 downto 0);
         C : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal A : std_logic_vector(3 downto 0) := (others => '0');
   signal B : std_logic_vector(3 downto 0) := (others => '0');

 	--Outputs
   signal S : std_logic_vector(3 downto 0);
   signal C : std_logic;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: BCDAdder4Bit PORT MAP (
          A => A,
          B => B,
          S => S,
          C => C
        );
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	

      -- insert stimulus here 
		
		A <= "0010";
		B <= "1010";
		wait for 20 ns;
		
		A <= "0110";
		B <= "0010";
		wait for 20 ns;
		
		A <= "0011";
		B <= "0010";
		wait for 20 ns;
		
		A <= "0001";
		B <= "0110";
		wait for 20 ns;

      wait;
   end process;

END;
