-- 19 March 2021
-- Rafael Almazar

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Microprocessor_top is
    port (
        clk : in std_logic;
        regA : out std_logic_vector(15 downto 0)
    );
end Microprocessor_top;

architecture Behavioral of Microprocessor_top is

    component ProgramEngine is
        Port ( j : in STD_LOGIC;
               address : in STD_LOGIC_VECTOR (15 downto 0);
               clk : in STD_LOGIC;
               output : out STD_LOGIC_VECTOR (15 downto 0));
    end component;
    
    component Control_Unit is
        Port ( input : in STD_LOGIC_VECTOR (15 downto 0);
               clk : in STD_LOGIC;
               j : out STD_LOGIC;
               A : out STD_LOGIC_VECTOR (15 downto 0));
    end component;
    
    signal j_w : std_logic;
    signal address_w, input_w : std_logic_vector(15 downto 0);

begin

    ProgramEngine_module : ProgramEngine
    port map (
        j => j_w,
        address => address_w,
        clk => clk,
        output => input_w
    );
    
    Control_Unit_module : Control_Unit
    port map (
        input => input_w,
        clk => clk,
        j => j_w,
        A => address_w
    );
    
    regA <= address_w;

end Behavioral;
