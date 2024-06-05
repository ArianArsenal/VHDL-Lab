
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std.all;

entity CPU8Bit is
    Port ( data_in : in  STD_LOGIC_VECTOR(7 downto 0); --4 bit opcode 4 bit data address
           data_out : out  STD_LOGIC_VECTOR(7 downto 0); --shown when halt or show state happens
           address : out  STD_LOGIC_VECTOR(3 downto 0);
           we : out  STD_LOGIC;
			re : out STD_LOGIC;
           oe : out  STD_LOGIC;
           clk : in  STD_LOGIC;
			rst : in STD_LOGIC;
			internal_state : out STD_LOGIC_VECTOR(3 downto 0));
end CPU8Bit;

architecture Behavioral of CPU8Bit is

signal ac : STD_LOGIC_VECTOR(8 downto 0);
signal adreg : STD_LOGIC_VECTOR(3 downto 0);
signal states : STD_LOGIC_VECTOR(3 downto 0);
signal pc : STD_LOGIC_VECTOR(3 downto 0);
signal halt : STD_LOGIC;

begin

	process(clk,rst) begin
		if(rst = '0') then
			adreg <= (others => '0');
			pc <= (others => '0');
			ac <= (others => '0');
			states <= (others => '0');
			halt <= '0';
		elsif (rising_edge(clk)) then
		
			if(states = "0000") then --fetch next instruction

				pc <= std_logic_vector(unsigned(adreg) + 1);
				adreg <= data_in(3 downto 0);
				data_out <= (others => 'Z');

			elsif(states = "0001") then --show data
				data_out <= ac(7 downto 0);
				adreg <= pc;
			else
				adreg <= pc;

			end if;
			
			case states is
				when "0010" => ac <= '0' & data_in; -- load
				when "0011" => data_out <= ac(7 downto 0); -- store
				when "0100" => ac <= std_logic_vector(unsigned(ac) + unsigned('0' & data_in)); -- add
				when "0101" => ac <= std_logic_vector(unsigned(ac) - unsigned('0' & data_in)); -- sub
				when "0110" => ac <= ac(0) & ac(8 downto 1); -- ror rotate right
				when "0111" => ac <= ac(7 downto 0) & ac(8); -- rol rotate left
				when "1000" => ac <= '0' & ac(8 downto 1); -- shr   shift right
				when "1001" => ac <= ac(7 downto 0) & '0'; -- shl	shift left
				when "1010" => ac <= ac and '0' & data_in; -- and
				when "1011" => ac <= ac or '0' & data_in; -- or
				when "1100" => ac <= ac xor '0' & data_in; -- xor
				when "1101" => ac <= not(ac); -- not
				when "1111" => halt <= '1';  --halt
				when others => null;
			end case;

			if(states /= "0000" and states /= "1111") then states <= "0000";
			else
				states <= data_in(7 downto 4);
			end if;
			end if;
		
	end process;
	
	address <= adreg;						
	data_out <= ac(7 downto 0) when (states = "0001" or states = "1111")--show      --halt
		else (others => 'Z');
	
	oe <= '1' when ((states = "0001" or states = "1111") and rst = '1') else '0';--show 		    --halt
											
	we <= '1' when (states = "0011" and rst = '1') else '0';--store
									
	re <= '1' when (states /= "0011" and states /= "1101" and states /= "1111") else '0';--store 			--not			--halt
	internal_state <= states;

end Behavioral;

