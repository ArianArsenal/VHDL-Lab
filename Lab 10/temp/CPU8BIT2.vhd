
-- LIBRARY ieee;
-- USE ieee.std_logic_1164.ALL;
-- USE ieee.numeric_std.ALL;

-- ENTITY CPU8BIT2 IS
--     PORT (
--         data : INOUT STD_LOGIC_VECTOR(7 DOWNTO 0);
--         adress : OUT STD_LOGIC_VECTOR(5 DOWNTO 0);
--         oe : OUT STD_LOGIC;
--         we : OUT STD_LOGIC; -- Asynchronous memory interface
--         rst : IN STD_LOGIC;
--         clk : IN STD_LOGIC
--     );
-- END;

-- ARCHITECTURE CPU_ARCH OF CPU8BIT2 IS
--     SIGNAL akku : STD_LOGIC_VECTOR(8 DOWNTO 0); -- akku(8) is carry !
--     SIGNAL adreg : STD_LOGIC_VECTOR(5 DOWNTO 0);
--     SIGNAL pc : STD_LOGIC_VECTOR(5 DOWNTO 0);
--     SIGNAL states : STD_LOGIC_VECTOR(2 DOWNTO 0);
-- BEGIN
--     PROCESS (clk, rst)
--     BEGIN
--         IF (rst = '0') THEN
--             adreg <= (OTHERS => '0'); -- start execution at memory location 0
--             states <= "000";
--             akku <= (OTHERS => '0');
--             pc <= (OTHERS => '0');
--         ELSIF rising_edge(clk) THEN
--             -- PC / Address path
--             IF (states = "000") THEN
--                 pc <= adreg + 1;
--                 adreg <= data(5 DOWNTO 0);
--             ELSE
--                 adreg <= pc;
--             END IF;
--             -- ALU / Data Path
--             CASE states IS
--                 WHEN "010" => akku <= ("0" & akku(7 DOWNTO 0)) + ("0" & data); -- add
--                 WHEN "011" => akku(7 DOWNTO 0) <= akku(7 DOWNTO 0) NOR data; -- nor
--                 WHEN "101" => akku(8) <= '0'; -- branch not taken, clear carry
--                 WHEN OTHERS => NULL; -- instr. fetch, jcc taken (000), sta (001)
--             END CASE;
--             -- State machine
--             IF (states /= "000") THEN
--                 states <= "000"; -- fetch next opcode
--             ELSIF (data(7 DOWNTO 6) = "11" AND akku(8) = '1') THEN
--                 states <= "101"; -- branch not taken
--             ELSE
--                 states <= "0" & NOT data(7 DOWNTO 6); -- execute instruction
--             END IF;
--         END IF;
--     END PROCESS;
--     -- output
--     adress <= adreg;
--     data <= "ZZZZZZZZ" WHEN states /= "001" ELSE
--         akku(7 DOWNTO 0);
--     oe <= '1' WHEN (clk = '1' OR states = "001" OR rst = '0' OR states = "101") ELSE
--         '0';
--     -- no memory access during reset and state "101" (branch not taken)
--     we <= '1' WHEN (clk = '1' OR states /= "001" OR rst = '0') ELSE
--         '0';
-- END CPU_ARCH;



-- Minimal 8 Bit CPU
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;
ENTITY CPU8BIT2 IS
    PORT (
        data_in : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
        data_out : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
        adress : OUT STD_LOGIC_VECTOR(5 DOWNTO 0);
        oe : OUT STD_LOGIC;
        we : OUT STD_LOGIC; -- Asynchronous memory interface
        rst : IN STD_LOGIC;
        clk : IN STD_LOGIC);
END;
ARCHITECTURE CPU_ARCH OF CPU8BIT2 IS
    SIGNAL akku : STD_LOGIC_VECTOR(8 DOWNTO 0); -- akku(8) is carry !
    SIGNAL adreg : unsigned(5 DOWNTO 0);
    SIGNAL pc : unsigned(5 DOWNTO 0);
    SIGNAL states : STD_LOGIC_VECTOR(2 DOWNTO 0);
BEGIN
    PROCESS (clk, rst)
    BEGIN
        IF (rst = '0') THEN
            adreg <= (OTHERS => '0'); -- start execution at memory location 0
            states <= "000";
            akku <= (OTHERS => '0');
            pc <= (OTHERS => '0');
        ELSIF rising_edge(clk) THEN
            -- PC / Adress path
            IF (states = "000") THEN
                pc <= adreg + 1;
                adreg <= unsigned(data_in(5 DOWNTO 0));
            ELSE
                adreg <= pc;
            END IF;
            -- ALU / Data Path
            CASE states IS
                WHEN "010" => akku <= STD_LOGIC_VECTOR(unsigned(("0" & akku(7 DOWNTO 0))) + unsigned("0" & data_in)); -- add
                WHEN "011" => akku(7 DOWNTO 0) <= akku(7 DOWNTO 0) NOR data_in; -- nor
                WHEN "101" => akku(8) <= '0'; -- branch not taken, clear carry
                WHEN OTHERS => NULL; -- instr. fetch, jcc taken (000), sta (001)
            END CASE;
            -- State machine
            IF (states /= "000") THEN
                states <= "000"; -- fetch next opcode
            ELSIF (data_in(7 DOWNTO 6) = "11" AND akku(8) = '1') THEN
                states <= "101"; -- branch not taken
            ELSE
                states <= "0" & NOT data_in(7 DOWNTO 6); -- execute instruction
            END IF;
        END IF;
    END PROCESS;
    -- output
    adress <= STD_LOGIC_VECTOR(adreg);
    data_out <= "ZZZZZZZZ" WHEN states /= "001" ELSE
        akku(7 DOWNTO 0);
    oe <= '1' WHEN (clk = '1' OR states = "001" OR rst = '0' OR states = "101") ELSE
        '0';
    -- no memory access during reset and state "101" (branch not taken)
    we <= '1' WHEN (clk = '1' OR states /= "001" OR rst = '0') ELSE
        '0';
END CPU_ARCH;