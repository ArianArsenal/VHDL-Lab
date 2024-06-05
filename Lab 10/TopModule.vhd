library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity TopModule is
    Port ( 
        data_out : out  STD_LOGIC_VECTOR(7 downto 0);
        rst : in  STD_LOGIC;
        clk : in  STD_LOGIC;
        oe : out STD_LOGIC;
        internal : out STD_LOGIC_VECTOR(7 downto 0);
        internal_addr : out STD_LOGIC_VECTOR(3 downto 0);
        internal_rd : out std_logic;
        internal_state : out STD_LOGIC_VECTOR(3 downto 0));
end TopModule;

architecture Behavioral of TopModule is

component RAM is
    Port ( 
        WR : in  STD_LOGIC;
        RD : in  STD_LOGIC;
        Addr : in  STD_LOGIC_VECTOR(3 downto 0);
        Reset : in  STD_LOGIC;
        Data_in : in  STD_LOGIC_VECTOR(7 downto 0);
        Data_out : out  STD_LOGIC_VECTOR(7 downto 0));
end component;

component CPU8Bit is
    Port ( 
        data_in : in  STD_LOGIC_VECTOR(7 downto 0);
        data_out : out  STD_LOGIC_VECTOR(7 downto 0);
        address : out  STD_LOGIC_VECTOR(3 downto 0);
        we : out  STD_LOGIC;
        re : out  STD_LOGIC;
        oe : out  STD_LOGIC;
        clk : in  STD_LOGIC;
		rst : in STD_LOGIC;
		internal_state : out STD_LOGIC_VECTOR(3 downto 0));
end component;

signal we, re, oe_reg : std_logic; 
signal addr : std_logic_vector(3 downto 0); 
signal data_in, data_out1 : std_logic_vector(7 downto 0); 
signal state : STD_LOGIC_VECTOR(3 downto 0); 
 
begin 
 
    ram1 : RAM port map(WR=> we, RD=>re, Addr=>addr, Reset=>rst, Data_in=>data_in, Data_out=>data_out1); 
    cpu1 : CPU8Bit port map(data_in=>data_out1, data_out=>data_in, address=>addr, we=>we, re=>re, oe=>oe_reg, clk=>clk, rst=>rst, internal_state=>state); 
    oe <= oe_reg; 
    internal <= data_out1; 
    internal_addr <= addr; 
    internal_rd <= re; 
    internal_state <= state; 
    data_out <= data_in; 
 
end Behavioral;

