LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
ENTITY Decoder2x4_tb IS
END Decoder2x4_tb;
 
ARCHITECTURE behavior OF Decoder2x4_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT Decoder2x4
    PORT(
         I0 : IN  std_logic;
         I1 : IN  std_logic;
         O0 : OUT  std_logic;
         O1 : OUT  std_logic;
         O2 : OUT  std_logic;
         O3 : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal I0 : std_logic := '0';
   signal I1 : std_logic := '0';

 	--Outputs
   signal O0 : std_logic;
   signal O1 : std_logic;
   signal O2 : std_logic;
   signal O3 : std_logic;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: Decoder2x4 PORT MAP (
          I0 => I0,
          I1 => I1,
          O0 => O0,
          O1 => O1,
          O2 => O2,
          O3 => O3
        );
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;

      -- insert stimulus here 
		I0 <= '0';
		I1 <= '0';
		wait for 20 ns;
		
		I0 <= '1';
		I1 <= '0';
		wait for 20 ns;

		I0 <= '0';
		I1 <= '1';
		wait for 20 ns;
		
		I0 <= '1';
		I1 <= '1';
		wait for 20 ns;

      wait;
   end process;

END;