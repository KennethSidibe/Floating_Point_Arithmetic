library ieee;
use ieee.std_logic_1164.all;

entity adderSubstractor9Bittb is
end adderSubstractor9Bittb;

architecture rtl of adderSubstractor9Bittb is

    signal inputA : std_logic_vector(8 downto 0) := "000000001";
    signal inputB : std_logic_vector(8 downto 0) := "000000010";
    signal addBar_Sub : std_logic := '0';
    signal operationResult : std_logic_vector(8 downto 0);

    component adderSubstractor9Bit is
        port (
            inputA : in std_logic_vector(8 downto 0);
            inputB : in std_logic_vector(8 downto 0);
            addBar_Sub : in std_logic;
            operationResult : out std_logic_vector(8 downto 0)
        );
    end component;

begin

    uut: adderSubstractor9Bit port map (
        inputA => inputA,
        inputB => inputB,
        addBar_Sub => addBar_Sub,
        operationResult => operationResult
    );

    stim_proc: process
    begin
        -- Test addition
        addBar_Sub <= '0';
        inputA <= "000010100";
        inputB <= "000001010";
        wait for 10 ns;
        assert operationResult = "000011110" report "Error: addition failed" severity error;

        -- Test subtraction
        addBar_Sub <= '1';
        inputA <= "010011001";
        inputB <= "001100000";
        wait for 10 ns;
        assert operationResult = "000111001" report "Error: subtraction failed" severity error;

        wait;
    end process stim_proc;

end rtl;
