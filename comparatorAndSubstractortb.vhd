LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

entity comparatorAndSubstractortb is
end comparatorAndSubstractortb;

architecture rtl of comparatorAndSubstractortb is

    signal exponentA, exponentB : std_logic_vector(6 downto 0);
    signal carryOut : std_logic;
    signal difference : std_logic_vector(6 downto 0);

    component comparatorAndSubstractor is
        port (
            exponentA : in std_logic_vector(6 downto 0);
            exponentB : in std_logic_vector(6 downto 0);
            carryOut : out std_logic;
            difference : out std_logic_vector(6 downto 0)
        );
    end component comparatorAndSubstractor;

    begin 

        DUT : comparatorAndSubstractor port map (
            exponentA => exponentA,
            exponentB => exponentB,
            carryOut => carryOut,
            difference => difference
        );
        
        -- Test Case 1: exponentA = 6 decimal, exponentB = 4 decimal
        process is

        begin
            exponentA <= "0000110";
            exponentB <= "0000100";
            wait for 10 ns;
            assert (difference = "0000010") report "Error: difference should be 2";
            assert (carryOut = '0') report "Error: carryOut should be 0";
            wait;
        end process;

end rtl; 
    
