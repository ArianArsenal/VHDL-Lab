LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY Mux4x1_tb IS
END Mux4x1_tb;
 
ARCHITECTURE behavior OF Mux4x1_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT Mux4x1
    PORT(
         I0 : IN  std_logic;
         I1 : IN  std_logic;
         I2 : IN  std_logic;
         I3 : IN  std_logic;
         Out1 : OUT  std_logic;
         S0 : IN  std_logic;
         S1 : IN  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal I0 : std_logic := '0';
   signal I1 : std_logic := '0';
   signal I2 : std_logic := '0';
   signal I3 : std_logic := '0';
   signal S0 : std_logic := '0';
   signal S1 : std_logic := '0';

 	--Outputs
   signal Out1 : std_logic;
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: Mux4x1 PORT MAP (
          I0 => I0,
          I1 => I1,
          I2 => I2,
          I3 => I3,
          Out1 => Out1,
          S0 => S0,
          S1 => S1
        );
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;

      -- insert stimulus here 
		I0 <= '1';
		I1 <= '1';
		I2 <= '1';
		I3 <= '0';
		
		S0 <= '0';
		S1 <= '0';
		wait for 20 ns;
		
		S0 <= '1';
		S1 <= '0';
		wait for 20 ns;
		
		S0 <= '0';
		S1 <= '1';
		wait for 20 ns;
		
		S0 <= '1';
		S1 <= '1';
		wait for 20 ns;

      wait;
   end process;

END;
