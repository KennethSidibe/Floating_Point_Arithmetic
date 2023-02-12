LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

-- The present entity leverages the cascading 8-bit comparator to compare two 7-bit inputs.
-- It extends the inputs to 8-bit by appending a 0 to the end of each 7-bit signal.
-- This process allows for accurate comparison between the two inputs using the cascading 8-bit comparator.

entity cascadingComparator7Bit is
  
    port(
        x : in std_logic_vector(6 downto 0);
        y : in std_logic_vector(6 downto 0);
        isSuperiorOut : out std_logic;
        isInferiorOut : out std_logic;
        isEqualOut : out std_logic
    );

end cascadingComparator7Bit;

architecture rtl of cascadingComparator7Bit is

    signal x8Bit, y8Bit : std_logic_vector(7 downto 0);

    component cascadingComparator8Bit is 

        port(

            x : in std_logic_vector (7 downto 0);
            y: in std_logic_vector (7 downto 0);

            isSuperiorOut : out std_logic;
            isInferiorOut : out std_logic;
            isEqualOut : out std_logic

        );

    end component cascadingComparator8Bit;

    begin

        x8Bit <= x & '0';
        y8Bit <= y & '0';

        comparator1 : cascadingComparator8Bit port map (
            x => x8Bit,
            y => y8Bit,

            isSuperiorOut => isSuperiorOut,
            isInferiorOut => isInferiorOut,
            isEqualOut => isEqualOut
        );

    end rtl ; -- rtl
