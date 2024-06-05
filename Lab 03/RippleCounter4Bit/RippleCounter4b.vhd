
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity RippleCounter4b is
    Port ( clk : in  STD_LOGIC;
			  rst : in STD_LOGIC;
           Output_r : out  STD_LOGIC_VECTOR(3 downto 0));
end RippleCounter4b;

architecture Behavioral of RippleCounter4b is

component TFF is
	Port ( T : in  STD_LOGIC;
           rst : in  STD_LOGIC;
           clk : in  STD_LOGIC;
           Q : out  STD_LOGIC);
end component;

component FreqDivider is
    Port ( clk_in : in  STD_LOGIC;
           clk_out : out  STD_LOGIC);
end component;

signal clks : std_logic_vector(2 downto 0);
signal clk_out : std_logic;

begin
	frqd: FreqDivider port map(clk_in => clk, clk_out => clk_out);

	tff0: TFF port map(T => '1', rst => rst, clk => clk_out, Q => clks(0));
	tff1: TFF port map(T => '1', rst => rst, clk => clks(0), Q => clks(1));
	tff2: TFF port map(T => '1', rst => rst, clk => clks(1), Q => clks(2));
	tff3: TFF port map(T => '1', rst => rst, clk => clks(2), Q => Output_r(3));

	Output_r(0) <= clks(0);
	Output_r(1) <= clks(1);
	Output_r(2) <= clks(2);
end Behavioral;

