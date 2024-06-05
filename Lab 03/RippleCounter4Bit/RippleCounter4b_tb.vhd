
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
ENTITY RippleCounter4b_tb IS
END RippleCounter4b_tb;
 
ARCHITECTURE behavior OF RippleCounter4b_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT RippleCounter4b
    PORT(
         clk : IN  std_logic;
         rst : IN  std_logic;
         Output_r : OUT  std_logic_vector(3 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal clk : std_logic := '0';
   signal rst : std_logic := '1';

 	--Outputs
   signal Output_r : std_logic_vector(3 downto 0);

   -- -- Clock period definitions
   constant clk_period : time := 1 ns;

BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: RippleCounter4b PORT MAP (
          clk => clk,
          rst => rst,
          Output_r => Output_r
        );

   --Clock process definitions
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
		rst <= '0';
   
      wait for clk_period*10;

      -- insert stimulus here 

      wait;
   end process stim_proc;

END;
