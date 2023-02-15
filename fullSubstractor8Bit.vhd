library ieee;
use ieee.std_logic_1164.all;

entity fullSubstractor8bit is
    port (
        inputA : in std_logic_vector(7 downto 0);
        inputB : in std_logic_vector(7 downto 0);
        borrowIn : in std_logic;
        
        borrowOut : out std_logic;
        difference : out std_logic_vector(7 downto 0)
    );
end fullSubstractor8bit;

architecture rtl of fullSubstractor8bit is

    component fullSubstractor is
        port (
            inputA : in std_logic;
            inputB : in std_logic;
            borrowIn : in std_logic;
            
            borrowOut : out std_logic;
            difference : out std_logic
        );
    end component;
    
    signal borrowOut0, borrowOut1, borrowOut2, borrowOut3, borrowOut4, borrowOut5, borrowOut6 : std_logic;
  
    begin

        sub0: fullSubstractor port map (
            inputA => inputA(0),
            inputB => inputB(0),
            borrowIn => borrowIn,
            borrowOut => borrowOut0,
            difference => difference(0)
        );
        
        sub1: fullSubstractor port map (
            inputA => inputA(1),
            inputB => inputB(1),
            borrowIn => borrowOut0,
            borrowOut => borrowOut1,
            difference => difference(1)
        );

        sub2: fullSubstractor port map (
            inputA => inputA(2),
            inputB => inputB(2),
            borrowIn => borrowOut1,
            borrowOut => borrowOut2,
            difference => difference(2)
        );

        sub3: fullSubstractor port map (
            inputA => inputA(3),
            inputB => inputB(3),
            borrowIn => borrowOut2,
            borrowOut => borrowOut3,
            difference => difference(3)
        );

        sub4: fullSubstractor port map (
            inputA => inputA(4),
            inputB => inputB(4),
            borrowIn => borrowOut3,
            borrowOut => borrowOut4,
            difference => difference(4)
        );

        sub5: fullSubstractor port map (
            inputA => inputA(5),
            inputB => inputB(5),
            borrowIn => borrowOut4,
            borrowOut => borrowOut5,
            difference => difference(5)
        );

        sub6: fullSubstractor port map (
            inputA => inputA(6),
            inputB => inputB(6),
            borrowIn => borrowOut5,
            borrowOut => borrowOut6,
            difference => difference(6)
        );

        sub7: fullSubstractor port map (
            inputA => inputA(7),
            inputB => inputB(7),
            borrowIn => borrowOut6,
            borrowOut => borrowOut,
            difference => difference(7)
        );

end rtl;
