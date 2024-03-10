
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY SeqDetector1101_tb IS
END SeqDetector1101_tb;
 
ARCHITECTURE behavior OF SeqDetector1101_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT SeqDetector1101
    PORT(
         data : IN  std_logic;
         clk : IN  std_logic;
         VALID : OUT  std_logic;
         clk_out : out STD_LOGIC
        );
    END COMPONENT;
    

   --Inputs
   signal data : std_logic := '0';
   signal clk : std_logic := '0';

 	--Outputs
   signal VALID : std_logic;
   signal clk_out :std_logic;

   -- Clock period definitions
   constant clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: SeqDetector1101 PORT MAP (
          data => data,
          clk => clk,
          VALID => VALID,
          clk_out => clk_out
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
		
		data <= '1';
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
