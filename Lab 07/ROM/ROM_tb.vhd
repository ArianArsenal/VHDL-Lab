LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY ROM_tb IS
END ROM_tb;
 
ARCHITECTURE behavior OF ROM_tb IS 

    COMPONENT ROM
    PORT(
         RD : IN  std_logic;
         Addr : IN  std_logic_vector(3 downto 0);
         Reset : IN  std_logic;
         Data_out : OUT  std_logic_vector(7 downto 0);
         CLK : IN  std_logic
        );
    END COMPONENT;
  
   --Inputs
   signal RD : std_logic := '0';
   signal Addr : std_logic_vector(3 downto 0) := (others => '0');
   signal Reset : std_logic := '0';
   signal CLK : std_logic := '0';

 	--Outputs
   signal Data_out : std_logic_vector(7 downto 0);

   constant CLK_period : time := 10 ns;
 
BEGIN
   uut: ROM PORT MAP (
          RD => RD,
          Addr => Addr,
          Reset => Reset,
          Data_out => Data_out,
          CLK => CLK
        );
   CLK_process :process
   begin
		CLK <= '0';
		wait for CLK_period/2;
		CLK <= '1';
		wait for CLK_period/2;
   end process;

   stim_proc: process
   begin
      wait for 100 ns;	
		
		Reset <= '1';
		wait for 20 ns;
		Reset <= '0';
		wait for 20 ns;
		Reset <= '1';
		wait for 20 ns;
		
		RD <= '1';
		Addr <= "1100";
		
		wait for 20 ns;
		Addr <= "0010";

      wait for CLK_period*10;

      wait;
   end process;
END;
