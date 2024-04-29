LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY SeqDetector0110_0101_tb IS
END SeqDetector0110_0101_tb;
 
ARCHITECTURE behavior OF SeqDetector0110_0101_tb IS 
 
    COMPONENT SeqDetector0110_0101
    PORT(
         data : IN  std_logic;
         clk : IN  std_logic;
         VALID : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal data : std_logic := '0';
   signal clk : std_logic := '0';

 	--Outputs
   signal VALID : std_logic := '0';

   constant clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: SeqDetector0110_0101 PORT MAP (
          data => data,
          clk => clk,
          VALID => VALID
        );

   -- Clock process definitions
   clk_process :process
   begin
		clk <= '0';
		wait for clk_period/2;
		clk <= '1';
		wait for clk_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	

      wait for clk_period*10;

      -- insert stimulus here 
		
		data <= '0';
		wait for 10 ns;
		
		data <= '1';
		wait for 10 ns;
		
		data <= '1';
		wait for 10 ns;
		
		data <= '0';
		wait for 10 ns;

        data <= '0';
		wait for 10 ns;

        data <= '0';
		wait for 10 ns;
		
		data <= '0';
		wait for 10 ns;
		
		data <= '1';
		wait for 10 ns;
		
		data <= '0';
		wait for 10 ns;
		
		data <= '1';
		wait for 10 ns;

      wait;
   end process;

END;
