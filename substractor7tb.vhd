library IEEE;
use IEEE.std_logic_1164.all;

entity substractor7tb is
end substractor7tb;

architecture rtl of substractor7tb is

    component substractor7 is
        port (
            inputA : in std_logic_vector(6 downto 0);
            inputB : in std_logic_vector(6 downto 0);
            borrowIn : in std_logic;
            
            borrowOut : out std_logic;
            difference : out std_logic_vector(6 downto 0)
        );
    end component;
    
    signal inputA, inputB : std_logic_vector(6 downto 0);
    signal borrowIn : std_logic;
    signal borrowOut : std_logic;
    signal difference : std_logic_vector(6 downto 0);
    
    begin
    
        DUT: substractor7 port map (
            inputA => inputA,
            inputB => inputB,
            borrowIn => borrowIn,
            borrowOut => borrowOut,
            difference => difference
        );
    
        stimulis : process 
    
            begin
    
                -- Test case 1: 10 - 4
                inputA <= "0001010";
                inputB <= "0000100";
                borrowIn <= '0';
                wait for 10 ns;
                assert(difference="0000110") report "test failed result should be 6";
    
                -- Test case 2: 40 - 36
                inputA <= "0101000";
                inputB <= "0100100";
                borrowIn <= '0';
                wait for 10 ns;
                assert(difference="0000100") report "test failed result should be 4";

    
                -- Test case 3: 6 - 4
                inputA <= "0000110";
                inputB <= "0000100";
                borrowIn <= '0';
                wait for 10 ns;
    
                -- Test case 4: 101 - 11
                inputA <= "0000101";
                inputB <= "0000011";
                borrowIn <= '0';
                wait for 10 ns;
    
                -- Test case 5: 5 - 3
                inputA <= "0000101";
                inputB <= "0000011";
                borrowIn <= '0';
                wait for 10 ns;
    
                -- Test case 6: 111 - 10
                inputA <= "0000111";
                inputB <= "0000010";
                borrowIn <= '0';
                wait for 10 ns;

                -- Test case 7: 100 - 011
                inputA <= "0000100";
                inputB <= "0000011";
                borrowIn <= '0';
                wait for 10 ns;

                -- Test case 8: 1010 - 011
                inputA <= "0001010";
                inputB <= "0000011";
                borrowIn <= '0';
                wait for 10 ns;

                -- Test case 9: 1111 - 101
                inputA <= "0001111";
                inputB <= "0000101";
                borrowIn <= '0';
                wait for 10 ns;
                assert (difference = "0001010") report "Test case 9 failed: Difference not 10" severity failure;
                assert (borrowOut = '0') report "Test case 9 failed: BorrowOut not 0" severity failure;

                -- Test case 10: 111 - 010
                inputA <= "0000111";
                inputB <= "0000010";
                borrowIn <= '0';
                wait for 10 ns;
                assert (difference = "0000101") report "Test case 10 failed: Difference not 5" severity failure;
                assert (borrowOut = '0') report "Test case 10 failed: BorrowOut not 0" severity failure;

                wait;

                end process;

end rtl;    