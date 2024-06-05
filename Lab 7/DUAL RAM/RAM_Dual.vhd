library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std.all;

entity RAM_DUAL is
    Port ( WR1 : in  STD_LOGIC;
	 WR2 : in  STD_LOGIC;
           RD1 : in  STD_LOGIC;
			  RD2 : in  STD_LOGIC;
           Addr1 : in  STD_LOGIC_VECTOR(3 downto 0);
			  Addr2 : in  STD_LOGIC_VECTOR(3 downto 0);
           Reset : in  STD_LOGIC;
           Data_in1 : in  STD_LOGIC_VECTOR(7 downto 0);
			  Data_in2: in  STD_LOGIC_VECTOR(7 downto 0);
           Data_out1 : out  STD_LOGIC_VECTOR(7 downto 0);
			  Data_out2 : out  STD_LOGIC_VECTOR(7 downto 0);
			  CLK : in STD_LOGIC);
end RAM_DUAL;

architecture Behavioral of RAM_DUAL is

type RAM_TYPE is array(0 to 15) of std_logic_vector(7 downto 0);
signal Data : RAM_TYPE;

begin

	process(CLK) begin
		if(CLK = '1' and CLK'event) then
		if(Reset = '0') then
			for item in 0 to 15 loop
				Data(item) <= STD_LOGIC_VECTOR(to_unsigned(item,8));
			end loop;
			
		else
		if(WR1 = '1') then
			Data(to_integer(unsigned(Addr1))) <= Data_in1;
			end if;
		if(WR2 = '1') then
			Data(to_integer(unsigned(Addr2))) <= Data_in2;
			end if;
		if(RD1 = '1') then
			Data_out1 <= Data(to_integer(unsigned(Addr1)));
			end if;
		if(RD2 = '1') then
			Data_out2 <= Data(to_integer(unsigned(Addr2)));
		end if;
		end if;
		end if;
	end process;

end Behavioral;

