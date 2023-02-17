library ieee;
use ieee.std_logic_1164.all;

entity adderSubstractor9Bit is
    port (
        inputA : in std_logic_vector(8 downto 0);
        inputB : in std_logic_vector(8 downto 0);
        addBar_Sub : in std_logic;

        operationResult : out std_logic_vector(8 downto 0)
    );
end adderSubstractor9Bit;

architecture rtl of adderSubstractor9Bit is

    component fullSubstractor9Bit is
        port (
            inputA : in std_logic_vector(8 downto 0);
            inputB : in std_logic_vector(8 downto 0);
            borrowIn : in std_logic;
            
            borrowOut : out std_logic;
            difference : out std_logic_vector(8 downto 0)
        );
    end component;

    component nineBitAdder is

        port (
            inputA : in std_logic_vector(8 downto 0);
            inputB : in std_logic_vector(8 downto 0);
            sum : out std_logic_vector(8 downto 0);
            carryOut : out std_logic
        );
    
    end component nineBitAdder;

    component mux2To1_9bit is 

        port(
            
            selector    : in std_logic;
            input0      : in std_logic_vector(8 downto 0);
            input1      : in std_logic_vector(8 downto 0);
            output      : out std_logic_vector(8 downto 0)

        );

    end component mux2To1_9bit;

    signal sumSignal, differenceSignal         : std_logic_vector(8 downto 0);
    signal addCarryOut, subCarryOut            : std_logic;
    signal logicalZeroForSub                   : std_logic := '0';

    begin

        adder : nineBitAdder port map(
            inputA => inputA,
            inputB => inputB,
            sum => sumSignal,
            carryOut => addCarryOut
        );

        substractor : fullSubstractor9Bit port map(
            inputA => inputA,
            inputB => inputB,
            borrowIn => logicalZeroForSub,

            borrowOut => subCarryOut,
            difference => differenceSignal
        );

        muxOutput : mux2To1_9Bit port map (
            selector => addBar_sub,
            input0 => sumSignal,
            input1 => differenceSignal,

            output => operationResult
        );

end rtl;