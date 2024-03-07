-- TestBench Template 

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;

ENTITY Comparator4bit_tb IS
END Comparator4bit_tb;

ARCHITECTURE behavior OF Comparator4bit_tb IS 

-- Component Declaration
        COMPONENT Comparator4bit
  Port ( A : in  STD_LOGIC_VECTOR(3 downto 0);
         B : in  STD_LOGIC_VECTOR(3 downto 0);
         GThan : in  STD_LOGIC;
         EQ : in  STD_LOGIC;
         LT : in  STD_LOGIC;
         A_GT_B : out  STD_LOGIC;
         A_EQ_B : out  STD_LOGIC;
         A_LT_B : out  STD_LOGIC);
        END COMPONENT;

        SIGNAL GThan :  std_logic := '0';
           SIGNAL EQ :  std_logic := '1';
           SIGNAL LT :  std_logic := '0';
        SIGNAL A :  std_logic_vector(3 downto 0) := "0000";
           SIGNAL B :  std_logic_vector(3 downto 0) := "0000";
           
           signal A_GT_B : std_logic;
           signal A_EQ_B : std_logic;
           signal A_LT_B : std_logic;
BEGIN

-- Component Instantiation
        uut: Comparator4bit PORT MAP(
                A => A,
                B => B,
                      GThan => GThan,
                      EQ => EQ,
                      LT => LT,
                      A_GT_B => A_GT_B,
                      A_EQ_B => A_EQ_B,
                      A_LT_B => A_LT_B
        );


--  Test Bench Statements
   tb : PROCESS
   BEGIN

      wait for 100 ns; -- wait until global set/reset completes

      A <= "1000";
        B <= "1000";
        wait for 20 ns;
        
        A <= "1000";
        B <= "0100";
        wait for 20 ns;
        
        A <= "0001";
        B <= "1000";
        wait for 20 ns;
      
      wait; -- will wait forever
   END PROCESS tb;
--  End Test Bench 

END;
