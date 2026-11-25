library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity ALU is
    port (
        data1 : in  STD_LOGIC_VECTOR(31 downto 0);
        data2 : in  STD_LOGIC_VECTOR(31 downto 0);
        aluop : in  STD_LOGIC_VECTOR(3 downto 0);
        dataout : out STD_LOGIC_VECTOR(31 downto 0);
        zflag : out STD_LOGIC
    );
end ALU;

architecture behavioral of ALU is
    signal arith_res : STD_LOGIC_VECTOR(31 downto 0);
    signal result : STD_LOGIC_VECTOR(31 downto 0);
begin

    U_ARITH : entity work.ALU_Arithmetic
        port map (
            data1  => data1,
            data2  => data2,
            aluop  => aluop,
            result => arith_res
        );

    result <= (data1 and data2) when aluop = "0000" else
                    (data1 or  data2) when aluop = "0001" else
                    (data1 nor data2) when aluop = "1100" else
                    arith_res when (aluop = "0010" or aluop = "0110" or aluop = "0111") else
                    (others => '0');

    dataout <= result;
    zflag   <= '1' when result = x"00000000" else '0';

end behavioral;