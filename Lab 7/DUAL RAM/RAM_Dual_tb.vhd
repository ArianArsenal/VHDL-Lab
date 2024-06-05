
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY RAM_DUAL_tb IS
END RAM_DUAL_tb;
 
ARCHITECTURE behavior OF RAM_DUAL_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
    COMPONENT RAM_DUAL
    PORT(
         WR1 : IN  std_logic;
         WR2 : IN  std_logic;
         RD1 : IN  std_logic;
         RD2 : IN  std_logic;
         Addr1 : IN  std_logic_vector(3 downto 0);
         Addr2 : IN  std_logic_vector(3 downto 0);
         Reset : IN  std_logic;
         Data_in1 : IN  std_logic_vector(7 downto 0);
         Data_in2 : IN  std_logic_vector(7 downto 0);
         Data_out1 : OUT  std_logic_vector(7 downto 0);
         Data_out2 : OUT  std_logic_vector(7 downto 0);
         CLK : IN  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal WR1 : std_logic := '0';
   signal WR2 : std_logic := '0';
   signal RD1 : std_logic := '0';
   signal RD2 : std_logic := '0';
   signal Addr1 : std_logic_vector(3 downto 0) := (others => '0');
   signal Addr2 : std_logic_vector(3 downto 0) := (others => '0');
   signal Reset : std_logic := '0';
   signal Data_in1 : std_logic_vector(7 downto 0) := (others => '0');
   signal Data_in2 : std_logic_vector(7 downto 0) := (others => '0');
   signal CLK : std_logic := '0';

 	--Outputs
   signal Data_out1 : std_logic_vector(7 downto 0);
   signal Data_out2 : std_logic_vector(7 downto 0);

   -- Clock period definitions
   constant CLK_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: RAM_DUAL PORT MAP (
          WR1 => WR1,
          WR2 => WR2,
          RD1 => RD1,
          RD2 => RD2,
          Addr1 => Addr1,
          Addr2 => Addr2,
          Reset => Reset,
          Data_in1 => Data_in1,
          Data_in2 => Data_in2,
          Data_out1 => Data_out1,
          Data_out2 => Data_out2,
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
		
		Data_in1 <= "00110010";
		Addr1 <= "0000";
		
		WR1 <= '1';
		wait for 20 ns;
		WR1 <= '0';
		
		wait for 20 ns;
		
		RD2 <= '1';
		wait for 20 ns;
		RD2 <= '0';
		
		wait for 20 ns;
		Data_in2 <= "11111110";
		Addr2 <= "1001";
		Data_in1 <= "11111111";
		Addr1 <= "0000";
		
		WR2 <= '1';
		WR1 <= '1';
		wait for 20 ns;
		WR2 <= '0';
		WR1 <= '0';
		
		wait for 20 ns;
		
		Addr1 <= "1101";
		RD1 <= '1';
		wait for 20 ns;
		RD1 <= '0';
		
		wait for 20 ns;
		
		Addr2 <= "1001";
		RD2 <= '1';
		wait for 20 ns;
		RD2 <= '0';

      wait for CLK_period*10;

      wait;
   end process;

END;
