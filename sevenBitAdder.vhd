LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

entity sevenBitAdder is
    port (
        inputA : in std_logic_vector(6 downto 0);
        inputB : in std_logic_vector(6 downto 0);
        sum : out std_logic_vector(6 downto 0);
        carryOut : out std_logic
    );
end sevenBitAdder;

architecture rtl of sevenBitAdder is

    signal carry0, carry1, carry2, carry3, carry4, carry5 : std_logic;

    component oneBitAdder is 
        PORT(
            carryIn :       IN STD_LOGIC;
            A,B :           IN STD_LOGIC;
            sum,carryOut :  OUT STD_LOGIC
        );
    end component oneBitAdder;

    begin

        adder6 : oneBitAdder port map (
            carryIn => carry5,
            A => inputA(6),
            B => inputB(6),
            sum => sum(6),
            carryOut => carryOut
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