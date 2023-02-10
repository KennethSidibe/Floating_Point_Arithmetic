LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

entity  mux2To1_9bittb is
end  mux2To1_9bittb;

architecture rtl of mux2To1_9bittb is

    signal selector : std_logic;
    signal input0, input1, output : std_logic_vector(8 downto 0);

    component mux2To1_9bit is 

        port(
            
            selector    : in std_logic;
            input0      : in std_logic_vector(8 downto 0);
            input1      : in std_logic_vector(8 downto 0);
            output      : out std_logic_vector(8 downto 0)

        );

    end component mux2To1_9bit;

    begin

        mux2To1_9bitTestbench : mux2To1_9bit port map(
            selector => selector,
            input0 => input0,
            input1 => input1,
            output => output
        );

        muxTestbench : process

            begin

                selector <= '0';
                input0 <= "000000000";
                input1 <= "111111111";

                wait for 20 ns;
                
                selector <= '1';
                input0 <= "000000000";
                input1 <= "111111111";

                wait for 20 ns;

                wait;


        end process;


end rtl ; -- rtl;