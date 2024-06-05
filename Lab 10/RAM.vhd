library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std.all;

entity RAM is
    Port ( WR : in  STD_LOGIC;
           RD : in  STD_LOGIC;
           Addr : in  STD_LOGIC_VECTOR(3 downto 0);
           Reset : in  STD_LOGIC;
           Data_in : in  STD_LOGIC_VECTOR(7 downto 0);
           Data_out : out  STD_LOGIC_VECTOR(7 downto 0));
end RAM;

architecture Behavioral of RAM is

type RAM_TYPE is array(0 to 15) of std_logic_vector(7 downto 0);
signal Data : RAM_TYPE;

begin

	process(WR, RD, Addr, Reset, Data_in) begin
		if(Reset = '0') then
			Data(0) <= "00101111"; --load [15]
			Data(1) <= "01001110"; --add [14]
			Data(2) <= "00111100"; --store [12]
			Data(3) <= "00101101"; --load [13]
			Data(4) <= "01001100"; --add[12]
			Data(5) <= "00111100"; --store[12]
			Data(6) <= "11110000";  --halt
			Data(7) <= "00000000";
			Data(8) <= "00000000";
			Data(9) <= "00000000";
			Data(10) <= "00000000";
			Data(11) <= "00000000";
			Data(12) <= "00000000";
			Data(13) <= "00000011"; --value 3
			Data(14) <= "00000100"; --value 4
			Data(15) <= "00000101"; --value 5

			

		elsif(WR = '1') then
			Data(to_integer(unsigned(Addr))) <= Data_in;
		elsif(RD = '1') then
			Data_out <= Data(to_integer(unsigned(Addr)));
		end if;
	end process;

end Behavioral;

