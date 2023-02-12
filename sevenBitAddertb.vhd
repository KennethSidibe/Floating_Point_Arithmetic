LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

entity sevenBitAddertb is
end sevenBitAddertb;

architecture rtl of sevenBitAddertb is

    component sevenBitAdder is

        port (
            inputA : in std_logic_vector(6 downto 0);
            inputB : in std_logic_vector(6 downto 0);
            sum : out std_logic_vector(6 downto 0);
            carryOut : out std_logic
        );
    
    end component sevenBitAdder;
    
    signal inputA, inputB, sum : std_logic_vector(6 downto 0);
    signal carryOut : std_logic;

    begin

        uut: sevenBitAdder PORT MAP (
            inputA => inputA,
            inputB => inputB,
            sum => sum,
            carryOut => carryOut
        );

        stimulis : process

            begin

                -- Test case 1: adding 10 + 10
                inputA <= "0001010";
                inputB <= "0001010";
                wait for 10 ns;
                assert (sum = "0010100") report "Test case 1 failed, 10 + 10 = 20 expected" severity error;

                -- Test case 2: adding 50 + 50
                inputA <= "0110010";
                inputB <= "0110010";
                wait for 10 ns;
                assert (sum = "1100100") report "Test case 2 failed, 50 + 50 = 100 expected" severity error;

                -- Test case 3: adding 1 + 0
                inputA <= "0000001";
                inputB <= "0000000";
                wait for 10 ns;
                assert (sum = "0000001") report "Test case 3 failed, 1 + 0 = 1 expected" severity error;

                wait;

        end process;

end rtl;
