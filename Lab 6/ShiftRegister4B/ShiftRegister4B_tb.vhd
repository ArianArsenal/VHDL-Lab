
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY ShiftRegister4B_tb IS
END ShiftRegister4B_tb;
 
ARCHITECTURE behavior OF ShiftRegister4B_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT ShiftRegister4B
    PORT(
         Reset : IN  std_logic;
         Load : IN  std_logic;
         L : IN  std_logic;
         R : IN  std_logic;
         D : IN  std_logic_vector(3 downto 0);
         Q : OUT  std_logic_vector(3 downto 0);
         clk :IN  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal Reset : std_logic := '1';
   signal Load : std_logic := '0';
   signal L : std_logic := '0';
   signal R : std_logic := '0';
   signal D : std_logic_vector(3 downto 0) := (others => '0');

 	--Outputs
   signal Q : std_logic_vector(3 downto 0);
   signal clk : std_logic;

   -- Clock period definitions
   constant clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: ShiftRegister4B PORT MAP (
          Reset => Reset,
          Load => Load,
          L => L,
          R => R,
          D => D,
          Q => Q,
          clk => clk
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
		Reset <= '0';
		D <= "0110";
		Load <= '1';
		wait for 40 ns;
		
		Load <= '0';
		L <= '1';

      wait for clk_period*10;

      -- insert stimulus here 

      wait;
   end process;

END;
