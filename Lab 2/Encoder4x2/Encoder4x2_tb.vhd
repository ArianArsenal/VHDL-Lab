LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY Encoder4x2_tb IS
END Encoder4x2_tb;
 
ARCHITECTURE behavior OF Encoder4x2_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT Encoder4x2
    PORT(
         I0 : IN  std_logic;
         I1 : IN  std_logic;
         I2 : IN  std_logic;
         I3 : IN  std_logic;
         O0 : OUT  std_logic;
         O1 : OUT  std_logic;
         V : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal I0 : std_logic := '0';
   signal I1 : std_logic := '0';
   signal I2 : std_logic := '0';
   signal I3 : std_logic := '0';

 	--Outputs
   signal O0 : std_logic;
   signal O1 : std_logic;
   signal V : std_logic;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: Encoder4x2 PORT MAP (
          I0 => I0,
          I1 => I1,
          I2 => I2,
          I3 => I3,
          O0 => O0,
          O1 => O1,
          V => V
        );

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	

      -- insert stimulus here 
		I0 <= '1';
		I1 <= '0';
		I2 <= '0';
		I3 <= '0';
		wait for 20 ns;

		I0 <= '0';
		I1 <= '1';
		I2 <= '0';
		I3 <= '0';
		wait for 20 ns;
		
		I0 <= '0';
		I1 <= '0';
		I2 <= '1';
		I3 <= '0';
		wait for 20 ns;
		
		I0 <= '0';
		I1 <= '0';
		I2 <= '0';
		I3 <= '1';
		wait for 20 ns;
		
		wait;
   end process;

END;
