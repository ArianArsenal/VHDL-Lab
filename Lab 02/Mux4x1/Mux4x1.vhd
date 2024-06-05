library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Mux4x1 is
    Port ( I0 : in  STD_LOGIC;
           I1 : in  STD_LOGIC;
           I2 : in  STD_LOGIC;
           I3 : in  STD_LOGIC;
           Out1 : out  STD_LOGIC;
           S0 : in  STD_LOGIC;
           S1 : in  STD_LOGIC
			  );
end Mux4x1;


architecture Behavioral of Mux4x1 is

signal w0, w1, w2, w3: STD_LOGIC;

begin

	w0 <= I0 and (not S1) and (not S0);
	w1 <= I1 and (not S1) and S0;
	w2 <= I2 and S1 and (not S0);
	w3 <= I3 and S1 and S0;
	
	Out1 <= w0 or w1 or w2 or w3;

end Behavioral;