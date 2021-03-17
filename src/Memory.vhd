-- 16 March 2021
-- Rafael Almazar

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Memory is
    Port ( a : in STD_LOGIC;
           d : in STD_LOGIC;
           b : in STD_LOGIC;
           input : in STD_LOGIC_VECTOR (15 downto 0);
           clk : in STD_LOGIC;
           a_out : out STD_LOGIC_VECTOR (15 downto 0);
           d_out : out STD_LOGIC_VECTOR (15 downto 0);
           b_out : out STD_LOGIC_VECTOR (15 downto 0));
end Memory;

architecture Behavioral of Memory is

    component RAM64K is
        Port ( input : in STD_LOGIC_VECTOR (15 downto 0);
               address : in STD_LOGIC_VECTOR (15 downto 0);
               clk : in STD_LOGIC;
               load : in STD_LOGIC;
               output : out STD_LOGIC_VECTOR (15 downto 0));
    end component;

    component Register16 is
        Port ( input : in STD_LOGIC_VECTOR (15 downto 0);
               load : in STD_LOGIC;
               clk : in STD_LOGIC;
               output : out STD_LOGIC_VECTOR (15 downto 0));
    end component;
    
    signal a_out_sig : std_logic_vector(15 downto 0);

begin

    RAM : RAM64K
    port map (
        input => input,
        address => a_out_sig,
        clk => clk,
        load => b,
        output => b_out
    );
    
    RegisterA : Register16
    port map (
        input => input,
        load => a,
        clk => clk,
        output => a_out_sig
    );
    a_out <= a_out_sig;
    
    RegisterD : Register16
    port map (
        input => input,
        load => d,
        clk => clk,
        output => d_out
    );


end Behavioral;
