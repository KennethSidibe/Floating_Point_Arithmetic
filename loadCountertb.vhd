library IEEE;
USE ieee.std_logic_1164.ALL;

entity loadCountertb is
end loadCountertb;

architecture rtl of loadCountertb is

    signal load, clock, enable :std_logic := '0';
    signal zOutput : std_logic;
    signal  qOutput, dInput: std_logic_vector(3 downto 0);
    constant T : time := 20 ns;

    component loadCounter is 

        port (
            load : in std_logic;
            clock : in std_logic;
            dInput : in std_logic_vector(3 downto 0);
            enable : in std_logic;

            zOutput : out std_logic;
            qOutput : out std_logic_vector(3 downto 0)
        );

    end component loadCounter;
    
    begin

        uut : loadCounter port map (
            load => load,
            clock => clock,
            dInput => dInput,
            enable => enable,

            zOutput => zOutput,
            qOutput => qOutput
        );

        clock_process : process

            begin

                clock <= '0';
                wait for T/2;

                clock <= '1';
                wait for T/2;

        end process;

        stimulis : process

            begin

                -- let circuit stabilize
                wait for 100 ns;
                -- STABILIZE

                load <= '1', '0' after 40 ns;

                enable <= '1', '0' after 600 ns;
                dInput <= "1110";

                wait for 600 ns;
                
                -- TURN OFF
                enable <= '0';
                load <= '0';
                -- TURN OFF


                -- wait after last input
                wait for 100 ns;
                
                
                wait;

        end process;

end rtl ; -- rtl