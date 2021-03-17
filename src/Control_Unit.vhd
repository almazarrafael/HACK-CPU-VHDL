-- 17 March 2021
-- Rafael Almazar

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Control_Unit is
    Port ( input : in STD_LOGIC_VECTOR (15 downto 0);
           clk : in STD_LOGIC;
           j : out STD_LOGIC;
           A : out STD_LOGIC_VECTOR (15 downto 0));
end Control_Unit;

architecture Behavioral of Control_Unit is

    component Memory is
        Port ( a : in STD_LOGIC;
               d : in STD_LOGIC;
               b : in STD_LOGIC;
               input : in STD_LOGIC_VECTOR (15 downto 0);
               clk : in STD_LOGIC;
               a_out : out STD_LOGIC_VECTOR (15 downto 0);
               d_out : out STD_LOGIC_VECTOR (15 downto 0);
               b_out : out STD_LOGIC_VECTOR (15 downto 0));
    end component;
    
    component ALU is
        Port ( x : in STD_LOGIC_VECTOR (15 downto 0); -- x input
               y : in STD_LOGIC_VECTOR (15 downto 0); -- y input
               zx : in STD_LOGIC; -- zero the x
               nx : in STD_LOGIC; -- invert the x
               zy : in STD_LOGIC; -- zero the y
               ny : in STD_LOGIC; -- invert the y
               f : in STD_LOGIC; -- function code, 1 = add, 0 = and
               no : in STD_LOGIC; -- negate the output
               output : out STD_LOGIC_VECTOR (15 downto 0); -- the output
               zr : out STD_LOGIC; -- zero flag
               ng : out STD_LOGIC); -- negative flag
    end component;
    
    component ConditionalFlags is
        Port ( lt : in STD_LOGIC; -- less than zero (negative)
               gt : in STD_LOGIC; -- greater than zero (positive)
               eq : in STD_LOGIC; -- equal to zero
               input : in STD_LOGIC_VECTOR (15 downto 0);
               output : out STD_LOGIC);
    end component;
    
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
    
    component Mux16 is
        Port ( inputA : in STD_LOGIC_VECTOR (15 downto 0);
               inputB : in STD_LOGIC_VECTOR (15 downto 0);
               sel : in STD_LOGIC;
               output : out STD_LOGIC_VECTOR (15 downto 0));
    end component;
    
    signal ci_top, a_top, d_top, b_top, sm_top : std_logic;
    signal zx_top, nx_top, zy_top, ny_top, f_top, no_top : std_logic; -- OP signals
    signal lt_top, gt_top, eq_top : std_logic; -- conditional flags
    signal alu_out, w_top, muxA_out, muxB_out, memA_out, memD_out, memB_out : std_logic_vector(15 downto 0);

begin

    A <= memA_out;

    MemoryUnit : Memory
    port map (
        a => a_top,
        d => d_top,
        b => b_top,
        input => muxA_out,
        clk => clk,
        a_out => memA_out,
        d_out => memD_out,
        b_out => memB_out
    );
    
    InstructionDecoder_module : InstructionDecoder
    port map (
        instruction => input,
        ci => ci_top,
        sm => sm_top,
        zx => zx_top,
        nx => nx_top,
        zy => zy_top,
        ny => ny_top,
        f => f_top,
        no => no_top,
        a => a_top,
        d => d_top,
        b => b_top,
        lt => lt_top,
        eq => eq_top,
        gt => gt_top,
        w => w_top
    );
    
    ALU_module : ALU
    port map (
        x => memD_out,
        y => muxB_out,
        zx => zx_top,
        nx => nx_top,
        zy => zy_top,
        ny => ny_top,
        f => f_top,
        no => no_top,
        output => alu_out,
        zr => open,
        ng => open
    );
    
    ConditionalFlags_module : ConditionalFlags
    port map (
        lt => lt_top,
        gt => gt_top,
        eq => eq_top,
        input => alu_out,
        output => j
    );
    
    MUXA : Mux16
    port map (
        inputA => w_top,
        inputB => alu_out,
        sel => ci_top,
        output => muxA_out
    );
    
    MUXB : Mux16
    port map (
        inputA => memA_out,
        inputB => memB_out,
        sel => sm_top,
        output => muxB_out
    );


end Behavioral;
