
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity SeqDetector1101 is
    Port ( data : in  STD_LOGIC;
           clk : in  STD_LOGIC;
           VALID : out  STD_LOGIC;
			clk_out : out STD_LOGIC
			);
end SeqDetector1101;

architecture Behavioral of SeqDetector1101 is

component FreqDivider is
    Port ( clk_in : in  STD_LOGIC;
           clk_out : out  STD_LOGIC);
end component;

type state_t is(initial, got1, got11, got110);
signal state : state_t := initial;
signal output_tmp : std_logic;
signal clk_out_tmp : std_logic;
begin

	frqd : FreqDivider port map(clk_in => clk, clk_out => clk_out_tmp);

	process(clk_out_tmp)begin
		if(clk_out_tmp = '0' and clk_out_tmp'Event) then
		case state is
			when initial =>
				if(data = '0') then
					state <= initial;
					output_tmp <= '0';
				elsif(data = '1') then
					state <= got1;
					output_tmp <= '0';
				end if;
			when got1 =>
				if(data = '0') then
					state <= initial;
					output_tmp <= '0';
				elsif(data = '1') then
					state <= got11;
					output_tmp <= '0';
				end if;
			when got11 =>
				if(data = '0') then
					state <= got110;
					output_tmp <= '0';
				elsif(data = '1') then
					state <= got11;
					output_tmp <= '0';
				end if;
			when got110 =>
				if(data = '0') then
					state <= initial;
					output_tmp <= '0';
				elsif(data = '1') then
					state <= got1;
					output_tmp <= '1';
				end if;
		end case;
		end if;
	end process;
	
	VALID <= output_tmp;
	clk_out <= clk_out_tmp;

end Behavioral;

