-- 13 March 2021
-- Rafael Almazar

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity InstructionDecoder is
    Port ( instruction : in STD_LOGIC_VECTOR (15 downto 0);
           ci : out STD_LOGIC; -- computation instruction
           sm : out STD_LOGIC; -- source memory
           zx : out STD_LOGIC; -- zero x
           nx : out STD_LOGIC; -- negate x
           zy : out STD_LOGIC; -- zero y
           ny : out STD_LOGIC; -- negate y
           f : out STD_LOGIC; -- function code
           no : out STD_LOGIC; -- negate output
           a : out STD_LOGIC; -- a destination flag
           d : out STD_LOGIC; -- d destination flag
           b : out STD_LOGIC; -- ram (b) destination flag
           lt : out STD_LOGIC; -- less than condition flag
           eq : out STD_LOGIC; -- equal condition flag 
           gt : out STD_LOGIC; -- greater than condition flag
           w : out STD_LOGIC_VECTOR (15 downto 0)); -- data word
end InstructionDecoder;

architecture Behavioral of InstructionDecoder is

    signal muxOut : std_logic_vector(15 downto 0);

begin

    w <= instruction when instruction(15) = '0' else
         x"0000";
         
    muxOut <= x"0000" when instruction(15) = '0' else
              instruction;
    
    ci <= muxOut(15);
    sm <= muxOut(12);
    zx <= muxOut(11);
    nx <= muxOut(10);
    zy <= muxOut(9);
    ny <= muxOut(8);
    f <= muxOut(7);
    no <= muxOut(6);
    a <= ((not muxOut(5)) nand instruction(15));
    d <= muxOut(4);
    b <= muxOut(3);
    lt <= muxOut(2);
    eq <= muxOut(1);
    gt <= muxOut(0);


end Behavioral;
