LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

entity nineBitAdder is
    port (
        inputA : in std_logic_vector(8 downto 0);
        inputB : in std_logic_vector(8 downto 0);
        sum : out std_logic_vector(8 downto 0);
        carryOut : out std_logic
    );
end nineBitAdder;

architecture rtl of nineBitAdder is

    signal carry0, carry1, carry2, carry3, carry4, carry5, carry6, carry7, carry8 : std_logic;

    component oneBitAdder is 
        PORT(
            carryIn :       IN STD_LOGIC;
            A,B :           IN STD_LOGIC;
            sum,carryOut :  OUT STD_LOGIC
        );
    end component oneBitAdder;

    begin

        adder8 : oneBitAdder port map (
            carryIn => carry7,
            A => inputA(8),
            B => inputB(8),
            sum => sum(8),
            carryOut => carryOut
        );

        adder7 : oneBitAdder port map (
            carryIn => carry6,
            A => inputA(7),
            B => inputB(7),
            sum => sum(7),
            carryOut => carry7
        );

        adder6 : oneBitAdder port map (
            carryIn => carry5,
            A => inputA(6),
            B => inputB(6),
            sum => sum(6),
            carryOut => carry6
        );

        adder5 : oneBitAdder port map (
            carryIn => carry4,
            A => inputA(5),
            B => inputB(5),
            sum => sum(5),
            carryOut => carry5
        );

        adder4 : oneBitAdder port map (
            carryIn => carry3,
            A => inputA(4),
            B => inputB(4),
            sum => sum(4),
            carryOut => carry4
        );

        adder3 : oneBitAdder port map (
            carryIn => carry2,
            A => inputA(3),
            B => inputB(3),
            sum => sum(3),
            carryOut => carry3
        );

        adder2 : oneBitAdder port map (
            carryIn => carry1,
            A => inputA(2),
            B => inputB(2),
            sum => sum(2),
            carryOut => carry2
        );

        adder1 : oneBitAdder port map (
            carryIn => carry0,
            A => inputA(1),
            B => inputB(1),
            sum => sum(1),
            carryOut => carry1
        );

        adder0 : oneBitAdder port map (
            carryIn => '0',
            A => inputA(0),
            B => inputB(0),
            sum => sum(0),
            carryOut => carry0
        ); 

end rtl ; -- rtl