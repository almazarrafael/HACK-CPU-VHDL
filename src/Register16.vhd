-- 13 March 2021
-- Rafael Almazar

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Register16 is
    Port ( input : in STD_LOGIC_VECTOR (15 downto 0);
           load : in STD_LOGIC;
           clk : in STD_LOGIC;
           output : out STD_LOGIC_VECTOR (15 downto 0));
end Register16;

architecture Behavioral of Register16 is

    signal output_val : std_logic_vector(15 downto 0) := x"0000";

begin

    clkProc : process (clk) is
    begin
        if (rising_edge(clk)) then
            if (load = '1') then
                output_val <= input;
            else
                output_val <= output_val;
            end if;
        end if;
    end process clkProc;
    
    output <= output_val;

end Behavioral;
