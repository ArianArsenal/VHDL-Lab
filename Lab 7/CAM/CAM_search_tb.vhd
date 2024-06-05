
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY CAM_search_tb IS
END CAM_search_tb;
 
ARCHITECTURE behavior OF CAM_search_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)

    COMPONENT CAM_search
        Port (
            Data_in : in  STD_LOGIC_VECTOR(7 downto 0);
            Reset : in  STD_LOGIC;
            Match : out  STD_LOGIC;
            R : in  STD_LOGIC;
            W : in STD_LOGIC;
            CLK : in STD_LOGIC
            );
    end COMPONENT;
  
   --Inputs
   signal Data_in :std_logic_vector(7 downto 0);
   signal R : std_logic:='0';
   signal W : std_logic:= '0';
   signal Reset : std_logic := '0';
   signal CLK : std_logic := '0';

 	--Outputs
     signal Match : std_logic :='0';

   -- Clock period definitions
   constant CLK_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: CAM_search PORT MAP (
          Data_in => Data_in,
          Reset => Reset,
          Match => Match,
          R => R,
          W => W,
          CLK => CLK
        );

   -- Clock process definitions
   CLK_process :process
   begin
		CLK <= '0';
		wait for CLK_period/2;
		CLK <= '1';
		wait for CLK_period/2;
   end process;

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	
		
		Reset <= '1';
		wait for 20 ns;
		Reset <= '0';
		wait for 20 ns;
		Reset <= '1';
		wait for 20 ns;
      
      Reset <= '0';

      wait for 20 ns;
		
		W <= '1';
        Data_in <= "10000000";

        wait for 20 ns;
        W <= '0';

        Data_in <= "10000000";
        R <= '1';

        wait for 20 ns;

        R <= '0';

        wait for 20 ns;

        R <= '1';
        Data_in <= "00000010";

        
      wait for CLK_period*10;

      wait;
   end process;

END;
