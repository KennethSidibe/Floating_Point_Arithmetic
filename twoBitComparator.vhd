library IEEE;
use IEEE.std_logic_1164.all;

-- Define the entity for the 2-bit comparator
entity twoBitComparator is
    port (
        a : in std_logic_vector(1 downto 0);
        b : in std_logic_vector(1 downto 0);
        isInferior : out std_logic; -- '1' if a < b
        isEqual : out std_logic; -- '1' if a = b
        isSuperior : out std_logic  -- '1' if a > b
    );
end entity twoBitComparator;

-- Define the architecture for the 2-bit comparator
architecture rtl of twoBitComparator is

    signal isInferiorSignal, isSuperiorSignal, isEqualSignal : std_logic;

begin

    -- Instantiate the XOR gates for the 2-bit comparator
    isInferiorSignal <= ( (   not(a(1)) and b(1)    )
                        or (   ( a(1) and b(1)   ) and (   not(a(0)) and b(0)  ) )
                        );
    isSuperiorSignal <= ( (   a(1) and not(b(1))    )
                        or (   ( a(1) and b(1)   ) and (   not(a(0)) and not(b(0))  ) )
                        );
    isEqualSignal <= ( a(1) and b(1) )  and (  a(0) and b(0)  );

    isInferior <= IsInferiorSignal;
    isSuperior <= isSuperiorSignal;
    isEqual <= isEqualSignal;


end architecture rtl;
