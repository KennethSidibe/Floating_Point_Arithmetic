LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

entity nineBitRegistertb is
end nineBitRegistertb;

architecture rtl of nineBitRegistertb is
    
    component nineBitRegister is 

        port (
            reset : in std_logic;
            enable : IN STD_LOGIC;
            clock : IN STD_LOGIC;
            input : IN STD_LOGIC_VECTOR(8 DOWNTO 0);
            output : OUT STD_LOGIC_VECTOR(8 DOWNTO 0)
        );

    end component nineBitRegister;

    signal reset : std_logic := '0';
    signal enable : std_logic := '0';
    signal clock : std_logic;
    signal input, output : std_logic_vector(8 downto 0);
    signal T : time := 20 ns;
    
    begin

        registre9bit : nineBitRegister port map (
            reset => reset,
            enable => enable,
            clock => clock,
            input => input,
            output => output
        );
        
        clockPro : process

            begin

                clock <= '0';
                wait for T/2;
                clock <= '1';
                wait for T/2;

        end process;

        stimulis : process 

            begin 

                wait for 100 ns;

                enable <= '1';
                input <= "000000001";

                wait for 20 ns;

                reset <= '1';
                input <= "000000001";

                wait for 100 ns;

                reset <= '0', '1' after 20 ns, '0' after 40 ns;
                input <= "000000001";

                wait for 100 ns;

                reset <= '1';
                input <= "100000000";

                wait for 100 ns;
                

                wait for 100 ns;

        end process;

end rtl ; -- rtl