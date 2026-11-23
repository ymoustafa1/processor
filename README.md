# CSE221 MIPS Processor

A VHDL project for CSE221 Computer Architecture.

| Folder | Scope |
| --- | --- |
| [r-type-datapath/](r-type-datapath/README.md) | Team ownership and folders for the register file, ALU, instruction fields, and datapath integration |
| [single-cycle-processor/](single-cycle-processor/README.md) | Control and memory integration for R-type instructions, LW, SW, BEQ, and J |

The repository currently contains the R-type field selector and its testbench.

## Run the instruction-fields testbench

From the repository root, with GHDL on your PATH:

```sh
mkdir -p build/r-type
cd build/r-type
ghdl -a --std=08 ../../r-type-datapath/instruction-fields/RTypeFields.vhd ../../r-type-datapath/instruction-fields/tb_RTypeFields.vhd
ghdl -e --std=08 tb_RTypeFields
ghdl -r --std=08 tb_RTypeFields --assert-level=error
```
