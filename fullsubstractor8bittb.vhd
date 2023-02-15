library IEEE;
use IEEE.std_logic_1164.all;

entity fullSubstractor8bittb is
end fullSubstractor8bittb;

architecture rtl of fullSubstractor8bittb is

    component fullSubstractor8bit is
        port (
            inputA : in std_logic_vector(7 downto 0);
            inputB : in std_logic_vector(7 downto 0);
            borrowIn : in std_logic;
            
            borrowOut : out std_logic;
            difference : out std_logic_vector(7 downto 0)
        );
    end component;

    signal inputA, inputB : std_logic_vector(7 downto 0);
    signal borrowIn : std_logic;
    signal borrowOut : std_logic;
    signal difference : std_logic_vector(7 downto 0);

    begin

        DUT: fullSubstractor8bit port map (
            inputA => inputA,
            inputB => inputB,
            borrowIn => borrowIn,
            borrowOut => borrowOut,
            difference => difference
        );

        stimulis : process 

            begin

                -- Test case 1: 20 - 10
                inputA <= "00010100";
                inputB <= "00001010";
                borrowIn <= '0';
                wait for 10 ns;
                assert (difference = "00001010") report "Test case 1 failed: Difference not 10" severity failure;
                assert (borrowOut = '0') report "Test case 1 failed: BorrowOut not 0" severity failure;

                -- Test case 2: 100 - 80
                inputA <= "01100100";
                inputB <= "01010000";
                borrowIn <= '0';
                wait for 10 ns;
                assert (difference = "00010100") report "Test case 2 failed: Difference not 100" severity failure;
                assert (borrowOut = '0') report "Test case 2 failed: BorrowOut not 0" severity failure;

                -- Test case 3: 6 - 4
                inputA <= "00000110";
                inputB <= "00000100";
                borrowIn <= '0';
                wait for 10 ns;
                assert (difference = "00000010") report "Test case 3 failed: Difference not 2" severity failure;
                assert (borrowOut = '0') report "Test case 3 failed: BorrowOut not 0" severity failure;

                -- Test case 4: 101 - 11
                inputA <= "00000101";
                inputB <= "00000011";
                borrowIn <= '0';
                wait for 10 ns;
                assert (difference = "00000010") report "Test case 4 failed: Difference not 2" severity failure;
                assert (borrowOut = '0') report "Test case 4 failed: BorrowOut not 0" severity failure;

                -- Test case 5: 5 - 3
                inputA <= "00000101";
                inputB <= "00000011";
                borrowIn <= '0';
                wait for 10 ns;
                assert (difference = "00000010") report "Test case 5 failed: Difference not 2" severity failure;
                assert (borrowOut = '0') report "Test case 5 failed: BorrowOut not 1" severity failure;

                -- Test case 6: 111 - 10
                inputA <= "00000111";
                inputB <= "00000010";
                borrowIn <= '0';
                wait for 10 ns;
                assert (difference = "00000101") report "Test case 6 failed: Difference not 5" severity failure;
                assert (borrowOut = '0') report "Test case 6 failed: BorrowOut not 0" severity failure;

                -- Test case 7: 100 - 011
                inputA <= "00000100";
                inputB <= "00000011";
                borrowIn <= '0';
                wait for 10 ns;
                assert (difference = "00000001") report "Test case 7 failed: Difference not 3" severity failure;
                assert (borrowOut = '0') report "Test case 7 failed: BorrowOut not 0" severity failure;

                -- Test case 8: 1010 - 011
                inputA <= "00001010";
                inputB <= "00000011";
                borrowIn <= '0';
                wait for 10 ns;
                assert (difference = "00000111") report "Test case 8 failed: Difference not 9" severity failure;
                assert (borrowOut = '0') report "Test case 8 failed: BorrowOut not 0" severity failure;

                wait;

            end process;

end rtl;
