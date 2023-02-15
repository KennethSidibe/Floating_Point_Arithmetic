LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

entity fullSubstractor is
    port (
      inputA : in std_logic;
      inputB : in std_logic;
      borrowIn : in std_logic;
      
      borrowOut : out std_logic;
      difference : out std_logic
    );

end fullSubstractor;

architecture rtl of fullSubstractor is 

    signal aXorB : std_logic;

    begin

        aXorB <= inputA xor inputB;

        difference <= aXorB xor (borrowIn);

        borrowOut <= ( not(inputA) and inputB ) or  ( not(aXorB) and borrowIn );


end rtl ; -- rtl