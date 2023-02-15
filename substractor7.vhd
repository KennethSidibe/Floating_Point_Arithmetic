library ieee;
use ieee.std_logic_1164.all;

entity substractor7 is
    port (
        inputA : in std_logic_vector(6 downto 0);
        inputB : in std_logic_vector(6 downto 0);
        borrowIn : in std_logic;
        borrowOut : out std_logic;
        difference : out std_logic_vector(6 downto 0)
    );

end substractor7;

architecture rtl of substractor7 is

    signal inputASignal, inputBSignal : std_logic_vector(7 downto 0);
    signal difference8Bit : std_logic_Vector(7 downto 0);

    component fullSubstractor8bit is 

        port (
            inputA : in std_logic_vector(7 downto 0);
            inputB : in std_logic_vector(7 downto 0);
            borrowIn : in std_logic;
            
            borrowOut : out std_logic;
            difference : out std_logic_vector(7 downto 0)
        );

    end component fullSubstractor8bit;

    begin

        inputASignal <=   inputA & '0';
        inputBSignal <=   inputB & '0';
        
        fullSub8: fullSubstractor8bit port map (
            inputA => inputASignal,
            inputB => inputBSignal,
            borrowIn => borrowIn,
            borrowOut => borrowOut,
            difference => difference8Bit
        );

        difference <= difference8Bit(7 downto 1);
    
end rtl;
