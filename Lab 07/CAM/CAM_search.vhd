
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity CAM_search is
    Port ( Data_in : in  STD_LOGIC_VECTOR(7 downto 0);
           Reset : in  STD_LOGIC;
           Match : out  STD_LOGIC;
           R : in  STD_LOGIC;
			W : in STD_LOGIC;
			CLK : in STD_LOGIC);
end CAM_search;

architecture Behavioral of CAM_search is

type RAM_TYPE is array(0 to 15) of std_logic_vector(7 downto 0);
signal Data : RAM_TYPE;

signal Valid : STD_LOGIC_VECTOR(15 downto 0);
signal match_tmp : STD_LOGIC := '0';

begin
	process(CLK) begin
		if(CLK = '1' and CLK'event) then
		if(Reset = '1') then
			Valid <= "0000000000000000";
		elsif(R = '1') then
			for index in 0 to 15 loop
				if(Valid(index) = '1' and Data_in = Data(index)) then
					match_tmp <= '1';
				end if;
			end loop;
			
		elsif(W = '1') then
			match_tmp <= '0';
			for index in 0 to 15 loop
				if(Valid(index) = '0') then
					Data(index) <= Data_in;
					Valid(index) <= '1';
				end if;
			end loop;
		end if;
		end if;
	end process;

	Match <= Match_tmp;
end Behavioral;

