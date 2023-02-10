LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY nShifter IS
    PORT(
        n                       : IN      STD_LOGIC_VECTOR(7 downto 0);
        shiftedOutput           : OUT     STD_LOGIC_VECTOR(7 downto 0);
    );
END nShifter;

architecture rlt of nShifter is

    component loadCounter is 

        port (
            load : in std_logic;
            clock : in std_logic;
            dInput : in std_logic_vector(3 downto 0);
            enable : in std_logic;

            zOutput : out std_logic;
            qOutput : out std_logic_vector(3 downto 0)
        );

    end component loadCounter;

    
    signal 

end rlt ; -- rlt