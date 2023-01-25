LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY sixteenBitRegister IS 
    PORT(
        reset,load : IN STD_LOGIC;
        clock : IN STD_LOGIC;
        input : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
        output : OUT STD_LOGIC_VECTOR(15 DOWNTO 0));
END sixteenBitRegister;

ARCHITECTURE RTL OF sixteenBitRegister IS
    SIGNAL in_input, inNotInput : STD_LOGIC_VECTOR(15 DOWNTO 0);

    COMPONENT enARDFlipFlop_2
    PORT(
            reset : IN STD_LOGIC;
            clock : IN STD_LOGIC;
            inD : IN STD_LOGIC;
            enable : IN STD_LOGIC;
            outQ, notOutQ : OUT STD_LOGIC);
    END COMPONENT;
BEGIN 

bit15 : enARDFlipFlop_2
    PORT MAP(
            reset => reset,
            clock => clock,
            inD => input(15),
            enable => load,
            outQ => in_input(15),
            notOutQ => inNotInput(15));

bit14 : enARDFlipFlop_2
    PORT MAP(
            reset => reset,
            clock => clock,
            inD => input(14),
            enable => load,
            outQ => in_input(14),
            notOutQ => inNotInput(14));
    
bit13 : enARDFlipFlop_2
    PORT MAP(
            reset => reset,
            clock => clock,
            inD => input(13),
            enable => load,
            outQ => in_input(13),
            notOutQ => inNotInput(13)
            );
bit12 : enARDFlipFlop_2
    PORT MAP(
            reset => reset,
            clock => clock,
            inD => input(12),
            enable => load,
            outQ => in_input(12),
            notOutQ => inNotInput(12));
bit11 : enARDFlipFlop_2
    PORT MAP(
            reset => reset,
            clock => clock,
            inD => input(11),
            enable => load,
            outQ => in_input(11),
            notOutQ => inNotInput(14));

bit10 : enARDFlipFlop_2
    PORT MAP(
            reset => reset,
            clock => clock,
            inD => input(10),
            enable => load,
            outQ => in_input(10),
            notOutQ => inNotInput(10));

bit9 : enARDFlipFlop_2
    PORT MAP(
            reset => reset,
            clock => clock,
            inD => input(9),
            enable => load,
            outQ => in_input(9),
            notOutQ => inNotInput(9));

bit8 : enARDFlipFlop_2
    PORT MAP(
            reset => reset,
            clock => clock,
            inD => input(8),
            enable => load,
            outQ => in_input(8),
            notOutQ => inNotInput(8));

bit7 : enARDFlipFlop_2
    PORT MAP(
            reset => reset,
            clock => clock,
            inD => input(7),
            enable => load,
            outQ => in_input(7),
            notOutQ => inNotInput(7));

bit6 : enARDFlipFlop_2
    PORT MAP(
            reset => reset,
            clock => clock,
            inD => input(6),
            enable => load,
            outQ => in_input(6),
            notOutQ => inNotInput(6));

bit5 : enARDFlipFlop_2
    PORT MAP(
            reset => reset,
            clock => clock,
            inD => input(5),
            enable => load,
            outQ => in_input(5),
            notOutQ => inNotInput(5));

bit4 : enARDFlipFlop_2
    PORT MAP(
            reset => reset,
            clock => clock,
            inD => input(4),
            enable => load,
            outQ => in_input(4),
            notOutQ => inNotInput(4));

bit3 : enARDFlipFlop_2
    PORT MAP(
            reset => reset,
            clock => clock,
            inD => input(3),
            enable => load,
            outQ => in_input(3),
            notOutQ => inNotInput(3));

bit2 : enARDFlipFlop_2
    PORT MAP(
            reset => reset,
            clock => clock,
            inD => input(2),
            enable => load,
            outQ => in_input(2),
            notOutQ => inNotInput(2));

bit1 : enARDFlipFlop_2
    PORT MAP(
            reset => reset,
            clock => clock,
            inD => input(1),
            enable => load,
            outQ => in_input(1),
            notOutQ => inNotInput(1));

bit0 : enARDFlipFlop_2
    PORT MAP(
            reset => reset,
            clock => clock,
            inD => input(0),
            enable => load,
            outQ => in_input(0),
            notOutQ => inNotInput(0));

    output <= in_input;

END RTL;
