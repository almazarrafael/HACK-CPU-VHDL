-- 13 March 2021
-- Rafael Almazar

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Mux16_tb is
end Mux16_tb;

architecture Behavioral of Mux16_tb is
    component Mux16 is
        Port ( inputA : in STD_LOGIC_VECTOR (15 downto 0);
               inputB : in STD_LOGIC_VECTOR (15 downto 0);
               sel : in STD_LOGIC;
               output : out STD_LOGIC_VECTOR (15 downto 0));
    end component;
    
    signal inputA_sig, inputB_sig, output_sig : std_logic_vector(15 downto 0) := x"0000";
    signal sel_sig : std_logic := '0';

begin
    UUT : Mux16
    port map (
        inputA => inputA_sig,
        inputB => inputB_sig,
        sel => sel_sig,
        output => output_sig
    );
    
    process is
    begin
        inputA_sig <= x"FF00";
        inputB_sig <= x"00FF";
        sel_sig <= '0'; -- A
        wait for 10 ns;
        sel_sig <= '1'; -- B
        wait for 10 ns;
    end process;


end Behavioral;
