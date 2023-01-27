LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

entity mux2To1 is
        port(
        
            selector : in std_logic;
            input1 : in std_logic;
            input2: in std_logic;
            output : out std_logic
        
        );
end entity mux2To1;

architecture rtl of mux2To1 is

	begin
	
		output <= (not(selector) and input1 ) or ( selector and input2);
		
end architecture rtl;