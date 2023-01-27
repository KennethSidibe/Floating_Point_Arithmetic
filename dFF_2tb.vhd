-- Testbench for dFF_2
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;

ENTITY dFF_2tb IS
END dFF_2tb;

ARCHITECTURE behavior OF dFF_2tb IS

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
    SIGNAL time     : INTEGER := 0;

    BEGIN

        -- Instantiate the Unit Under Test (UUT)
        uut: dFF_2 PORT MAP (
            i_d      => i_d,
            i_clock  => i_clock,
            o_q      => o_q,
            o_qBar   => o_qBar);

        -- Test stimulus process
        stim_proc: PROCESS

        BEGIN
                -- wait for 100 ns for the circuit to stabilize
                wait for 100 ns;

                -- send input test vectors
                i_d <= '1';
                i_clock <= '1';
                wait for 10 ns;

                i_clock <= '0';
                wait for 10 ns;

                i_d <= '0';
                i_clock <= '1';

                wait for 10 ns;
                i_clock <= '0';
                wait for 10 ns;

                i_d <= '1';
                i_clock <= '1';
                wait for 10 ns;
                
                i_clock <= '0';

                -- wait for 100 ns after last input change
                wait for 100 ns;

                -- stop the test
                wait;
            END PROCESS;

        -- Monitor output
        monitor_proc: PROCESS

            BEGIN
                -- wait for 100 ns for the circuit to stabilize
                wait for 100 ns;

                -- print header
                report "Time [ns] | i_d | i_clock | o_q | o_qBar";
                report "==========================================";

                -- print output values
                WHILE true LOOP
                    report integer'image(time) & " | " &
                        std_logic'image(i_d) & " | " &
                        std_logic'image(i_clock) & " | " &
                        std_logic'image(o_q) & " | " &
                        std_logic'image(o_qBar);
                    wait for 10 ns;
                    time <= time + 10;
                END LOOP;
        END PROCESS;
    END;
