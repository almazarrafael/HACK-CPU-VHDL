-- 19 March 2021
-- Rafael Almazar

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Microprocessor_top_tb is
end Microprocessor_top_tb;

architecture Behavioral of Microprocessor_top_tb is

    component Microprocessor_top is
        port (
            clk : in std_logic;
            regA : out std_logic_vector(15 downto 0)
        );
    end component;
    
    signal clk_sig : std_logic := '0';
    signal regA_sig : std_logic_vector(15 downto 0) := x"0000";

begin

    UUT : Microprocessor_top
    port map (
        clk => clk_sig,
        regA => regA_sig
    );
    
    process is
    begin
        clk_sig <= '0';
        wait for 10 ns;
        clk_sig <= '1';
        wait for 10 ns;
        --
        clk_sig <= '0';
        wait for 10 ns;
        clk_sig <= '1';
        wait for 10 ns;
        --
        clk_sig <= '0';
        wait for 10 ns;
        clk_sig <= '1';
        wait for 10 ns;
        --
        clk_sig <= '0';
        wait for 10 ns;
        clk_sig <= '1';
        wait for 10 ns;
        --
        clk_sig <= '0';
        wait for 10 ns;
        clk_sig <= '1';
        wait for 10 ns;
        --
        clk_sig <= '0';
        wait for 10 ns;
        clk_sig <= '1';
        wait for 10 ns;
        --
        clk_sig <= '0';
        wait for 10 ns;
        clk_sig <= '1';
        wait for 10 ns;
        --
        clk_sig <= '0';
        wait for 10 ns;
        clk_sig <= '1';
        wait for 10 ns;
        --
        clk_sig <= '0';
        wait for 10 ns;
        clk_sig <= '1';
        wait for 10 ns;
        --
        clk_sig <= '0';
        wait for 10 ns;
        clk_sig <= '1';
        wait for 10 ns;
        --
    end process;


end Behavioral;
