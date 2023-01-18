-- This entity is responsible of producing the sum mantissa for the result
-- this entity must be 24 bits

library IEEE;
use IEEE.std_logic_1164.all;

entity mantissaAdder is
    port (
      mantissaA : in std_logic_vector(22 downto 0);
      mantissaB : in std_logic_vector(22 downto 0);
  
      mantissaSum: out std_logic_vector(22 downto 0)
  
    );
  end mantissaAdder;
  
  architecture rtl of mantissaAdder is
  
      signal 
  
  begin
  
  end rtl ; -- rtl