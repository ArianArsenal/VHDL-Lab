
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY ALU_tb IS
END ALU_tb;
 
ARCHITECTURE behavior OF ALU_tb IS 
 
    COMPONENT ALU
    PORT(
         a : IN  std_logic_vector(7 downto 0);
         b : IN  std_logic_vector(7 downto 0);
         sel : IN  std_logic_vector(2 downto 0);
         outmux : OUT  std_logic_vector(7 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal a : std_logic_vector(7 downto 0) := (others => '0');
   signal b : std_logic_vector(7 downto 0) := (others => '0');
   signal sel : std_logic_vector(2 downto 0) := (others => '0');

 	--Outputs
   signal outmux : std_logic_vector(7 downto 0);
 
BEGIN
 
   uut: ALU PORT MAP (
          a => a,
          b => b,
          sel => sel,
          outmux => outmux
        );

   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	
		
		a <= "00000001";
		b <= "00000001";
		sel <= "000";
		wait for 20 ns;
		
		a <= "00001001";
		b <= "00000001";
		sel <= "001";
		wait for 20 ns;
		
		a <= "01000001";
		b <= "00010001";
		sel <= "010";
		wait for 20 ns;
		
		a <= "00000011";
		b <= "00000011";
		sel <= "011";
		wait for 20 ns;
		
		a <= "00100001";
		b <= "00000011";
		sel <= "100";
		wait for 20 ns;
		
		a <= "00000011";
		b <= "00000011";
		sel <= "101";
		wait for 20 ns;
		
		a <= "00000111";
		b <= "00000010";
		sel <= "110";
		wait for 20 ns;
      -- insert stimulus here 

      wait;
   end process;

END;
