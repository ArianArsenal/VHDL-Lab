
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity SeqDetector1101 is
    Port ( data : in  STD_LOGIC;
           clk : in  STD_LOGIC;
           VALID : out  STD_LOGIC
			);
end SeqDetector1101;

architecture Behavioral of SeqDetector1101 is

type state_t is(initial, got1, got11, got110);
signal state : state_t := initial;
signal output_tmp : std_logic;
begin

	process(clk)begin
		if(clk = '0' and clk'Event) then
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

end Behavioral;

