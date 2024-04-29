library ieee;
use ieee.std_logic_1164.all;


entity CarrySelectAdder4Bit_tb is
end CarrySelectAdder4Bit_tb;

architecture behavior of CarrySelectAdder4Bit_tb is

   component CarrySelectAdder4Bit
   port (
        A : in std_logic_vector(3 downto 0);
        B : in std_logic_vector(3 downto 0);
        Cin : in std_logic;
        Sum : out std_logic_vector(3 downto 0);
        Cout : out std_logic
    );
end component;

--Inputs
signal Cin : std_logic := '0';
signal A,B : std_logic_vector(3 downto 0) := "0000";

--Outputs
signal Cout : std_logic;
signal Sum : std_logic_vector(3 downto 0);

begin

   uut : CarrySelectAdder4Bit port map (
      A => A,
      B => B,
      Cin => Cin,
      Sum => Sum,
      Cout => Cout
   );

   tb : process
   begin

      Cin <= '0';
      
      A <= "1000";
      B <= "0001";
      wait for 20 ns;

      A <= "0000";
      B <= "0010";
      wait for 20 ns;

      A <= "1111";
      B <= "0001";
      wait for 20 ns;

      wait;


   end process;

end architecture;