library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity halfadder is
	Port(
		A, B: in std_logic;
		S, C: out std_logic
	);
end halfadder;

architecture Behavioral of halfadder is


begin

	S <= A xor B;
	C <= A and B;

end Behavioral;

