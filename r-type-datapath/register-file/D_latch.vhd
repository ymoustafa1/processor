library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std.all;


entity D_latch is
    port (
        C : in std_logic;
        D : in std_logic;
        Q: out STD_LOGIC 
    );
end entity;

architecture behaviour of D_latch is

begin

    process(C)
    begin
        if C ='1'  then 
            Q<=D; 
        end if;
    end process;

end behaviour;