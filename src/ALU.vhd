-- 13 March 2021
-- Rafael Almazar

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity ALU is
    Port ( x : in STD_LOGIC_VECTOR (15 downto 0); -- x input
           y : in STD_LOGIC_VECTOR (15 downto 0); -- y input
           zx : in STD_LOGIC; -- zero the x
           nx : in STD_LOGIC; -- invert the x
           zy : in STD_LOGIC; -- zero the y
           ny : in STD_LOGIC; -- invert the y
           f : in STD_LOGIC; -- function code, 1 = add, 0 = and
           no : in STD_LOGIC; -- negate the output
           output : out STD_LOGIC_VECTOR (15 downto 0); -- the output
           zr : out STD_LOGIC; -- zero flag
           ng : out STD_LOGIC); -- negative flag
end ALU;

architecture Behavioral of ALU is
    signal x0, y0, x1, y1 : std_logic_vector(15 downto 0);
    signal out1, out2 : std_logic_vector(15 downto 0);
    signal sum : std_logic_vector(15 downto 0);
begin

    x0 <= x"0000" when zx = '1' else
          x;
    y0 <= x"0000" when zy = '1' else
          y;
    x1 <= not x0 when nx = '1' else
          x0;
    y1 <= not y0 when nx = '1' else
          y0;
    out1 <= std_logic_vector(signed(x1) + signed(y1)) when f = '1' else
            x1 and y1;
    out2 <= not out1 when no = '1' else
            out1;
    zr <= '1' when out2 = (out2'range => '0') else '0';
    ng <= out2(15);
    output <= out2;

end Behavioral;
