LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY eightBitRegister IS 
    PORT(
        reset,load : IN STD_LOGIC;
        clock : IN STD_LOGIC;
        input : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
        output : OUT STD_LOGIC_VECTOR(7 DOWNTO 0));
END eightBitRegister;

ARCHITECTURE RTL OF eightBitRegister IS
    SIGNAL in_input, inNotInput : STD_LOGIC_VECTOR(7 DOWNTO 0);

    COMPONENT enARDFlipFlop_2
    PORT(
            reset : IN STD_LOGIC;
            clock : IN STD_LOGIC;
            inD : IN STD_LOGIC;
            enable : IN STD_LOGIC;
            outQ, notOutQ : OUT STD_LOGIC);
    END COMPONENT;
BEGIN 

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
