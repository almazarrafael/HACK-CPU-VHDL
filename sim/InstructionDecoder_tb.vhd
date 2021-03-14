-- 13 March 2021
-- Rafael Almazar

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity InstructionDecoder_tb is
end InstructionDecoder_tb;

architecture Behavioral of InstructionDecoder_tb is

    component InstructionDecoder is
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
    end component;
    
    signal ci_sig, sm_sig, zx_sig, nx_sig, zy_sig, ny_sig, f_sig, no_sig, a_sig, d_sig, b_sig, lt_sig, eq_sig, gt_sig : std_logic := '0';
    signal instruction_sig, w_sig : std_logic_vector(15 downto 0) := x"0000";

begin

    UUT : InstructionDecoder
    port map (
        instruction => instruction_sig,
        ci => ci_sig,
        sm => sm_sig,
        zx => zx_sig,
        nx => nx_sig,
        zy => zy_sig,
        ny => ny_sig,
        f => f_sig,
        no => no_sig,
        a => a_sig,
        d => d_sig,
        b => b_sig,
        lt => lt_sig,
        eq => eq_sig,
        gt => gt_sig,
        w => w_sig
    );
    
    process is
    begin
        -- test bit 15 = 1 -> decode input, zero w
        instruction_sig <= "1000101010101010";
        wait for 10 ns;
        -- test bit 15 = 0 -> zero decode, input goes to w
        instruction_sig <= "0111111111111111";
        wait for 10 ns;
    end process;


end Behavioral;
