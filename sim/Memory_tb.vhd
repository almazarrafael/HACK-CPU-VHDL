-- 16 March 2021
-- Rafael Almazar

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Memory_tb is
end Memory_tb;

architecture Behavioral of Memory_tb is

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
    
    signal a_sig, d_sig, b_sig, clk_sig : std_logic := '0';
    signal input_sig, a_out_sig, d_out_sig, b_out_sig : std_logic_vector(15 downto 0) := x"0000";

begin

    UUT : Memory
    port map (
        a => a_sig,
        d => d_sig,
        b => b_sig,
        input => input_sig,
        clk => clk_sig,
        a_out => a_out_sig,
        d_out => d_out_sig,
        b_out => b_out_sig
    );
    
    process is
    begin
        -- test loading a
        a_sig <= '1';
        d_sig <= '0';
        b_sig <= '0';
        input_sig <= x"000F";
        --
        clk_sig <= '1';
        wait for 10 ns;
        clk_sig <= '0';
        wait for 10 ns;
        clk_sig <= '1';
        wait for 10 ns;
        clk_sig <= '0';
        wait for 10 ns;
        
        -- test loading d
        a_sig <= '0';
        d_sig <= '1';
        b_sig <= '0';
        input_sig <= x"00F0";
        --
        clk_sig <= '1';
        wait for 10 ns;
        clk_sig <= '0';
        wait for 10 ns;
        clk_sig <= '1';
        wait for 10 ns;
        clk_sig <= '0';
        wait for 10 ns;
        
        -- test loading b
        a_sig <= '0';
        d_sig <= '0';
        b_sig <= '1';
        input_sig <= x"0F00";
        --
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
