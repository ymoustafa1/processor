library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Datapath is
    port (
        clk, reset,regwrite   : in STD_LOGIC;
        instr        : in STD_LOGIC_VECTOR(31 downto 0);
        aluoperation : in STD_LOGIC_VECTOR(3 downto 0);
        zero         : out STD_LOGIC;
        aluout       : buffer STD_LOGIC_VECTOR(31 downto 0)
    );
end Datapath;

architecture Behavioral of Datapath is

    signal rs_wire : std_logic_vector(4 downto 0);
    signal rt_wire : std_logic_vector(4 downto 0);
    signal rd_wire : std_logic_vector(4 downto 0);
    signal enable_wire : std_logic;
    signal data1_wire : std_logic_vector(31 downto 0);
    signal data2_wire : std_logic_vector(31 downto 0);

begin

    Fields : entity work.RTypeFields
        port map (
            instr => instr,
            regwrite => regwrite,
            reset => reset,
            read_sel1 => rs_wire,
            read_sel2 => rt_wire,
            write_sel => rd_wire,
            write_ena => enable_wire
        );
        
    RegFile : entity work.register_file_BB
        port map (
            clk => clk,
            read_sel1 => rs_wire,
            read_sel2 => rt_wire,
            write_sel => rd_wire,
            write_ena => enable_wire,
            write_data => aluout,
            data1 => data1_wire,
            data2 => data2_wire
        );

    ALU : entity work.ALU
        port map (
            data1 => data1_wire,
            data2 => data2_wire,
            aluop => aluoperation,
            dataout => aluout,
            zflag => zero
        );
end Behavioral;