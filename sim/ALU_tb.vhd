-- 13 March 2021
-- Rafael Almazar

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity ALU_tb is
end ALU_tb;

architecture Behavioral of ALU_tb is
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
    signal x_sig, y_sig, output_sig : std_logic_vector(15 downto 0);
    signal zx_sig, nx_sig, zy_sig, ny_sig, f_sig, no_sig, zr_sig, ng_sig : std_logic;
begin

    UUT : ALU
    port map (
        x => x_sig,
        y => y_sig,
        zx => zx_sig,
        nx => nx_sig,
        zy => zy_sig,
        ny => ny_sig,
        f => f_sig,
        no => no_sig,
        output => output_sig,
        zr => zr_sig,
        ng => ng_sig
    );

    process is
    begin
        -- test adding
        x_sig <= x"0001";
        y_sig <= x"0001";
        zx_sig <= '0';
        nx_sig <= '0';
        zy_sig <= '0';
        ny_sig <= '0';
        f_sig <= '1';
        no_sig <= '0';
        wait for 10 ns;
        
        -- test anding
        x_sig <= x"FF00";
        y_sig <= x"F0F0";
        zx_sig <= '0';
        nx_sig <= '0';
        zy_sig <= '0';
        ny_sig <= '0';
        f_sig <= '0';
        no_sig <= '0';
        wait for 10 ns;
        
        -- test input zeroing
        x_sig <= x"FFFF";
        y_sig <= x"FFFF";
        zx_sig <= '1';
        nx_sig <= '0';
        zy_sig <= '1';
        ny_sig <= '0';
        f_sig <= '1';
        no_sig <= '0';
        wait for 10 ns;
        
        -- test input negation
        x_sig <= x"0000";
        y_sig <= x"0000";
        zx_sig <= '0';
        nx_sig <= '1';
        zy_sig <= '0';
        ny_sig <= '1';
        f_sig <= '0';
        no_sig <= '0';
        wait for 10 ns;
        
        -- test output negation
        x_sig <= x"0000";
        y_sig <= x"0000";
        zx_sig <= '0';
        nx_sig <= '1';
        zy_sig <= '0';
        ny_sig <= '1';
        f_sig <= '0';
        no_sig <= '1';
        wait for 10 ns;
        
    end process;

end Behavioral;
