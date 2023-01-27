
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

-- Cascading Comparator entity block used for N bit comparison

entity cascadingComparator is

	port(

		x : in std_logic_vector (3 downto 0);
        y: in std_logic_vector (3 downto 0);

        xInferiorToB : in std_logic;
        xSuperiorToB : in std_logic;
        xEqualToB : in std_logic;

        isSuperior : out std_logic;
        isInferior : out std_logic;
        isEqual : out std_logic

	);

end entity cascadingComparator;

architecture rtl of cascadingComparator is

    signal xInferiorToBSignal, xSuperiorToBSignal, xEqualToBSignal : std_logic;

    component comparator4bit is 

        port(
            x : in std_logic_vector (3 downto 0);
            y: in std_logic_vector (3 downto 0);
            isSuperior : out std_logic;
            isInferior : out std_logic;
            isEqual : out std_logic
        );

    end component comparator4bit;

    begin

        comparator1 : comparator4bit port map(
            x => x,
            y => y,
            isSuperior => xSuperiorToBSignal,
            isInferior => xInferiorToBSignal,
            isEqual => xEqualToBSignal
        );

        isInferior <= xInferiorToBSignal or (xEqualToBSignal and xInferiorToB);
        isSuperior <= xSuperiorToBSignal or (xEqualToBSignal and xSuperiorToB);
        isEqual <= xEqualToBSignal and xEqualToB;


end rtl ; -- rtl