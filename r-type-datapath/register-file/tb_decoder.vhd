library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std.all;

entity tb_decoder is
end entity;

architecture behaviour of tb_decoder is
signal write_sel: STD_LOGIC_VECTOR ( 4 downto 0 );
signal sel : STD_LOGIC_VECTOR (31 downto 0) ;  
signal write_ena : STD_LOGIC;

begin
uut : entity work.decoder port map(write_ena => write_ena,write_sel => write_sel,sel => sel);
stim_proc :  process 
begin

    write_ena<='1'; write_sel<="00001"; wait for 100 ns;
    write_ena<='0'; write_sel<="00011"; wait for 100 ns ;
    write_ena<='1'; write_sel<="00010"; wait for 100 ns ;
    wait;
end process;

end architecture;