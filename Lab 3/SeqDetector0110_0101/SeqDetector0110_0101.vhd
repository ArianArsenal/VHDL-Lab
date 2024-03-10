library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity SeqDetector0110_0101 is
    port (
        data : in std_logic;
        clk : in std_logic;
        VALID : out std_logic
    );
end SeqDetector0110_0101;

architecture Behavioral of SeqDetector0110_0101 is

type state_t is(initial, got0, got01, got010, got011, got0101, got0110);
signal state : state_t := initial;
signal output_tmp : std_logic;

begin

    process(clk)begin
		if(clk = '0' and clk'Event) then
		case state is
			when initial =>
				if(data = '0') then
					state <= got0;
					output_tmp <= '0';
				elsif(data = '1') then
					state <= initial;
					output_tmp <= '0';
				end if;
			when got0 =>
				if(data = '0') then
					state <= got0;
					output_tmp <= '0';
				elsif(data = '1') then
					state <= got01;
					output_tmp <= '0';
				end if;
			when got01 =>
				if(data = '0') then
					state <= got010;
					output_tmp <= '0';
				elsif(data = '1') then
					state <= got011;
					output_tmp <= '0';
				end if;
			when got011 =>
				if(data = '0') then
					state <= got0110;
					output_tmp <= '1';
				elsif(data = '1') then
					state <= initial;
					output_tmp <= '0';
				end if;
            when got0110 =>
                if(data = '0') then
                    state <= got0;
                    output_tmp <= '0';
                elsif(data = '1') then
                    state <= got01;
                    output_tmp <= '0';
                end if;
            when got010 =>
                if(data = '0') then
                    state <= got0;
                    output_tmp <= '0';
                elsif(data = '1') then
                    state <= got0101;
                    output_tmp <= '1';
                end if;
            when got0101 =>
                if(data = '0') then
                    state <= got010;
                    output_tmp <= '0';
                elsif(data = '1') then
                    state <= got011;
                    output_tmp <= '0';
                end if;
		end case;
		end if;
	end process;
	
	VALID <= output_tmp;

end Behavioral;