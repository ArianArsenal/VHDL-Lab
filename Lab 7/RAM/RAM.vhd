
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std.all;

entity RAM is
    Port ( WR : in  STD_LOGIC;
           RD : in  STD_LOGIC;
           Addr : in  STD_LOGIC_VECTOR(3 downto 0);
           Reset : in  STD_LOGIC;
           Data_in : in  STD_LOGIC_VECTOR(7 downto 0);
           Data_out : out  STD_LOGIC_VECTOR(7 downto 0);
			  CLK : in STD_LOGIC);
end RAM;

architecture Behavioral of RAM is

type RAM_TYPE is array(0 to 15) of std_logic_vector(7 downto 0);
signal Data : RAM_TYPE;

begin

	process(CLK) begin
		if(CLK = '1' and CLK'event) then
		if(Reset = '0') then
			for item in 0 to 15 loop
				Data(item) <= STD_LOGIC_VECTOR(to_unsigned(item,8));
			end loop;
		elsif(WR = '1') then
			Data(to_integer(unsigned(Addr))) <= Data_in;
		elsif(RD = '1') then
			Data_out <= Data(to_integer(unsigned(Addr)));
		end if;
		end if;
	end process;


end Behavioral;

