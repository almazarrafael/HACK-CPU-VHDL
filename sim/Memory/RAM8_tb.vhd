-- 14 March 2021
-- Rafael Almazar

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity RAM8_tb is
end RAM8_tb;

architecture Behavioral of RAM8_tb is

    component RAM8 is
        Port ( input : in STD_LOGIC_VECTOR (15 downto 0);
               address : in STD_LOGIC_VECTOR (2 downto 0);
               clk : in STD_LOGIC;
               load : in STD_LOGIC;
               output : out STD_LOGIC_VECTOR (15 downto 0));
    end component;
    
    signal input_sig, output_sig : std_logic_vector(15 downto 0) := x"0000";
    signal address_sig : std_logic_vector(2 downto 0) := "000";
    signal clk_sig, load_sig : std_logic := '0';

begin

    UUT : RAM8
    port map (
        input => input_sig,
        address => address_sig,
        clk => clk_sig,
        load => load_sig,
        output => output_sig
    );
    
    process is
    begin
        -- test load
        input_sig <= x"F0F0";
        address_sig <= "000";
        load_sig <= '1';
        
        clk_sig <= '1';
        wait for 10 ns;
        clk_sig <= '0';
        wait for 10 ns;
        
        address_sig <= "001";
        clk_sig <= '1';
        wait for 10 ns;
        clk_sig <= '0';
        wait for 10 ns;
        
    end process;


end Behavioral;
