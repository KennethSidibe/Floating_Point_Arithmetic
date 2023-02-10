LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY mantissaMux2_1 IS 
    PORT(
        sel : IN STD_LOGIC;
        input_1 : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
        input_2 : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
        output : OUT STD_LOGIC_VECTOR(7 DOWNTO 0));
END mantissaMux2_1;

ARCHITECTURE RTL OF mantissaMux2_1 IS
SIGNAL in_select : STD_LOGIC_VECTOR(7 DOWNTO 0);

BEGIN 
    in_select <= sel&sel&sel&sel&sel&sel&sel&sel;

    output <= (not(in_select) and input_1) or (in_select and input_2);
END RTL;
