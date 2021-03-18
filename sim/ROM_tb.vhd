-- 18 March 2021
-- Rafael Almazar

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity ROM_tb is
end ROM_tb;

architecture Behavioral of ROM_tb is

    component ROM is
        Port ( address : in STD_LOGIC_VECTOR (15 downto 0);
               output : out STD_LOGIC_VECTOR (15 downto 0));
    end component;
    
    signal address_sig, output_sig : std_logic_vector(15 downto 0) := x"0000";

begin

    UUT : ROM
    port map (
        address => address_sig,
        output => output_sig
    );
    
    process is
    begin
        address_sig <= b"0000_0000_0000_0000";
        wait for 10 ns;
        address_sig <= b"0000_0000_0000_0001";
        wait for 10 ns;
        address_sig <= b"0000_0000_0000_0010";
        wait for 10 ns;
        address_sig <= b"0000_0000_0000_0011";
        wait for 10 ns;
    end process;


end Behavioral;
