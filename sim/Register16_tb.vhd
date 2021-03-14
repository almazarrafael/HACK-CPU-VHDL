-- 13 March 2021
-- Rafael Almazar

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Register16_tb is
end Register16_tb;

architecture Behavioral of Register16_tb is

    component Register16 is
        Port ( input : in STD_LOGIC_VECTOR (15 downto 0);
               load : in STD_LOGIC;
               clk : in STD_LOGIC;
               output : out STD_LOGIC_VECTOR (15 downto 0));
    end component;

    signal input_sig, output_sig : std_logic_vector(15 downto 0) := x"0000";
    signal load_sig, clk_sig : std_logic := '0';

begin

    UUT : Register16
    port map (
        input => input_sig,
        load => load_sig,
        clk => clk_sig,
        output => output_sig
    );

    process is
    begin
        -- test load = 0
        input_sig <= x"FFFF";
        load_sig <= '0';
        clk_sig <= '1';
        wait for 10 ns;
        clk_sig <= '0';
        wait for 10 ns;
        clk_sig <= '1';
        wait for 10 ns;
        clk_sig <= '0';
        wait for 10 ns;
        
        -- test load = 1
        load_sig <= '1';
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
