LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY oneBitComparator IS 
    PORT(   previous_GT,previous_LT : IN STD_LOGIC;
            input_1,input_2 : IN STD_LOGIC;
            output_LT : OUT STD_LOGIC);
END oneBitComparator;

ARCHITECTURE RTL OF oneBitComparator IS 
    SIGNAL in_LT1 ,in_LT2 ,in_LT : STD_LOGIC;

BEGIN 

    in_LT1 <= NOT(previous_GT) AND NOT(previous_LT) AND NOT(input_1) AND input_2;
    in_LT2 <= NOT(previous_GT) AND previous_LT;
    in_LT <= in_LT1 OR in_LT2;

    output_LT <= in_LT;
END RTL;
