library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std.all;


package RF_Package is

    type mux_input_array is array (0 to 31) of std_logic_vector(31 downto 0);

    component  D_Register_32 is
        port(
            C: in std_logic; 
            D : in std_logic_vector (31 downto 0);
            En: in std_logic;
            Q : out  std_logic_vector (31 downto 0)
        );
        end component;

    component decoder is 
            port(
                write_sel : in STD_LOGIC_VECTOR ( 4 downto 0 );
                write_ena : in std_logic ;
                sel : out STD_LOGIC_VECTOR (31 downto 0) 
            );
    end component;

    component MUX is 
            port(
                read_sel : in STD_LOGIC_VECTOR (4 downto 0);
                inputs : in mux_input_array;
                data : out STD_LOGIC_VECTOR (31 downto 0 )
            );
    end component;

end package;