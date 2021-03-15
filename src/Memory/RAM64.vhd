-- 15 March 2021
-- Rafael Almazar

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity RAM64 is
    Port ( input : in STD_LOGIC_VECTOR (15 downto 0);
           address : in STD_LOGIC_VECTOR (5 downto 0);
           clk : in STD_LOGIC;
           load : in STD_LOGIC;
           output : out STD_LOGIC_VECTOR (15 downto 0));
end RAM64;

architecture Behavioral of RAM64 is

    component RAM8 is
        Port ( input : in STD_LOGIC_VECTOR (15 downto 0);
               address : in STD_LOGIC_VECTOR (2 downto 0);
               clk : in STD_LOGIC;
               load : in STD_LOGIC;
               output : out STD_LOGIC_VECTOR (15 downto 0));
    end component;
    
    signal load7, load6, load5, load4, load3, load2, load1, load0 : std_logic;
    signal out7, out6, out5, out4, out3, out2, out1, out0 : std_logic_vector(15 downto 0);

begin

    load7 <= '1' when address(5 downto 3) = "111" else '0';
    load6 <= '1' when address(5 downto 3) = "110" else '0';
    load5 <= '1' when address(5 downto 3) = "101" else '0';
    load4 <= '1' when address(5 downto 3) = "100" else '0';
    load3 <= '1' when address(5 downto 3) = "011" else '0';
    load2 <= '1' when address(5 downto 3) = "010" else '0';
    load1 <= '1' when address(5 downto 3) = "001" else '0';
    load0 <= '1' when address(5 downto 3) = "000" else '0';
    
    output <= out7 when address(5 downto 3) = "111" else
              out6 when address(5 downto 3) = "110" else
              out5 when address(5 downto 3) = "101" else
              out4 when address(5 downto 3) = "100" else
              out3 when address(5 downto 3) = "011" else
              out2 when address(5 downto 3) = "010" else
              out1 when address(5 downto 3) = "001" else
              out0 when address(5 downto 3) = "000" else
              x"0000";

    Ram7 : RAM8
    port map (
        input => input,
        address => address(2 downto 0),
        clk => clk,
        load => load7,
        output => out7
    );
    
    Ram6 : RAM8
    port map (
        input => input,
        address => address(2 downto 0),
        clk => clk,
        load => load6,
        output => out6
    );
    
    Ram5 : RAM8
    port map (
        input => input,
        address => address(2 downto 0),
        clk => clk,
        load => load5,
        output => out5
    );
    
    Ram4 : RAM8
    port map (
        input => input,
        address => address(2 downto 0),
        clk => clk,
        load => load4,
        output => out4
    );
    
    Ram3 : RAM8
    port map (
        input => input,
        address => address(2 downto 0),
        clk => clk,
        load => load3,
        output => out3
    );
    
    Ram2 : RAM8
    port map (
        input => input,
        address => address(2 downto 0),
        clk => clk,
        load => load2,
        output => out2
    );
    
    Ram1 : RAM8
    port map (
        input => input,
        address => address(2 downto 0),
        clk => clk,
        load => load1,
        output => out1
    );
    
    Ram0 : RAM8
    port map (
        input => input,
        address => address(2 downto 0),
        clk => clk,
        load => load0,
        output => out0
    );


end Behavioral;
