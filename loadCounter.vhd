library IEEE;
USE ieee.std_logic_1164.ALL;

entity loadCounter is

    port (
        load : in std_logic;
        clock : in std_logic;
        dInput : in std_logic_vector(3 downto 0);
        enable : in std_logic;

        zOutput : out std_logic;
        qOutput : out std_logic_vector(3 downto 0)
    );
    
end loadCounter;        

architecture rtl of loadCounter is

    signal loadOrDisable, q0XorEnable, q1XorEnable, q2XorEnable, q3XorEnable : std_logic;
    signal q0AndEnable, q1AndEnable, q2AndEnable, q3AndEnable : std_logic;
    signal q0Signal, q1Signal, q2Signal, q3Signal : std_logic;
    signal q0BarSignal, q1BarSignal, q2BarSignal, q3BarSignal : std_logic;
    signal d0Signal, d1Signal, d2Signal, d3Signal : std_logic;

    component mux2To1 is 

        port(
        
            selector : in std_logic;
            input0 : in std_logic;
            input1: in std_logic;
            output : out std_logic

        );

    end component mux2To1;
    
    component dFF_2 is

        PORT(
            i_d		    : IN	STD_LOGIC;
            i_clock		: IN	STD_LOGIC;
            o_q, o_qBar	: OUT	STD_LOGIC
        );

    end component dFF_2;

    begin

        mux0 : mux2To1 port map(
            selector => load,
            input0 => q0XorEnable,
            input1 => dInput(0),
            output => d0Signal
        );

        mux1 : mux2To1 port map(
            selector => load,
            input0 => q1XorEnable,
            input1 => dInput(1),
            output => d1Signal
        );

        mux2 : mux2To1 port map(
            selector => load,
            input0 => q2XorEnable,
            input1 => dInput(2),
            output => d2Signal
        );

        mux3 : mux2To1 port map(
            selector => load,
            input0 => q3XorEnable,
            input1 => dInput(3),
            output => d3Signal
        );


        dFlip0 : dFF_2 port map (
            i_d	=> d0Signal,
            i_clock	=> clock,
            o_q => q0Signal, 
            o_qBar => q0BarSignal
        );

        dFlip1 : dFF_2 port map (
            i_d	=> d1Signal,
            i_clock	=> clock,
            o_q => q1Signal, 
            o_qBar => q1BarSignal
        );

        dFlip2 : dFF_2 port map (
            i_d	=> d2Signal,
            i_clock	=> clock,
            o_q => q2Signal, 
            o_qBar => q2BarSignal
        );
        
        dFlip3 : dFF_2 port map (
            i_d	=> d3Signal,
            i_clock	=> clock,
            o_q => q3Signal, 
            o_qBar => q3BarSignal
        );

        -- QOutput assignment 
        qOutput(0) <= q0Signal;
        qOutput(1) <= q1Signal;
        qOutput(2) <= q2Signal;
        qOutput(3) <= q3Signal;

        -- enable 
        q0XorEnable <= enable xor q0Signal;
        q0AndEnable <= enable and q0Signal;

        q1XorEnable <= q0AndEnable xor q1Signal;
        q1AndEnable <= q0AndEnable and q1Signal;

        q2XorEnable <= q1AndEnable xor q2Signal;
        q2AndEnable <= q1AndEnable and q2Signal;

        q3XorEnable <= q2AndEnable xor q3Signal;
        q3AndEnable <= q2AndEnable and q3Signal;

        zOutput <= q3AndEnable;

end rtl ; -- rtl