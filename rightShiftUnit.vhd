
library IEEE;
use IEEE.std_logic_1164.all;

entity rightShiftUnit is
  port (
    input : in std_logic_vector(7 downto 0);

    output: out std_logic_vector(7 downto 0)
  );
end rightShiftUnit;

architecture rtl of rightShiftUnit is

    begin

        output(7) <= '0';
        output(6) <= input(7);
        output(5) <= input(6);
        output(4) <= input(5);
        output(3) <= input(4);
        output(2) <= input(3);
        output(1) <= input(2);
        output(0) <= input(1);
        
end rtl ; -- rtl