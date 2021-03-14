-- 13 March 2021
-- Rafael Almazar

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Mux16 is
    Port ( inputA : in STD_LOGIC_VECTOR (15 downto 0);
           inputB : in STD_LOGIC_VECTOR (15 downto 0);
           sel : in STD_LOGIC;
           output : out STD_LOGIC_VECTOR (15 downto 0));
end Mux16;

architecture Behavioral of Mux16 is

begin

    output <= inputA when sel = '0' else
              inputB when sel = '1' else
              x"0000";

end Behavioral;
