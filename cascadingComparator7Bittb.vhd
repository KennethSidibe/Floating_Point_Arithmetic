LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

entity cascadingComparator7Bittb is
end cascadingComparator7Bittb;

architecture rtl of cascadingComparator7Bittb is

    signal x, y : std_logic_vector(6 downto 0);
    signal isSuperiorOut, isInferiorOut, isEqualOut : std_logic;

    component cascadingComparator7Bit is 

        port(
            x : in std_logic_vector(6 downto 0);
            y : in std_logic_vector(6 downto 0);
            isSuperiorOut : out std_logic;
            isInferiorOut : out std_logic;
            isEqualOut : out std_logic
        );

    end component cascadingComparator7Bit;
    
    begin

        cascadingComparator8BitTestbench: cascadingComparator7Bit port map (
            x => x,
            y => y,
            isSuperiorOut => isSuperiorOut,
            isInferiorOut => isInferiorOut,
            isEqualOut => isEqualOut
        );

        testbench : process

            begin

                x <= "1000000";
                y <= "0000000";

                wait for 20 ns;

                x <= "0000000";
                y <= "1000000";

                wait for 20 ns;

                x <= "1000000";
                y <= "1000000";

                wait for 20 ns;

                wait;

        end process;

end rtl ; -- rtl
