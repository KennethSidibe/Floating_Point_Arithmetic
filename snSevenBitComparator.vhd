LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY snSevenBitComparator IS 
    PORT(   input_1,input_2 : IN STD_LOGIC_VECTOR(6 DOWNTO 0);
            output_LT : OUT STD_LOGIC);
END snSevenBitComparator;

ARCHITECTURE RTL OF snSevenBitComparator IS 
    SIGNAL in_LT : STD_LOGIC_VECTOR(6 DOWNTO 0);
    SIGNAL gnd : STD_LOGIC;
    SIGNAL in_equal : STD_LOGIC;

    COMPONENT oneBitComparator
        PORT(   previous_LT : IN STD_LOGIC;
                input_1,input_2 : IN STD_LOGIC;
                output_LT : OUT STD_LOGIC);
    END COMPONENT;

BEGIN 

    gnd <= '0';
    in_equal <= ((input_1(6) XNOR input_2(6)) AND (input_1(5) XNOR input_2(5)) AND (input_1(4)XNOR input_2(4)) AND (input_1(3) XNOR input_2(3)) AND (input_1(2) XNOR input_2(2)) AND (input_1(1) XNOR input_2(1)) AND (input_1(0) XNOR input_2(0)));

comp6 : oneBitComparator
    PORT MAP(   previous_LT => gnd,
                input_1 => input_1(6),
                input_2 => input_2(6),
                output_LT => in_LT(6));

Comp5 : oneBitComparator
    PORT MAP(   previous_LT => in_LT(6),
                input_1 => input_1(5),
                input_2 => input_2(5),
                output_LT => in_LT(5));

Comp4 : oneBitComparator
    PORT MAP(   previous_LT => in_LT(5),
                input_1 => input_1(4),
                input_2 => input_2(4),
                output_LT => in_LT(4));

Comp3 : oneBitComparator
    PORT MAP(   previous_LT => in_LT(4),
                input_1 => input_1(3),
                input_2 => input_2(3),
                output_LT => in_LT(3));

Comp2 : oneBitComparator
    PORT MAP(   previous_LT => in_LT(3),
                input_1 => input_1(2),
                input_2 => input_2(2),
                output_LT => in_LT(2));

Comp1 : oneBitComparator
    PORT MAP(   previous_LT => in_LT(2),
                input_1 => input_1(1),
                input_2 => input_2(1),
                output_LT => in_LT(1));

Comp0 : oneBitComparator
    PORT MAP(   previous_LT => in_LT(1),
                input_1 => input_1(0),
                input_2 => input_2(0),
                output_LT => in_LT(0));

    output_LT <= (in_LT(0) OR in_equal);
END RTL;
