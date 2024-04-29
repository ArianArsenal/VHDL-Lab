library ieee;
use ieee.std_logic_1164.all;

entity RippleAdder4Bit_tb is
end RippleAdder4Bit_tb;

architecture behavior of RippleAdder4Bit_tb is

   component RippleAdder4Bit
   port (
        A : in std_logic_vector(3 downto 0);
        B : in std_logic_vector(3 downto 0);
        C_in : in std_logic;
        Sum : out std_logic_vector(3 downto 0);
        C_out : out std_logic
    );
end component;

--Inputs
signal C_in : std_logic := '0';
signal A,B : std_logic_vector(3 downto 0) := "0000";

--Outputs
signal C_out : std_logic;
signal Sum : std_logic_vector(3 downto 0);
begin

   uut : RippleAdder4Bit port map (
      A => A,
      B => B,
      C_in => C_in,
      Sum => Sum,
      C_out => C_out
   );

   tb : process
   begin

      C_in <= '0';
      
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