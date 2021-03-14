-- 14 March 2021
-- Rafael Almazar

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity RAM8 is
    Port ( input : in STD_LOGIC_VECTOR (15 downto 0);
           address : in STD_LOGIC_VECTOR (2 downto 0);
           clk : in STD_LOGIC;
           load : in STD_LOGIC;
           output : out STD_LOGIC_VECTOR (15 downto 0));
end RAM8;

architecture Behavioral of RAM8 is

    component Register16 is
        Port ( input : in STD_LOGIC_VECTOR (15 downto 0);
               load : in STD_LOGIC;
               clk : in STD_LOGIC;
               output : out STD_LOGIC_VECTOR (15 downto 0));
    end component;
    
    signal r7, r6, r5, r4, r3, r2, r1, r0 : std_logic_vector(15 downto 0) := x"0000";
    signal load7, load6, load5, load4, load3, load2, load1, load0 : std_logic;
    signal out7, out6, out5, out4, out3, out2, out1, out0 : std_logic_vector(15 downto 0);

begin

    load7 <= '1' when address = "111" else '0';
    load6 <= '1' when address = "110" else '0';
    load5 <= '1' when address = "101" else '0';
    load4 <= '1' when address = "100" else '0';
    load3 <= '1' when address = "011" else '0';
    load2 <= '1' when address = "010" else '0';
    load1 <= '1' when address = "001" else '0';
    load0 <= '1' when address = "000" else '0';
    
    output <= out7 when address = "111" else
              out6 when address = "110" else
              out5 when address = "101" else
              out4 when address = "100" else
              out3 when address = "011" else
              out2 when address = "010" else
              out1 when address = "001" else
              out0 when address = "000" else
              x"0000";

    Reg7 : Register16
    port map (
        input => input,
        load => load7,
        clk => clk,
        output => out7
    );
    
    Reg6 : Register16
    port map (
        input => input,
        load => load6,
        clk => clk,
        output => out6
    );
    
    Reg5 : Register16
    port map (
        input => input,
        load => load5,
        clk => clk,
        output => out5
    );
    
    Reg4 : Register16
    port map (
        input => input,
        load => load4,
        clk => clk,
        output => out4
    );
    
    Reg3 : Register16
    port map (
        input => input,
        load => load3,
        clk => clk,
        output => out3
    );
    
    Reg2 : Register16
    port map (
        input => input,
        load => load2,
        clk => clk,
        output => out2
    );
    
    Reg1 : Register16
    port map (
        input => input,
        load => load1,
        clk => clk,
        output => out1
    );

    Reg0 : Register16
    port map (
        input => input,
        load => load0,
        clk => clk,
        output => out0
    );

end Behavioral;
