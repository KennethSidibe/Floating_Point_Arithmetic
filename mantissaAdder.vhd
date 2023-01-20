-- This entity is responsible of producing the sum mantissa for the result, including the sign bit of both 
-- this entity must be 9 bits 

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY mantissaAdder IS
PORT(
    A,B :           IN STD_LOGIC_VECTOR(8 DOWNTO 0);
    carryOut :      OUT STD_LOGIC;
    sum :           OUT STD_LOGIC_VECTOR(8 DOWNTO 0));
END mantissaAdder;

ARCHITECTURE RTL OF mantissaAdder IS
    SIGNAL  in_Sum, in_CarryOut : STD_LOGIC_VECTOR(8 DOWNTO 0);
    SIGNAL gnd : STD_LOGIC;

    COMPONENT oneBitAdder
    PORT(
        carryIn :   IN STD_LOGIC;
         A,B :       IN STD_LOGIC;
        sum, carryOut : OUT STD_LOGIC);
    END COMPONENT;
BEGIN

        gnd <= '0';

add8 : oneBitAdder
    PORT MAP(   carryIn => gnd,
                A => A(8),
                B => B(8),
                sum => in_Sum(8),
                carryOut => in_CarryOut(8));

add7 : oneBitAdder
    PORT MAP(   carryIn => in_CarryOut(8),
                A => A(7),
                B => B(7),
                sum => in_Sum(7),
                carryOut => in_CarryOut(7));

add6 : oneBitAdder
    PORT MAP(   carryIn => in_CarryOut(7),
                A => A(6),
                B => B(6),
                sum => in_Sum(6),
                carryOut => in_CarryOut(6));

add5 : oneBitAdder
    PORT MAP(   carryIn => in_CarryOut(6),
                A => A(5),
                B => B(5),
                sum => in_Sum(5),
                carryOut => in_CarryOut(5));

add4 : oneBitAdder
    PORT MAP(   carryIn => in_CarryOut(5),
                A => A(4),
                B => B(4),
                sum => in_Sum(4),
                carryOut => in_CarryOut(4));

add3 : oneBitAdder
    PORT MAP(   carryIn => in_CarryOut(4),
                A => A(3),
                B => B(3),
                sum => in_Sum(3),
                carryOut => in_CarryOut(3));

add2 : oneBitAdder
    PORT MAP(   carryIn => in_CarryOut(3),
                A => A(2),
                B => B(2),
                sum => in_Sum(2),
                carryOut => in_CarryOut(2));

add1 : oneBitAdder
    PORT MAP(   carryIn => in_CarryOut(2),
                A => A(1),
                B => B(1),
                sum => in_Sum(1),
                carryOut => in_CarryOut(1));

add0 : oneBitAdder
    PORT MAP(   carryIn => in_CarryOut(1),
                A => A(0),
                B => B(0),
                sum => in_Sum(0),
                carryOut => in_CarryOut(0));

    sum <= in_Sum;
    carryOut <= in_CarryOut(0);

END RTL; -- rtl
