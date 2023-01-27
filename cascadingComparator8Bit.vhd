LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

entity cascadingComparator8Bit is
  
    port(
        x : in std_logic_vector(7 downto 0);
        y : in std_logic_vector(7 downto 0);
        isSuperiorOut : out std_logic;
        isInferiorOut : out std_logic;
        isEqualOut : out std_logic
    );

end cascadingComparator8Bit;

architecture rtl of cascadingComparator8Bit is

    signal xInferiorToBOutSignal, xSuperiorToBOutSignal, xEqualToBOutSignal : std_logic;
    signal logicalZero : std_logic;
    signal logicalOneForEqual : std_logic;
    signal xMSB, xLSB, yMSB, yLSB : std_logic_vector(3 downto 0);

    component cascadingComparator is 

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

    end component cascadingComparator;

    begin

        logicalZero <= '0';
        logicalOneForEqual <= '1';
        
        xMSB <= x(7 downto 4);
        xLSB <= x(3 downto 0);

        yMSB <= y(7 downto 4);
        yLSB <= y(3 downto 0);

        comparator1 : cascadingComparator port map (
            x => xLSB,
            y => yLSB,

            xInferiorToB => logicalZero,
            xSuperiorToB => logicalZero,
            xEqualToB => logicalOneForEqual,

            isSuperior => xInferiorToBOutSignal,
            isInferior => xSuperiorToBOutSignal,
            isEqual => xEqualToBOutSignal
        );

        comparator2 : cascadingComparator port map(
            x => xMSB,
            y => yMSB,

            xInferiorToB => xInferiorToBOutSignal,
            xSuperiorToB => xSuperiorToBOutSignal,
            xEqualToB => xEqualToBOutSignal,

            isSuperior => isSuperiorOut,
            isInferior => isInferiorOut,
            isEqual => isEqualOut
        );



end rtl ; -- rtl