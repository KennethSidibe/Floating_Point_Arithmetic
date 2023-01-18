library IEEE;
use IEEE.std_logic_1164.all;

entity floatingPointAdder is
  port (
    -- input signal

    signA : in std_logic;
    mantissaA : in std_logic_vector(7 downto 0);
    exponentA : in std_logic_vector(6 downto 0);

    signB : in std_logic;
    mantissaB : in std_logic_vector(7 downto 0);
    exponentB : in std_logic_vector(6 downto 0);

    GClock : in std_logic;
    GReset : in std_logic;

    -- output signal

    signOut : out std_logic;
    mantissaOut: out std_logic_vector(7 downto 0);
    exponentOut: out std_logic_vector(6 downto 0);
    overflow: out std_logic
    );

end floatingPointAdder;

architecture rtl of floatingPointAdder is

    begin

end rtl ; -- rtl