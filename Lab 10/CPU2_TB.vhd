LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;

ENTITY CPU2_TB IS
END CPU2_TB;

ARCHITECTURE behavior OF CPU2_TB IS 

COMPONENT topmodule
PORT(data_out : out  STD_LOGIC_vector(7 downto 0);
        rst : in  STD_LOGIC;
        clk : in  STD_LOGIC;
        oe : out STD_LOGIC;
        internal : out STD_LOGIC_VECTOR(7 downto 0);
        internal_addr : out STD_LOGIC_VECTOR(3 downto 0);
        internal_rd : out std_logic;
        internal_state : out STD_LOGIC_VECTOR(3 downto 0));
END COMPONENT;

signal data_out : STD_LOGIC_vector(7 downto 0);
signal rst : STD_LOGIC := '0';
signal clk : STD_LOGIC := '0';
signal oe : STD_LOGIC;
signal internal : STD_LOGIC_VECTOR(7 downto 0);
signal internal_addr : STD_LOGIC_VECTOR(3 downto 0);
signal internal_rd : std_logic;
signal internal_state : STD_LOGIC_VECTOR(3 downto 0);

constant clk_period : time := 10 ns;
BEGIN 
uut: topmodule PORT MAP(
        data_out, rst, clk, oe, internal, internal_addr, internal_rd, internal_state
);
        clk_process : process begin
                clk <= '0';
                wait for clk_period/2;
                clk <= '1';
                wait for clk_period/2;
        end process;
tb : PROCESS
BEGIN
wait for 100 ns;
rst <= '0';
wait for 20 ns;
rst <= '1';

wait;
END PROCESS tb;
END;
