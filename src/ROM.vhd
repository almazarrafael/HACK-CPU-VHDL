-- 18 March 2021
-- Rafael Almazar

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity ROM is
    Port ( address : in STD_LOGIC_VECTOR (15 downto 0);
           output : out STD_LOGIC_VECTOR (15 downto 0));
end ROM;

architecture Behavioral of ROM is

begin

    output <= b"1110_1111_1110_0000" when address = x"0000" -- A = 1
         else b"1110_1101_1110_0000"; -- A = A + 1

end Behavioral;
