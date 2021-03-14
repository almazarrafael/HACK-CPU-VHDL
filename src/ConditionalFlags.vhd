-- 14 March 2021
-- Rafael Almazar

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity ConditionalFlags is
    Port ( lt : in STD_LOGIC; -- less than zero (negative)
           gt : in STD_LOGIC; -- greater than zero (positive)
           eq : in STD_LOGIC; -- equal to zero
           input : in STD_LOGIC_VECTOR (15 downto 0);
           output : out STD_LOGIC);
end ConditionalFlags;

architecture Behavioral of ConditionalFlags is

    signal isNeg, isZero : std_logic;
    signal lessThan, greaterThan, equalZero : std_logic;

begin
    
    isNeg <= input(15); -- sign bit
    isZero <= '1' when input = (input'range => '0') else '0';
    
    lessThan <= lt and isNeg;
    greaterThan <= gt and (not isZero and not isNeg);
    equalZero <= eq and isZero;
    
    output <= lessThan or greaterThan or equalZero;

end Behavioral;
