-- 18 March 2021
-- Rafael Almazar

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity ProgramEngine_tb is
end ProgramEngine_tb;

architecture Behavioral of ProgramEngine_tb is

    component ProgramEngine is
        Port ( j : in STD_LOGIC;
               address : in STD_LOGIC_VECTOR (15 downto 0);
               clk : in STD_LOGIC;
               output : out STD_LOGIC_VECTOR (15 downto 0));
    end component;
    
    signal j_sig, clk_sig : std_logic := '0';
    signal address_sig, output_sig : std_logic_vector(15 downto 0) := x"0000";

begin

    UUT : ProgramEngine
    port map (
        j => j_sig,
        address => address_sig,
        clk => clk_sig,
        output => output_sig
    );
    
    process is
    begin
        j_sig <= '0';
        address_sig <= x"0000";
        --
        clk_sig <= '1';
        wait for 10 ns;
        clk_sig <= '0';
        wait for 10 ns;
        --
        clk_sig <= '1';
        wait for 10 ns;
        clk_sig <= '0';
        wait for 10 ns;
        --
        clk_sig <= '1';
        wait for 10 ns;
        clk_sig <= '0';
        wait for 10 ns;
        --
        clk_sig <= '1';
        wait for 10 ns;
        clk_sig <= '0';
        wait for 10 ns;
        --
        clk_sig <= '1';
        wait for 10 ns;
        clk_sig <= '0';
        wait for 10 ns;
        --
        j_sig <= '1';
        --
        clk_sig <= '1';
        wait for 10 ns;
        clk_sig <= '0';
        wait for 10 ns;
    end process;


end Behavioral;
