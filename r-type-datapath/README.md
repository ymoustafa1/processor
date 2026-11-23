# R-type datapath

Put each VHDL module and its testbench in the same folder.

| Member | Folder | Files |
| --- | --- | --- |
| Ali | [register-file/](register-file/README.md) | `RegisterFile.vhd`, `tb_RegisterFile.vhd` |
| Malek | [alu-arithmetic/](alu-arithmetic/README.md) | `ALU_Arithmetic.vhd`, `tb_ALU_Arithmetic.vhd` |
| Amira | [alu/](alu/README.md) | `ALU.vhd`, `tb_ALU.vhd` |
| Kenzy | [instruction-fields/](instruction-fields/README.md) | `RTypeFields.vhd`, `tb_RTypeFields.vhd` |
| Youssef | [datapath-integration/](datapath-integration/README.md) | `Datapath.vhd`, `tb_Datapath.vhd` |

Malek hands off the arithmetic block to Amira. Youssef connects Amira’s ALU, Ali’s register file, and Kenzy’s instruction-field block.
