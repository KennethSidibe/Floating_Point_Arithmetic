LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

entity comparatorAndSubstractor is
    port (
        exponentA : in std_logic_Vector(6 downto 0); 
        exponentB : in std_logic_Vector(6 downto 0);
        carryOut : out std_logic;
        difference : out std_logic_Vector(6 downto 0) 
    );
end comparatorAndSubstractor;


architecture rtl of comparatorAndSubstractor is

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

    component substractor7 is 

        port (
            inputA : in std_logic_vector(6 downto 0);
            inputB : in std_logic_vector(6 downto 0);
            borrowIn : in std_logic;
            borrowOut : out std_logic;
            difference : out std_logic_vector(6 downto 0)
        );

    end component substractor7;

    signal isSuperior, isInferior, isEqual, carryOutSignal : std_logic;
    signal minuend, subtrahend : std_logic_vector(6 downto 0);
    signal borrowIn : std_logic:= '0';
    signal borrowOut : std_logic;
    
    begin

        comparator : cascadingComparator7Bit port map (
            x => exponentA,
            y => exponentB,
            isSuperiorOut => isSuperior,
            isInferiorOut => isInferior,
            isEqualOut => isEqual
        );

        muxMinuendSuperior : mux2To1_7bit port map (
            selector => isSuperior,
            input0 => exponentB,
            input1 => exponentA,
            output => minuend
        );

        muxSubtrahendInferior : mux2To1_7bit port map(
            selector => isInferior,
            input0 => exponentB,
            input1 => exponentA,
            output => subtrahend
        );

        substractor : substractor7 port map(
            inputA => minuend,
            inputB => subtrahend,
            borrowIn => borrowIn,
            borrowOut => carryOut,
            difference => difference
        );

end rtl ; -- comparatorAndSubstractor