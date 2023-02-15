library IEEE;
use IEEE.std_logic_1164.all;

entity fullSubstractortb is
end fullSubstractortb;

architecture rtl of fullSubstractortb is

    component fullSubstractor is
        port (
            inputA : in std_logic;
            inputB : in std_logic;
            borrowIn : in std_logic;
            
            borrowOut : out std_logic;
            difference : out std_logic
        );
    end component;

    signal inputA, inputB, borrowIn : std_logic := '0';
    signal borrowOut, difference : std_logic;

    begin

        DUT: fullSubstractor port map (
            inputA => inputA,
            inputB => inputB,
            borrowIn => borrowIn,
            borrowOut => borrowOut,
            difference => difference
        );

        stimulis : process 

            begin

                -- Test case 1
                inputA <= '0';
                inputB <= '0';
                borrowIn <= '0';
                wait for 10 ns;
                assert (difference = '0') report "Test case 1 failed: Difference not 0" severity failure;
                assert (borrowOut = '0') report "Test case 1 failed: BorrowOut not 0" severity failure;

                -- Test case 2
                inputA <= '0';
                inputB <= '0';
                borrowIn <= '1';
                wait for 10 ns;
                assert (difference = '1') report "Test case 2 failed: Difference not 1" severity failure;
                assert (borrowOut = '1') report "Test case 2 failed: BorrowOut not 1" severity failure;

                -- Test case 3
                inputA <= '0';
                inputB <= '1';
                borrowIn <= '0';
                wait for 10 ns;
                assert (difference = '1') report "Test case 3 failed: Difference not 1" severity failure;
                assert (borrowOut = '1') report "Test case 3 failed: BorrowOut not 0" severity failure;

                -- Test case 4
                inputA <= '0';
                inputB <= '1';
                borrowIn <= '1';
                wait for 10 ns;
                assert (difference = '0') report "Test case 4 failed: Difference not 0" severity failure;
                assert (borrowOut = '1') report "Test case 4 failed: BorrowOut not 0" severity failure;

                -- Test case 5
                inputA <= '1';
                inputB <= '0';
                borrowIn <= '0';
                wait for 10 ns;
                assert (difference = '1') report "Test case 5 failed: Difference not 1" severity failure;
                assert (borrowOut = '0') report "Test case 5 failed: BorrowOut not 0" severity failure;

                -- Test case 6
                inputA <= '1';
                inputB <= '0';
                borrowIn <= '1';
                wait for 10 ns;
                assert (difference = '0') report "Test case 6 failed: Difference" severity failure;
                assert (borrowOut = '0') report "Test case 6 failed: BorrowOut not 1" severity failure;

                --test case 7
                inputA <= '1';
                inputB <= '1';
                borrowIn <= '0';
                wait for 10 ns;
                assert (difference = '0') report "Test case 7 failed: Difference not 0" severity failure;
                assert (borrowOut = '0') report "Test case 7 failed: BorrowOut not 0" severity failure;

                --test case 8
                inputA <= '1';
                inputB <= '1';
                borrowIn <= '1';
                wait for 10 ns;
                assert (difference = '1') report "Test case 8 failed: Difference not 1" severity failure;
                assert (borrowOut = '1') report "Test case 8 failed: BorrowOut not 1" severity failure;

                wait;

            end process;

end rtl;