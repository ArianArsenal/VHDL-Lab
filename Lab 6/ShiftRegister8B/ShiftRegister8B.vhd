library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL; -- Uncommented and added

entity ShiftRegister8B is
    port(
        clock : in std_logic;
        reset : in std_logic;
        cmd : in std_logic_vector(2 downto 0);
        datain : in std_logic_vector(7 downto 0);
        dataout : out std_logic_vector(7 downto 0));
end ShiftRegister8B;

architecture Behavioral of ShiftRegister8B is

signal temp : std_logic_vector(7 downto 0);
signal tempin : std_logic_vector(7 downto 0);
signal temp_unsigned : unsigned(7 downto 0); -- Added signal for unsigned conversion

begin 
    
    tempin <= datain;
    synchronous_process : process (clock, reset)

    begin

	if falling_edge (reset) then
		temp <= "00000000";
	else
        if rising_edge (clock) then
            case cmd is 
        when "001" => --Sets all bits to 1
            temp <= "11111111";
        when "010" => --Reset synchronus to 0
            temp <= "00000000";
        when "111" => --Load datain to dataout
            temp <= tempin;
        when "011" => --Shift Right 
            temp(6 downto 0) <= temp(7 downto 1) ;
            temp(7) <= '0';
        when "100" => --Shift Left
            temp(7 downto 1) <= temp(6 downto 0) ;
            temp(0) <= '0';
        when "101" => --Count Up
        
            temp_unsigned <= unsigned(temp); -- Convert to unsigned
            temp_unsigned <= temp_unsigned + 1; -- Perform arithmetic operation
            temp <= std_logic_vector(temp_unsigned); -- Convert back to std_logic_vector
        
            when others => --Count Down
            
            temp_unsigned <= unsigned(temp); -- Convert to unsigned
            temp_unsigned <= temp_unsigned - 1; -- Perform arithmetic operation
            temp <= std_logic_vector(temp_unsigned); -- Convert back to std_logic_vector
        
        end case;
	end if;
    end if;
end process;

dataout <= temp;
end Behavioral;
