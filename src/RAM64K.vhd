-- 16 March 2021
-- Rafael Almazar

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity RAM64K is
    Port ( input : in STD_LOGIC_VECTOR (15 downto 0);
           address : in STD_LOGIC_VECTOR (15 downto 0);
           clk : in STD_LOGIC;
           load : in STD_LOGIC;
           output : out STD_LOGIC_VECTOR (15 downto 0));
end RAM64K;

architecture Behavioral of RAM64K is

    component RAM32K is
        Port ( input : in STD_LOGIC_VECTOR (15 downto 0);
               address : in STD_LOGIC_VECTOR (14 downto 0);
               clk : in STD_LOGIC;
               load : in STD_LOGIC;
               output : out STD_LOGIC_VECTOR (15 downto 0));
    end component;
    
    signal out1, out0 : std_logic_vector(15 downto 0);
    signal sel1, sel0 : std_logic;

begin

    sel1 <= address(15);
    sel0 <= not address(15);
    
    output <= out1 when sel1 = '1' else
              out0 when sel0 = '1' else
              x"0000";

    Ram1 : RAM32K
    port map (
        input => input,
        address => address(14 downto 0),
        clk => clk,
        load => sel1,
        output => out1
    );
    
    Ram0 : RAM32K
    port map (
        input => input,
        address => address(14 downto 0),
        clk => clk,
        load => sel0,
        output => out0
    );

end Behavioral;
