-- 13 March 2021
-- Rafael Almazar

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity PC_tb is
end PC_tb;

architecture Behavioral of PC_tb is
    component PC is
        Port ( input : in STD_LOGIC_VECTOR (15 downto 0);
               clk : in STD_LOGIC;
               inc : in STD_LOGIC;
               load : in STD_LOGIC;
               reset : in STD_LOGIC;
               output : out STD_LOGIC_VECTOR (15 downto 0));
    end component;
    signal input_sig, output_sig : std_logic_vector(15 downto 0) := x"0000";
    signal clk_sig, inc_sig, load_sig, reset_sig : std_logic := '0';

begin
    UUT : PC
    port map (
        input => input_sig,
        clk => clk_sig,
        inc => inc_sig,
        load => load_sig,
        reset => reset_sig,
        output => output_sig
    );
    
    process is
    begin
        -- test increment
        input_sig <= x"0000";
        inc_sig <= '1';
        load_sig <= '0';
        reset_sig <= '0';
        clk_sig <= '1';
        wait for 10 ns;
        clk_sig <= '0';
        wait for 10 ns;
        
        -- test load
        input_sig <= x"FFFF";
        inc_sig <= '0';
        load_sig <= '1';
        reset_sig <= '0';
        clk_sig <= '1';
        wait for 10 ns;
        clk_sig <= '0';
        wait for 10 ns;
        
        -- test reset
        input_sig <= x"FFFF";
        inc_sig <= '0';
        load_sig <= '0';
        reset_sig <= '1';
        clk_sig <= '1';
        wait for 10 ns;
        clk_sig <= '0';
        wait for 10 ns;
        
    end process;


end Behavioral;
