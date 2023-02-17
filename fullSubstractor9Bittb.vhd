library IEEE;
use IEEE.std_logic_1164.all;

entity fullSubstractor9Bittb is
end fullSubstractor9Bittb;

architecture rtl of fullSubstractor9Bittb is

    component fullSubstractor9Bit is
        port (
            inputA : in std_logic_vector(8 downto 0);
            inputB : in std_logic_vector(8 downto 0);
            borrowIn : in std_logic;
            
            borrowOut : out std_logic;
            difference : out std_logic_vector(8 downto 0)
        );
    end component;

    signal inputA, inputB : std_logic_vector(8 downto 0);
    signal borrowIn : std_logic;
    signal borrowOut : std_logic;
    signal difference : std_logic_vector(8 downto 0);

    begin

        DUT: fullSubstractor9Bit port map (
            inputA => inputA,
            inputB => inputB,
            borrowIn => borrowIn,
            borrowOut => borrowOut,
            difference => difference
        );

        stimulis : process 

            begin

                -- Test case 1: 20 - 10
                inputA <= "000010100";
                inputB <= "000001010";
                borrowIn <= '0';
                wait for 10 ns;
                assert (difference = "000001010") report "Test case 1 failed: Difference not 10" severity error;
                assert (borrowOut = '0') report "Test case 1 failed: BorrowOut not 0" severity error;

                -- Test case 2: 100 - 80
                inputA <= "001100100";
                inputB <= "001010000";
                borrowIn <= '0';
                wait for 10 ns;
                assert (difference = "000010100") report "Test case 2 failed: Difference not 100" severity error;
                assert (borrowOut = '0') report "Test case 2 failed: BorrowOut not 0" severity error;

                -- Test case 3: 6 - 4
                inputA <= "000000110";
                inputB <= "000000100";
                borrowIn <= '0';
                wait for 10 ns;
                assert (difference = "000000010") report "Test case 3 failed: Difference not 2" severity error;
                assert (borrowOut = '0') report "Test case 3 failed: BorrowOut not 0" severity error;

                -- Test case 4: 101 - 11
                inputA <= "000000101";
                inputB <= "000000011";
                borrowIn <= '0';
                wait for 10 ns;
                assert (difference = "000000010") report "Test case 4 failed: Difference not 2" severity error;
                assert (borrowOut = '0') report "Test case 4 failed: BorrowOut not 0" severity error;

                -- Test case 5: 5 - 3
                inputA <= "000000101";
                inputB <= "000000011";
                borrowIn <= '0';
                wait for 10 ns;
                assert (difference = "000000010") report "Test case 5 failed: Difference not 2" severity error;
                assert (borrowOut = '0') report "Test case 5 failed: BorrowOut not 1" severity error;

                -- Test case 6: 111 - 10
                inputA <= "000000111";
                inputB <= "000000010";
                borrowIn <= '0';
                wait for 10 ns;
                assert (difference = "000000101") report "Test case 6 failed: Difference not 5" severity error;
                assert (borrowOut = '0') report "Test case 6 failed: BorrowOut not 0" severity error;

                -- Test case 7: 100 - 011
                inputA <= "000000100";
                inputB <= "000000011";
                borrowIn <= '0';
                wait for 10 ns;
                assert (difference = "000000001") report "Test case 7 failed: Difference not 3" severity error;
                assert (borrowOut = '0') report "Test case 7 failed: BorrowOut not 0" severity error;

                -- Test case 8: 1010 - 011
                inputA <= "000001010";
                inputB <= "000000011";
                borrowIn <= '0';
                wait for 10 ns;
                assert (difference = "000000111") report "Test case 8 failed: Difference not 9" severity error;
                assert (borrowOut = '0') report "Test case 8 failed: BorrowOut not 0" severity error;

                wait;

            end process;

end rtl;
