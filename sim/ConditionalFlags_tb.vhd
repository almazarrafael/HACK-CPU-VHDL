-- 14 March 2021
-- Rafael Almazar

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity ConditionalFlags_tb is
end ConditionalFlags_tb;

architecture Behavioral of ConditionalFlags_tb is

    component ConditionalFlags is
        Port ( lt : in STD_LOGIC; -- less than zero (negative)
               gt : in STD_LOGIC; -- greater than zero (positive)
               eq : in STD_LOGIC; -- equal to zero
               input : in STD_LOGIC_VECTOR (15 downto 0);
               output : out STD_LOGIC);
    end component;
    
    signal lt_sig, gt_sig, eq_sig, output_sig : std_logic := '0';
    signal input_sig : std_logic_vector(15 downto 0) := x"0000";

begin

    UUT : ConditionalFlags
    port map (
        lt => lt_sig,
        gt => gt_sig,
        eq => eq_sig,
        input => input_sig,
        output => output_sig
    );

    process is
    begin
        -- test less than zero
        lt_sig <= '1';
        gt_sig <= '0';
        eq_sig <= '0';
        input_sig <= x"FFFF";
        wait for 10 ns;
        
        lt_sig <= '0';
        gt_sig <= '1';
        eq_sig <= '1';
        input_sig <= x"FFFF";
        wait for 10 ns;
        
        -- test greater than zero
        lt_sig <= '0';
        gt_sig <= '1';
        eq_sig <= '0';
        input_sig <= x"0FFF";
        wait for 10 ns;
        
        lt_sig <= '1';
        gt_sig <= '0';
        eq_sig <= '1';
        input_sig <= x"0FFF";
        wait for 10 ns;
        
        -- test equal to zero
        lt_sig <= '0';
        gt_sig <= '0';
        eq_sig <= '1';
        input_sig <= x"0000";
        wait for 10 ns;
        
        lt_sig <= '1';
        gt_sig <= '1';
        eq_sig <= '0';
        input_sig <= x"0000";
        wait for 10 ns;
        
        
    end process;


end Behavioral;
