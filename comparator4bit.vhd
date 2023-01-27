LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

entity comparator4bit is

	port(

		x : in std_logic_vector (3 downto 0);
        y: in std_logic_vector (3 downto 0);
        isSuperior : out std_logic;
        isInferior : out std_logic;
        isEqual : out std_logic

	);

end entity comparator4bit;


architecture rtl of comparator4bit is

    signal superiorOr0, superiorOr1, superiorOr2, superiorOr3 : std_logic;
    signal inferiorOr0, inferiorOr1, inferiorOr2, inferiorOr3 : std_logic;
    signal equalOr0, equalOr1, equalOr2, equalOr3 : std_logic;
    

    begin

        superiorOr3 <= x(3) and not y(3);
        superiorOr2 <= x(2) and not y(2) and (x(3) xnor y(3));
        superiorOr1 <= x(1) and not y(1) and (x(3) xnor y(3)) and  (x(2) xnor y(2));
        superiorOr0 <= x(0) and not y(0) and (x(3) xnor y(3)) and  (x(2) xnor y(2)) and (x(1) xnor y(1));


        inferiorOr3 <= not(x(3)) and y(3);
        inferiorOr2 <= not(x(2)) and y(2) and (x(3) xnor y(3));
        inferiorOr1 <= not(x(1)) and y(1) and (x(3) xnor y(3)) and  (x(2) xnor y(2));
        inferiorOr0 <= not(x(0)) and y(0) and (x(3) xnor y(3)) and  (x(2) xnor y(2)) and (x(1) xnor y(1));

        equalOr3 <= x(3) xnor y(3);
        equalOr2 <= x(2) xnor y(2);
        equalOr1 <= x(1) xnor y(1);
        equalOr0 <= x(0) xnor y(0);

        isInferior <= inferiorOr0 or inferiorOr1 or inferiorOr2 or inferiorOr3;
        isEqual <= equalOr3 and equalOr2 and equalOr1 and equalOr0;
        isSuperior <= not(not(superiorOr0 or superiorOr1 or superiorOr2 or superiorOr3));

       

end rtl ; -- rtl