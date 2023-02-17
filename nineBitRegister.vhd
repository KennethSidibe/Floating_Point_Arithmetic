LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY nineBitRegister IS 
    PORT(
        reset : std_logic;
        enable : IN STD_LOGIC;
        clock : IN STD_LOGIC;
        input : IN STD_LOGIC_VECTOR(8 DOWNTO 0);
        output : OUT STD_LOGIC_VECTOR(8 DOWNTO 0)
        );
END nineBitRegister;

ARCHITECTURE RTL OF nineBitRegister IS

    SIGNAL in_input, inNotInput : STD_LOGIC_VECTOR(8 DOWNTO 0);

    COMPONENT enardFF_2
    PORT(
        i_resetBar	: IN	STD_LOGIC;
		i_d		: IN	STD_LOGIC;
		i_enable	: IN	STD_LOGIC;
		i_clock		: IN	STD_LOGIC;
		o_q, o_qBar	: OUT	STD_LOGIC
        );
    END COMPONENT;

    BEGIN 

    bit8 : enardFF_2
        PORT MAP(
                i_resetBar => reset,
                i_clock => clock,
                i_d => input(8),
                i_enable => enable,
                o_q => in_input(8),
                o_qBar => inNotInput(8));

    bit7 : enardFF_2
        PORT MAP(
                i_resetBar => reset,
                i_clock => clock,
                i_d => input(7),
                i_enable => enable,
                o_q => in_input(7),
                o_qBar => inNotInput(7));

    bit6 : enardFF_2
        PORT MAP(
                i_resetBar => reset,
                i_clock => clock,
                i_d => input(6),
                i_enable => enable,
                o_q => in_input(6),
                o_qBar => inNotInput(6));

    bit5 : enardFF_2
        PORT MAP(
                i_resetBar => reset,
                i_clock => clock,
                i_d => input(5),
                i_enable => enable,
                o_q => in_input(5),
                o_qBar => inNotInput(5));

    bit4 : enardFF_2
        PORT MAP(
                i_resetBar => reset,
                i_clock => clock,
                i_d => input(4),
                i_enable => enable,
                o_q => in_input(4),
                o_qBar => inNotInput(4));

    bit3 : enardFF_2
        PORT MAP(
                i_resetBar => reset,
                i_clock => clock,
                i_d => input(3),
                i_enable => enable,
                o_q => in_input(3),
                o_qBar => inNotInput(3));

    bit2 : enardFF_2
        PORT MAP(
                i_resetBar => reset,
                i_clock => clock,
                i_d => input(2),
                i_enable => enable,
                o_q => in_input(2),
                o_qBar => inNotInput(2));

    bit1 : enardFF_2
        PORT MAP(
                i_resetBar => reset,
                i_clock => clock,
                i_d => input(1),
                i_enable => enable,
                o_q => in_input(1),
                o_qBar => inNotInput(1));

    bit0 : enardFF_2
        PORT MAP(
                i_resetBar => reset,
                i_clock => clock,
                i_d => input(0),
                i_enable => enable,
                o_q => in_input(0),
                o_qBar => inNotInput(0));

        output(0) <= in_input(0);
        output(1) <= in_input(1);
        output(2) <= in_input(2);
        output(3) <= in_input(3);
        output(4) <= in_input(4);
        output(5) <= in_input(5);
        output(6) <= in_input(6);
        output(7) <= in_input(7);
        output(8) <= in_input(8);

END RTL;
