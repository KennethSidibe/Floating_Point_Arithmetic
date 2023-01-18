-- This entity is responsible of substracting the exponent to produce the 'n' 
-- number of times the shift operation should be performed

library IEEE;
use IEEE.std_logic_1164.all;

entity exponentSubstractor is
    port (

        exponentA : in std_logic_vector(22 downto 0);
        exponentB : in std_logic_vector(22 downto 0);
        exponentDifference: out std_logic_vector(22 downto 0)
    );
  end exponentSubstractor;
  
  architecture rtl of exponentSubstractor is
  
      signal 
  
  begin
  
  end rtl ; -- rtl