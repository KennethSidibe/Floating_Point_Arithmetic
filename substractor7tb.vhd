LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

entity substractor7tb is
end substractor7tb;

architecture rtl of substractor7tb is

    signal inputA, inputB : std_logic_vector(6 downto 0);
    signal difference : std_logic_vector(6 downto 0);
    signal carryOutDifference : std_logic;
    
    component substractor7 is
    
        port (
            inputA : in std_logic_vector(6 downto 0);
            inputB : in std_logic_vector(6 downto 0);
            difference : out std_logic_vector(6 downto 0);
            carryOutDifference : out std_logic
        );
    
    end component substractor7;
    
    begin
    
        DUT : substractor7 port map (
            inputA => inputA,
            inputB => inputB,
            difference => difference,
            carryOutDifference => carryOutDifference
        );
    
        testbench : process
    
            begin
    
                inputA <= "0001010";
                inputB <= "0000101";
    
                wait for 20 ns;
    
                inputA <= "0001010";
                inputB <= "0001010";
    
                wait for 20 ns;
    
                inputA <= "1100100";
                inputB <= "0110010";
    
                wait for 20 ns;
    
                wait;
    
        end process;
    
end rtl;
    