-- Testbench for dFF_2
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;

ENTITY dFF_2tb2 IS
END dFF_2tb2;

ARCHITECTURE rtl OF dFF_2tb2 IS

    COMPONENT dFF_2
        PORT(
            i_d : IN STD_LOGIC;
            i_clock : IN STD_LOGIC;
            o_q, o_qBar : OUT STD_LOGIC
        );
    END COMPONENT;

    SIGNAL i_d      : STD_LOGIC := '0';
    SIGNAL i_clock  : STD_LOGIC := '0';
    SIGNAL o_q      : STD_LOGIC;
    SIGNAL o_qBar   : STD_LOGIC;
    constant T : time := 20 ns;

    begin 

        uut : dFF_2 port map(

            i_d => i_d,
            i_clock => i_clock,
            o_q => o_q,
            o_qBar => o_qBar
        );

        clock : process 

            begin

                i_clock <= '0';
                wait for T/2;

                i_clock <= '1';
                wait for T/2;
        
        end process;

        testbench : process

            begin

                -- wait for circuit to stabilize
                wait for 100 ns;

                i_d <= '1';

                wait for T*4;

                i_d <= '0';

                wait for T*4;

            wait for 100 ns;
            -- wait for 100 ns after last input change

            wait;

        end process;

end rtl; 
