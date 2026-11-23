# CSE221 MIPS Datapath

A VHDL project for CSE221 Computer Architecture.

| Folder | Scope |
| --- | --- |
| [r-type-datapath](r-type-datapath/) | Register file, ALU, and datapath for AND, OR, ADD, SUB, SLT, and NOR |
| [single-cycle-processor](single-cycle-processor/) | Control and memory integration for R-type instructions, LW, SW, BEQ, and J |

The repository currently contains the R-type field selector and its testbench.

## Run the existing testbench

From the repository root, with GHDL on your PATH:

```sh
mkdir -p build/r-type
cd build/r-type
ghdl -a --std=08 ../../r-type-datapath/rtl/RTypeFields.vhd ../../r-type-datapath/sim/tb_RTypeFields.vhd
ghdl -e --std=08 tb_RTypeFields
ghdl -r --std=08 tb_RTypeFields --assert-level=error
```
