library ieee;
use ieee.std_logic_1164.all;


entity CarryLookahead4Bit_tb is
end CarryLookahead4Bit_tb;

architecture behavior of CarryLookahead4Bit_tb is

   component CarryLookahead4Bit
   port (
        a, b : in std_logic_vector(3 downto 0);
        cin : in std_logic;

        s : out std_logic_vector(3 downto 0);
        cout : out std_logic
    );
end component;

--Inputs
signal C_in : std_logic := '0';
signal A,B : std_logic_vector(3 downto 0) := "0000";

--Outputs
signal C_out : std_logic;
signal Sum : std_logic_vector(3 downto 0);

begin

   uut : CarryLookahead4Bit port map (
      A => A,
      B => B,
      Cin => C_in,
      S => Sum,
      Cout => C_out
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