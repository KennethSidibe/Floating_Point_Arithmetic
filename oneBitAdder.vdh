LIBRARY ieee;
USE ieee.std_logic_1164;

ENTITY oneBitAdder IS
PORT(
    carryIn :       IN STD_LOGIC;
    A,B :           IN STD_LOGIC;
    sum,carryOut :  OUT STD_LOGIC);
END oneBitAdder;

ARCHITECTURE RTL OF oneBitAdder IS
    SIGNAL in_CarryOut1,in_CarryOut2,in_CarryOut3 : STD_LOGIC;
BEGIN

    in_CarryOut1 <= carryIn xor A;
    in_CarryOut2 <= in_CarryOut1 and B;
    in_CarryOut3 <= carryIn and B;

    sum <= carryIn xor A xor B;
    carryOut <= in_CarryOut2 or in_CarryOut3;

END RTL;
    
