LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

entity nineBitAddertb is
end nineBitAddertb;

architecture rtl of nineBitAddertb is

    component nineBitAdder is

        port (
            inputA : in std_logic_vector(8 downto 0);
            inputB : in std_logic_vector(8 downto 0);
            sum : out std_logic_vector(8 downto 0);
            carryOut : out std_logic
        );
    
    end component nineBitAdder;
    
    signal inputA, inputB, sum : std_logic_vector(8 downto 0);
    signal carryOut : std_logic;

    begin

        uut: nineBitAdder PORT MAP (
            inputA => inputA,
            inputB => inputB,
            sum => sum,
            carryOut => carryOut
        );

        stimulis : process

            begin

                -- Test case 1: adding 10 + 10
                inputA <= "000001010";
                inputB <= "000001010";
                wait for 10 ns;
                assert (sum = "000010100") report "Test case 1 failed, 10 + 10 = 20 expected" severity error;

                -- Test case 2: adding 50 + 50
                inputA <= "000110010";
                inputB <= "000110010";
                wait for 10 ns;
                assert (sum = "001100100") report "Test case 2 failed, 50 + 50 = 100 expected" severity error;

                -- Test case 3: adding 1 + 0
                inputA <= "000000001";
                inputB <= "000000000";
                wait for 10 ns;
                assert (sum = "000000001") report "Test case 3 failed, 1 + 0 = 1 expected" severity error;

                wait;

        end process;

end rtl;
