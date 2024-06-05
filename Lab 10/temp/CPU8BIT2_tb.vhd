LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;

ENTITY CPU8BIT2_TB IS
END CPU8BIT2_TB;

ARCHITECTURE behavior OF CPU8BIT2_TB IS

    -- Component Declaration for the Unit Under Test (UUT)
    COMPONENT CPU8BIT2
        PORT (
            data_in : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
            data_out : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
            adress : OUT STD_LOGIC_VECTOR(5 DOWNTO 0);
            oe : OUT STD_LOGIC;
            we : OUT STD_LOGIC;
            rst : IN STD_LOGIC;
            clk : IN STD_LOGIC
        );
    END COMPONENT;

    --Inputs
    SIGNAL data_in : STD_LOGIC_VECTOR(7 DOWNTO 0) := (OTHERS => '0');
    SIGNAL rst : STD_LOGIC := '0';
    SIGNAL clk : STD_LOGIC := '0';

    --Outputs
    SIGNAL data_out : STD_LOGIC_VECTOR(7 DOWNTO 0);
    SIGNAL adress : STD_LOGIC_VECTOR(5 DOWNTO 0);
    SIGNAL oe : STD_LOGIC;
    SIGNAL we : STD_LOGIC;

    -- Clock period definitions
    SIGNAL finished : STD_LOGIC := '0';
    CONSTANT clk_period : TIME := 10 ns;

BEGIN

    -- Instantiate the Unit Under Test (UUT)
    uut : CPU8BIT2 PORT MAP(
        data_in => data_in,
        data_out => data_out,
        adress => adress,
        oe => oe,
        we => we,
        rst => rst,
        clk => clk
    );

    -- Clock process definitions
    clk_process : PROCESS
    BEGIN
        clk <= '0';
        WAIT FOR clk_period/2;
        clk <= '1';
        WAIT FOR clk_period/2;
        IF (finished = '1') THEN
            WAIT;
        END IF;
    END PROCESS;

    -- Stimulus process
    stim_proc : PROCESS
    BEGIN
        -- hold reset state for 100 ns.
        WAIT FOR 40 ns;
        rst <= '1';
        
        WAIT FOR clk_period * 10;

        -- Apply stimulus here
        -- Example: Change data_in and check data_out, adress, etc.

        -- Finish the simulation
        finished <= '1';
        WAIT;
    END PROCESS;

END;