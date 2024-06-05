
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY ShiftRegister8B_tb IS
END ShiftRegister8B_tb;
 
ARCHITECTURE behavior OF ShiftRegister8B_tb IS 

    COMPONENT ShiftRegister8B
    PORT(
         clock : IN  std_logic;
         reset : IN  std_logic;
         cmd : IN  std_logic_vector(2 downto 0);
         datain : IN  std_logic_vector(7 downto 0);
         dataout : OUT  std_logic_vector(7 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal clock : std_logic := '0';
   signal reset : std_logic := '0';
   signal cmd : std_logic_vector(2 downto 0) := (others => '0');
   signal datain : std_logic_vector(7 downto 0) := (others => '0');

 	--Outputs
   signal dataout : std_logic_vector(7 downto 0);

   -- Clock period definitions
   constant clock_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: ShiftRegister8B PORT MAP (
          clock => clock,
          reset => reset,
          cmd => cmd,
          datain => datain,
          dataout => dataout
        );

   -- Clock process definitions
   clock_process :process
   begin
		clock <= '0';
		wait for clock_period/2;
		clock <= '1';
		wait for clock_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		

        reset <= '1';
        --dataout<= "00000000";
      -- hold reset state for 100 ns.
      wait for 10 ns;

        reset <= '0';
		
		cmd <= "111"; --loads the datain to dataout
		datain <= "11010101";
		
		wait for 20 ns;
		
		cmd <= "001"; --set all the bits to 1
		
		wait for 20 ns;
		
		cmd <= "010"; --reset all bits to 0
		
		wait for 20 ns;
		
		
		cmd <= "111"; --loads the datain to dataout
		datain <= "11011011";

        wait for 20 ns;

        --!
        cmd <= "101";

        wait for 40 ns;

        cmd <= "011";

        wait for 40 ns;

        cmd <= "100";
		
      wait for clock_period*10;

      -- insert stimulus here 

      wait;
   end process;

END;
