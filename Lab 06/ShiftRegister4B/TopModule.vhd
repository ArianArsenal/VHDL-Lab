
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity TopModule is
    Port ( Reset : in  STD_LOGIC;
           Load : in  STD_LOGIC;
           L : in  STD_LOGIC;
           R : in  STD_LOGIC;
           D : in  STD_LOGIC_VECTOR(3 downto 0);
           SEG_SEL : out  STD_LOGIC_VECTOR(4 downto 0) := "00001";
           SEG_DATA : out  STD_LOGIC_VECTOR(7 downto 0) := "00000000";
           clk : in  STD_LOGIC);
end TopModule;

architecture Behavioral of TopModule is

component ShiftRegister4B is
    Port ( Reset : in  STD_LOGIC;
           Load : in  STD_LOGIC;
           L : in  STD_LOGIC;
           R : in  STD_LOGIC;
           D : in  STD_LOGIC_VECTOR(3 downto 0);
           Q : out  STD_LOGIC_VECTOR(3 downto 0);
			  clk : in STD_LOGIC);
end component;

component FreqDivider is
    Port ( clk_in : in  STD_LOGIC;
           clk_out : out  STD_LOGIC);
end component;

signal Q : STD_LOGIC_VECTOR(3 downto 0);
signal slow_clk : STD_LOGIC;

signal segCounter : INTEGER := 0;
signal currentBit : STD_LOGIC;

begin

	ShiftRegister1 : ShiftRegister4B Port Map(Reset => Reset, Load => Load, L => L, R => R, D => D, 
															Q => Q, clk => slow_clk);
	
	freqDivider1 : FreqDivider Port Map(clk_in => clk, clk_out => slow_clk);
	
	process(clk) begin
		if(clk = '1' and clk'event) then
			case segCounter is
			when 0 => 
				SEG_SEL <= "01000";
				currentBit <= Q(0);
				segCounter <= 1;
			when 1 => 
				SEG_SEL <= "00100";
				currentBit <= Q(1);
				segCounter <= 2;
			when 2 => 
				SEG_SEL <= "00010";
				currentBit <= Q(2);
				segCounter <= 3;
			when 3 => 
				SEG_SEL <= "00001";
				currentBit <= Q(3);
				segCounter <= 0;
			when others => 
				segCounter <= 0;
			end case;
		end if;
	end process;
	
	process(currentBit) begin
		if(currentBit = '0') then
			SEG_DATA <= "00111111";
		else
			SEG_DATA <= "00110000";
		end if;
	end process;


end Behavioral;

