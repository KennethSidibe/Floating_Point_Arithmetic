LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

entity cascadingComparator8Bittb is
end cascadingComparator8Bittb;

architecture rtl of cascadingComparator8Bittb is

    signal  x, y : std_logic_vector(7 downto 0);
    signal isSuperiorOut, isInferiorOut, isEqualOut : std_logic;

    component cascadingComparator8Bit is 

        port(
            x : in std_logic_vector(7 downto 0);
            y : in std_logic_vector(7 downto 0);
            isSuperiorOut : out std_logic;
            isInferiorOut : out std_logic;
            isEqualOut : out std_logic
        );

    end component cascadingComparator8Bit;
    
    begin

        cascadingComparator8BitTestbench: cascadingComparator8Bit port map (
            x => x,
            y => y,
            isSuperiorOut => isSuperiorOut,
            isInferiorOut => isInferiorOut,
            isEqualOut => isEqualOut
        );

        testbench : process

            begin

                x <= "10000000";
                y <= "00000000";

                wait for 20 ns;

                x <= "00000000";
                y <= "10000000";

                wait for 20 ns;

                x <= "10000000";
                y <= "10000000";

                wait for 20 ns;

                x <= "00000110";
                y <= "00000100";

                wait for 20 ns;

                wait;

        end process;

        

end rtl ; -- rtl

