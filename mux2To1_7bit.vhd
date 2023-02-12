LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

entity mux2To1_7bit is
        port(
        
            selector : in std_logic;
            input0 : in std_logic_vector(6 downto 0);
            input1: in std_logic_vector(6 downto 0);
            output : out std_logic_vector(6 downto 0)
        
        );
end entity mux2To1_7bit;

architecture rtl of mux2To1_7bit is

	begin
	
		output(0) <= (not(selector) and input0(0) ) or ( selector and input1(0));
		output(1) <= (not(selector) and input0(1) ) or ( selector and input1(1));
		output(2) <= (not(selector) and input0(2) ) or ( selector and input1(2));
		output(3) <= (not(selector) and input0(3) ) or ( selector and input1(3));
		output(4) <= (not(selector) and input0(4) ) or ( selector and input1(4));
		output(5) <= (not(selector) and input0(5) ) or ( selector and input1(5));
		output(6) <= (not(selector) and input0(6) ) or ( selector and input1(6));
		
end architecture rtl;