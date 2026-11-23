library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std.all;


entity Register_32  is 
    port(
        C: in std_logic; 
        d_in : in std_logic_vector (31 downto 0);
        q_out : out  std_logic_vector (31 downto 0)
    );
end Register_32;

architecture behaviour of Register_32 is

begin
    for i in 0 to 31 generate
        latch_inst : entity work.D_latch
            port map (
                D   => d_in(i),
                C =>C,
                Q   => q_out(i)
            );
            end generate;
end behaviour ; 