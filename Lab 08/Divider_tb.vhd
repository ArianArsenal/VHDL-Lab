LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY Divider_tb IS
END Divider_tb;

ARCHITECTURE behavior OF Divider_tb IS

    COMPONENT Divider
    port (
        a : in std_logic_vector(7 downto 0);
        b : in std_logic_vector(3 downto 0);
        Wrong : out std_logic;
        remainder : out std_logic_vector(3 downto 0);
        quotient : out std_logic_vector(3 downto 0);
        reset : in std_logic
    );
    END COMPONENT;

--Inputs
    SIGNAL a : STD_LOGIC_VECTOR (7 DOWNTO 0) := (OTHERS => '0');
    SIGNAL b : STD_LOGIC_VECTOR (3 DOWNTO 0) := (OTHERS => '0');
    signal reset :std_logic := '0';
--Outputs
    SIGNAL Wrong : STD_LOGIC := '0';
    SIGNAL remainder : STD_LOGIC_VECTOR (3 DOWNTO 0) := (OTHERS => '0');
    SIGNAL quotient : STD_LOGIC_VECTOR (3 DOWNTO 0) := (OTHERS => '0');


BEGIN
    uut : Divider PORT MAP(
            a => a,
            b => b,
            Wrong => Wrong,
            remainder => remainder,
            quotient => quotient,
            reset => reset
        );


        stim_proc :PROCESS
        BEGIN
            reset <= '1';

            wait for 10 ns;

            reset <= '0';

            a <= "00000001"; -- 1
            b <= "0001";     -- 1
            -- Expected quotient: 1, remainder: 0
            wait for 20 ns;

            a <= "10000000"; -- 128
            b <= "0010";     -- 2
            -- Expected quotient: 64, remainder: 0 --error
            wait for 20 ns;

            a <= "00010000"; --16
            b <= "0010";      --2
            -- Expected quotient: 8, remainder: 0 

            wait for 20 ns;

            a <= "00000000"; --0
            b <= "0010";      --2
            -- Expected quotient: 0, remainder: 0

            wait for 20 ns;

            a <= "00001001"; -- 9
            b <= "0100";     -- 4
            -- Expected quotient: 2, remainder: 1
            wait for 20 ns;

            a <= "00100000"; --32
            b <= "0101";     -- 5
            -- Expected quotient: 6, remainder: 2
            wait for 20 ns;

            a <= "11110000"; -- 240
            b <= "0110";     -- 6
            -- Expected quotient: 40, remainder: 0 -error
            wait for 20 ns;

            a <= "01010101"; -- 85
            b <= "1000";     -- 8
            -- Expected quotient: 10, remainder: 5
            wait for 20 ns;

            a <= "00001111"; -- 15
            b <= "1001";     -- 9
            -- Expected quotient: 1, remainder: 6
            wait for 20 ns;

            a <= "01000110"; --70
            b <= "1010";     -- 10
            -- Expected quotient: 7, remainder: 0
            wait for 20 ns;

            WAIT;
        END PROCESS;
    END;