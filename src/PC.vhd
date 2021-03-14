-- 13 March 2021
-- Rafael Almazar

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity PC is
    Port ( input : in STD_LOGIC_VECTOR (15 downto 0);
           clk : in STD_LOGIC;
           inc : in STD_LOGIC;
           load : in STD_LOGIC;
           reset : in STD_LOGIC;
           output : out STD_LOGIC_VECTOR (15 downto 0));
end PC;

architecture Behavioral of PC is

    signal output_val : std_logic_vector(15 downto 0) := x"0000";

begin

    clkProc : process (clk) is
    begin
        if (rising_edge(clk)) then
            if (reset = '1') then
                output_val <= x"0000";
            else
                if (load = '1') then
                    output_val <= input;
                else
                    if (inc = '1') then
                        output_val <= std_logic_vector(unsigned(output_val) + 1);
                    else
                        output_val <= output_val;
                    end if;
                end if;
            end if;
        end if;
    end process clkProc;
    
    output <= output_val;

end Behavioral;
