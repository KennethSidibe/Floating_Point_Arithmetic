-- DESCRIPTION
-- entity responsible for shifting the mantissa the right amount of times

library IEEE;
use IEEE.std_logic_1164.all;

entity mantissaShiftRegister is
  port (
    nCounter : in std_logic_vector(22 downto 0);
    mantissaIn : in std_logic_vector(22 downto 0);

    mantissaOut: out std_logic_vector(22 downto 0)

  );
end mantissaShiftRegister;

architecture rtl of mantissaShiftRegister is

    signal 

begin

end rtl ; -- rtl