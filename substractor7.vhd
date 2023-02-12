library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- This entity implements the 2's complement method for subtraction.
-- The process involves inverting all the bits of the operand 'b' and adding 1 to obtain its negation, i.e. -b.
-- The result is then obtained by adding -b to operand 'a'.

-- However, there is a special case where the operands are equal i.e. a = b.
-- In this case, the circuit generates an overflow as the result should be 0.
-- To handle this situation, a multiplexer is used with a constant value of '0000000'
-- which forces the output of the difference to 0 when the operands are equal.

-- Note: The subtractor works as expected for all other cases.

entity substractor7 is

    port (
        inputA : in std_logic_vector(6 downto 0);
        inputB : in std_logic_vector(6 downto 0);
        difference : out std_logic_vector(6 downto 0);
        carryOutDifference : out std_logic
    );

end substractor7;

architecture rtl of substractor7 is

    signal carry0, carry1, carry2, carry3, carry4, carry5 : std_logic;
    signal plusOneCarry : std_logic; -- carry responsible to do the +1 for the 2's cpl
    signal sum6, sum5, sum4, sum3, sum2, sum1, sum0 : std_logic;
    signal oneConstant : std_logic_vector (6 downto 0);
    signal bInverted : std_logic_vector(6 downto 0);
    signal bPlusOneCarryout : std_logic;
    signal zeroConstant : std_logic_vector(6 downto 0);

    signal isSuperior, isInferior, isEqual : std_logic;

    signal soustractionDifference : std_logic_vector(6 downto 0);

    component oneBitAdder is 

        PORT(
            carryIn :       IN STD_LOGIC;
            A,B :           IN STD_LOGIC;
            sum,carryOut :  OUT STD_LOGIC
        );

    end component oneBitAdder;

    component mux2To1_7bit is 

        port(
            
            selector : in std_logic;
            input0 : in std_logic_vector(6 downto 0);
            input1: in std_logic_vector(6 downto 0);
            output : out std_logic_vector(6 downto 0)

        );

    end component mux2To1_7bit;

    component cascadingComparator7Bit is 

        port(
            x : in std_logic_vector(6 downto 0);
            y : in std_logic_vector(6 downto 0);
            isSuperiorOut : out std_logic;
            isInferiorOut : out std_logic;
            isEqualOut : out std_logic
        );

    end component cascadingComparator7Bit;

    component sevenBitAdder is

        port (
            inputA : in std_logic_vector(6 downto 0);
            inputB : in std_logic_vector(6 downto 0);
            sum : out std_logic_vector(6 downto 0);
            carryOut : out std_logic
        );

    end component sevenBitAdder;

    begin

        bInverted(6) <= inputB(6) xor '1';
        bInverted(5) <= inputB(5) xor '1';
        bInverted(4) <= inputB(4) xor '1';
        bInverted(3) <= inputB(3) xor '1';
        bInverted(2) <= inputB(2) xor '1';
        bInverted(1) <= inputB(1) xor '1';
        bInverted(0) <= inputB(0) xor '1';

        zeroConstant <= "0000000";

        comparatorIfEqual : cascadingComparator7Bit port map (
            x => inputA,
            y => inputB,
            isSuperiorOut => isSuperior,
            isInferiorOut => isInferior,
            isEqualOut => isEqual
        );

        muxOuputIfEqual : mux2To1_7Bit port map (
            selector => isEqual,
            input0 => soustractionDifference,
            input1 => zeroConstant,
            output => difference
        ); -- if the operation should lead to zero then a mux output the vector zero

        MSBAdder : oneBitAdder port map (
            carryIn => carry5,
            A => inputA(6),
            B => bInverted(6),
            sum => soustractionDifference(6),
            carryOut => carryOutDifference
        );

        
        adder5 : oneBitAdder port map (
            carryIn => carry4,
            A => inputA(5),
            B => bInverted(5),
            sum => soustractionDifference(5),
            carryOut => carry5
        );


        adder4 : oneBitAdder port map (
            carryIn => carry3,
            A => inputA(4),
            B => bInverted(4),
            sum => soustractionDifference(4),
            carryOut => carry4
        );


        adder3 : oneBitAdder port map (
            carryIn => carry2,
            A => inputA(3),
            B => bInverted(3),
            sum => soustractionDifference(3),
            carryOut => carry3
        );


        adder2 : oneBitAdder port map (
            carryIn => carry1,
            A => inputA(2),
            B => bInverted(2),
            sum => soustractionDifference(2),
            carryOut => carry2
        );


        adder1 : oneBitAdder port map (
            carryIn => carry0,
            A => inputA(1),
            B => bInverted(1),
            sum => soustractionDifference(1),
            carryOut => carry1
        );

        adder0 : oneBitAdder port map (
            carryIn => '1',
            A => inputA(0),
            B => bInverted(0),
            sum => soustractionDifference(0),
            carryOut => carry0
        ); 

end rtl ; -- rtl