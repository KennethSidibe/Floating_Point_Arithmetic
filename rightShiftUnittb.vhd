
library IEEE;
use IEEE.std_logic_1164.all;

entity rightShiftUnittb is
end rightShiftUnittb;

architecture rtl of rightShiftUnittb is

    component rightShiftUnit is 

        port (
            input : in std_logic_vector(7 downto 0);
            output: out std_logic_vector(7 downto 0)
        );

    end component rightShiftUnit;
    
    signal input, output : std_logic_vector(7 downto 0);

    begin

        rightShiftUnitTest: rightShiftUnit port map(
            input => input,
            output => output
        );

        testbench : process

            begin

                input <= "01001101";

                wait for 20 ns;

                input <= "11111111";

                wait for 20 ns;

                input <= "00000001";

                wait for 20 ns;

                input <= "10000000";

                wait for 20 ns;

                wait;

        end process;

    
        
end rtl ; -- rtl