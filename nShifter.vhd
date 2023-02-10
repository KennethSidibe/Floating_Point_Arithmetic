LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY nShifter IS
    PORT(
        n                       : IN      STD_LOGIC_VECTOR(3 downto 0);
        load                    : in      std_logic;
        enable                  : in      std_logic;
        loadInput               : in      std_logic_vector(8 downto 0);
        clock                   : in      std_logic;

        shiftedResult           : OUT     STD_LOGIC_VECTOR(8 downto 0)
    );
END nShifter;

architecture rtl of nShifter is

    component loadCounter is 

        port (
            load            : in std_logic;
            clock           : in std_logic;
            dInput          : in std_logic_vector(3 downto 0);
            enable          : in std_logic;

            zOutput         : out std_logic;
            shiftSignal     : out std_logic;
            qOutput         : out std_logic_vector(3 downto 0)
        );

    end component loadCounter;

    component nineBitRegister is 

        PORT(
            reset : std_logic;
            enable : IN STD_LOGIC;
            clock : IN STD_LOGIC;
            input : IN STD_LOGIC_VECTOR(8 DOWNTO 0);
            output : OUT STD_LOGIC_VECTOR(8 DOWNTO 0)
            );

    end component nineBitRegister;

    component rightShiftUnit is 

        port (
            input : in std_logic_vector(8 downto 0);
            output: out std_logic_vector(8 downto 0)
        );

    end component rightShiftUnit;

    component mux2To1_9bit is 

        port(
            
            selector    : in std_logic;
            input0      : in std_logic_vector(8 downto 0);
            input1      : in std_logic_vector(8 downto 0);
            output      : out std_logic_vector(8 downto 0)

        );

    end component mux2To1_9bit;

    signal shiftSignal, zero : std_logic;
    signal dOutput : std_logic;
    signal counterOut : std_logic_vector(3 downto 0);
    signal registerOut : std_logic_vector(8 downto 0);
    signal zeroConstant : std_logic_vector(8 downto 0);
    signal shiftInput, shiftOutput : std_logic_vector(8 downto 0) := "000000000";
    signal resetVariable : std_logic := '1'; -- when the resets is 0 the register resets to 0 
    signal enableConstant : std_logic := '1'; -- enable needs to be set to 1 for register to work
    signal notShiftSignal : std_logic;
    signal muxDataRegisterInput : std_logic_vector(8 downto 0);
   
    begin 

        zeroConstant <= "000000000";
        notShiftSignal <= not(shiftSignal);

        muxRegisterInput : mux2To1_9bit port map (

            selector => load,
            input0 => shiftOutput,
            input1 => loadInput,
            output => muxDataRegisterInput

        );
        
        counter : loadCounter port map (
            load            => load,
            clock           => clock,
            dInput          => n,
            enable          => enableConstant,

            zOutput         => zero,
            shiftSignal     => shiftSignal,
            qOutput         => counterOut
        );
        
        muxShift : mux2To1_9bit port map(
            selector => shiftSignal,
            input0 => zeroConstant,
            input1 => registerOut,
            output => shiftInput
        );
        
        shifter : rightShiftUnit port map (
            input => shiftInput,
            output => shiftOutput
        );
        
        dataRegister : nineBitRegister port map (
            reset => resetVariable,
            enable => enableConstant,
            clock => clock,
            input => muxDataRegisterInput,
            output => registerOut
        );

        muxOut : mux2To1_9bit port map(
            selector => notShiftSignal,
            input0 => registerOut,
            input1 => zeroConstant,
            output => shiftedResult
        );


end rtl ; -- rtl