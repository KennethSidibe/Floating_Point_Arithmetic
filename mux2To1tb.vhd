LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

entity  mux2To1tb is
end  mux2To1tb;

architecture rtl of mux2To1tb is

    signal selector, input1, input2, output : std_logic;

    component mux2To1 is 

        port(
        
            selector : in std_logic;
            input1 : in std_logic;
            input2 : in std_logic;
            output : out std_logic

        );

    end component mux2To1;

    begin

        mux2To1Testbench : mux2To1 port map(
            selector => selector,
            input1 => input1,
            input2 => input2,
            output => output
        );

        muxTestbench : process

            begin

                selector <= '0';
                input1 <= '0';
                input2 <= '1';

                wait for 20 ns;
                
                selector <= '1';
                input1 <= '0';
                input2 <= '1';

                wait for 20 ns;

                wait;


        end process;


end rtl ; -- rtl