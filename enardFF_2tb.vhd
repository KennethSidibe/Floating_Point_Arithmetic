library ieee;
use ieee.std_logic_1164.all;

entity enARdFF_2tb is
end enARdFF_2tb;

architecture rtl of enARdFF_2tb is
    component enARdFF_2
        port(
            i_resetBar : in std_logic;
            i_d        : in std_logic;
            i_enable   : in std_logic;
            i_clock    : in std_logic;
            o_q        : out std_logic;
            o_qBar     : out std_logic
        );
    end component;

    -- resetBar resets when '0' 
    -- enable needs to be set to 1 to make the flipflop works

    signal i_resetBar : std_logic := '1';
    signal i_d        : std_logic := '0';
    signal i_enable   : std_logic := '0';
    signal i_clock    : std_logic := '0';
    signal o_q        : std_logic;
    signal T : time := 20 ns;
    signal o_qBar     : std_logic;

begin
    -- Instantiate the design under test
    dut : enARdFF_2
        port map(
            i_resetBar => i_resetBar,
            i_d        => i_d,
            i_enable   => i_enable,
            i_clock    => i_clock,
            o_q        => o_q,
            o_qBar     => o_qBar
        );

    clockPro : process

        begin

            i_clock <= '0';
            wait for T/2;
            i_clock <= '1';
            wait for T/2;

    end process;

    -- Testbench stimulus
    stimulis : process

        begin

            wait for 100 ns;

            i_enable <= '1';
            i_d <= '1';

            wait for 100 ns;

            i_enable <= '1';
            i_d <= '0';

            wait for 100 ns;

            i_enable <= '1';
            i_resetBar <= '0';
            i_d <= '1';
            
            wait for 100 ns;

            wait;


    end process;

end rtl;