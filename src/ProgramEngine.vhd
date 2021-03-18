-- 18 March 2021
-- Rafael Almazar

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity ProgramEngine is
    Port ( j : in STD_LOGIC;
           address : in STD_LOGIC_VECTOR (15 downto 0);
           clk : in STD_LOGIC;
           output : out STD_LOGIC_VECTOR (15 downto 0));
end ProgramEngine;

architecture Behavioral of ProgramEngine is

    component ROM is
        Port ( address : in STD_LOGIC_VECTOR (15 downto 0);
               output : out STD_LOGIC_VECTOR (15 downto 0));
    end component;
    
    component PC is
        Port ( input : in STD_LOGIC_VECTOR (15 downto 0);
               clk : in STD_LOGIC;
               inc : in STD_LOGIC;
               load : in STD_LOGIC;
               reset : in STD_LOGIC;
               output : out STD_LOGIC_VECTOR (15 downto 0));
    end component;
    
    signal counter_out : std_logic_vector(15 downto 0);

begin

    ROM_module : ROM
    port map (
        address => counter_out,
        output => output
    );
    
    PC_module : PC
    port map (
        input => address,
        clk => clk,
        inc => '1',
        load => j,
        reset => '0',
        output => counter_out
    );

end Behavioral;
