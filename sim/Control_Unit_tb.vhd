-- 17 March 2021
-- Rafael Almazar

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Control_Unit_tb is
end Control_Unit_tb;

architecture Behavioral of Control_Unit_tb is

    component Control_Unit is
        Port ( input : in STD_LOGIC_VECTOR (15 downto 0);
               clk : in STD_LOGIC;
               j : out STD_LOGIC;
               A : out STD_LOGIC_VECTOR (15 downto 0));
    end component;
    
    signal clk_sig, j_sig : std_logic := '0';
    signal input_sig, A_sig : std_logic_vector(15 downto 0) := x"0000";

begin

    UUT : Control_Unit
    port map (
        input => input_sig,
        clk => clk_sig,
        j => j_sig,
        A => A_sig
    );
    
    process is
    begin
        -- ASM: A = 8
        input_sig <= b"0000_0000_0000_1000";
        --
        clk_sig <= '1';
        wait for 10 ns;
        clk_sig <= '0';
        wait for 10 ns;
        clk_sig <= '1';
        wait for 10 ns;
        clk_sig <= '0';
        wait for 10 ns;
        
        -- ASM: A = A + 1
        input_sig <= b"1110_1101_1110_0000";
        --
        clk_sig <= '1';
        wait for 10 ns;
        clk_sig <= '0';
        wait for 10 ns;
        clk_sig <= '1';
        wait for 10 ns;
        clk_sig <= '0';
        wait for 10 ns;
        clk_sig <= '1';
        wait for 10 ns;
        clk_sig <= '0';
        wait for 10 ns;
        clk_sig <= '1';
        wait for 10 ns;
        clk_sig <= '0';
        wait for 10 ns;
        
    end process;


end Behavioral;
