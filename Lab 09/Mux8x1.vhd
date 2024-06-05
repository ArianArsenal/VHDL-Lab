
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Mux8x1 is
    Port ( In0 : in  STD_LOGIC_VECTOR(7 downto 0);
			  In1 : in  STD_LOGIC_VECTOR(7 downto 0);
			  In2 : in  STD_LOGIC_VECTOR(7 downto 0);
			  In3 : in  STD_LOGIC_VECTOR(7 downto 0);
			  In4 : in  STD_LOGIC_VECTOR(7 downto 0);
			  In5 : in  STD_LOGIC_VECTOR(7 downto 0);
			  In6 : in  STD_LOGIC_VECTOR(7 downto 0);
           S : in  STD_LOGIC_VECTOR(2 downto 0);
           Out_data : out  STD_LOGIC_VECTOR(7 downto 0));
end Mux8x1;

architecture Behavioral of Mux8x1 is

begin

	process(S, In0, In1, In2, In3, In4, In5, In6) begin
		if(S = "000") then
			Out_data <= In0;
		elsif(S = "001") then
			Out_data <= In1;
		elsif(S = "010") then
			Out_data <= In2;
		elsif(S = "011") then
			Out_data <= In3;
		elsif(S = "100") then
			Out_data <= In4;
		elsif(S = "101") then
			Out_data <= In5;
		elsif(S = "110") then
			Out_data <= In6;
		else
			Out_data <= "00000000";
		end if;
	end process;

end Behavioral;

