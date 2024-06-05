
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
ENTITY RAM_tb IS
END RAM_tb;
 
ARCHITECTURE behavior OF RAM_tb IS 

    COMPONENT RAM
    PORT(
         WR : IN  std_logic;
         RD : IN  std_logic;
         Addr : IN  std_logic_vector(3 downto 0);
         Reset : IN  std_logic;
         Data_in : IN  std_logic_vector(7 downto 0);
         Data_out : OUT  std_logic_vector(7 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal WR : std_logic := '0';
   signal RD : std_logic := '0';
   signal Addr : std_logic_vector(3 downto 0) := (others => '0');
   signal Reset : std_logic := '0';
   signal Data_in : std_logic_vector(7 downto 0) := (others => '0');

 	--Outputs
   signal Data_out : std_logic_vector(7 downto 0);
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: RAM PORT MAP (
          WR => WR,
          RD => RD,
          Addr => Addr,
          Reset => Reset,
          Data_in => Data_in,
          Data_out => Data_out
        );
 

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
		
		Data_in <= "00110010";
		Addr <= "0000";
		
		WR <= '1';
		wait for 20 ns;
		WR <= '0';
		
		wait for 20 ns;
		
		RD <= '1';
		wait for 20 ns;
		RD <= '0';
		
		wait for 20 ns;
		Data_in <= "11111110";
		Addr <= "1000";
		
		WR <= '1';
		wait for 20 ns;
		WR <= '0';
		
		wait for 20 ns;
		
		Addr <= "1001";
		RD <= '1';
		wait for 20 ns;
		RD <= '0';
		
		wait for 20 ns;
		
		Addr <= "1011";
		RD <= '1';
		wait for 20 ns;
		RD <= '0';
      wait;
   end process;

END;
