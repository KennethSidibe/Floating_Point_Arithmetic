LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

entity nShiftertb is
end nShiftertb;

architecture rtl of nShiftertb is

    component nShifter is

        PORT(
            n                       : IN      STD_LOGIC_VECTOR(3 downto 0);
            load                    : in      std_logic;
            enable                  : in      std_logic;
            loadInput               : in      std_logic_vector(8 downto 0);
            clock                   : in      std_logic;
    
            shiftedResult           : OUT     STD_LOGIC_VECTOR(8 downto 0)
        );
    
    end component nShifter;

    signal load, enable, clock : std_logic;
    signal n : std_logic_vector(3 downto 0);
    signal loadInput, shiftedResult : std_logic_vector(8 downto 0);
    signal T : time := 20 ns;

    begin

        nShifterUnit : nShifter port map(
            n => n,
            load => load,
            enable => enable,
            loadInput => loadInput,
            clock => clock,
            shiftedResult => shiftedResult
        );

        clockProcess : process 

            begin 

                clock <= '0';
                wait for T/2;
                clock <= '1';
                wait for T/2;

        end process;

        stimulis : process

            begin

                wait for 100 ns;

                n <= "0010";
                load <= '1';
                enable <= '1';
                loadInput <= "100000000";

                wait for 100 ns;


                n <= "0010";
                load <= '0';
                enable <= '1';
                loadInput <= "100000000";
                
                wait for 100 ns;

        end process;

end rtl ; -- rtl