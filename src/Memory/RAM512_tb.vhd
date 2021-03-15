-- 15 March 2021
-- Rafael Almazar

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity RAM512_tb is
end RAM512_tb;

architecture Behavioral of RAM512_tb is

    component RAM512 is
        Port ( input : in STD_LOGIC_VECTOR (15 downto 0);
               address : in STD_LOGIC_VECTOR (8 downto 0);
               clk : in STD_LOGIC;
               load : in STD_LOGIC;
               output : out STD_LOGIC_VECTOR (15 downto 0));
    end component;
    
    signal input_sig, output_sig : std_logic_vector(15 downto 0) := x"0000";
    signal address_sig : std_logic_vector(8 downto 0) := b"000_000_000";
    signal clk_sig, load_sig : std_logic := '0';

begin

    UUT : RAM512
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
        address_sig <= b"000_000_000";
        load_sig <= '1';
        
        clk_sig <= '1';
        wait for 10 ns;
        clk_sig <= '0';
        wait for 10 ns;
        
        address_sig <= b"000_000_001";
        clk_sig <= '1';
        wait for 10 ns;
        clk_sig <= '0';
        wait for 10 ns;
    end process;


end Behavioral;
