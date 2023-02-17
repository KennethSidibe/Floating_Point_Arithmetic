LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY twoBitComparatortb IS
END twoBitComparatortb;

ARCHITECTURE rtl OF twoBitComparatortb IS

    COMPONENT twoBitComparator IS
        PORT(
            a  : IN  std_logic_vector(1 downto 0);
            b  : IN  std_logic_vector(1 downto 0);
            isSuperior : OUT std_logic;
            isEqual : OUT std_logic;
            isInferior : OUT std_logic
        );
    END COMPONENT twoBitComparator;

    -- Inputs
    signal a : std_logic_vector(1 downto 0) := (others => '0');
    signal b : std_logic_vector(1 downto 0) := (others => '0');

    -- Outputs
    signal isSuperior : std_logic;
    signal isEqual : std_logic;
    signal isInferior : std_logic;

BEGIN

    -- Instantiate the Unit Under Test (UUT)
    uut: twoBitComparator PORT MAP (
          a => a,
          b => b,
          isSuperior => isSuperior,
          isEqual => isEqual,
          isInferior => isInferior
        );

    -- Stimulus process
    stimulus: process
    begin        
        a <= "01";
        b <= "10";
        wait for 10 ns;

        a <= "11";
        b <= "00";
        wait for 10 ns;

        a <= "11";
        b <= "11";
        wait for 10 ns;

        a <= "00";
        b <= "00";
        wait for 10 ns;

        wait;
    end process;

END;
