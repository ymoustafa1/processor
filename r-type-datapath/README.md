# R-type datapath

- `rtl/RTypeFields.vhd` extracts the two source register addresses and the destination address. It gates register writes during reset.
- `sim/tb_RTypeFields.vhd` checks field extraction and write enable.
- Add the two-read, one-write register file, the 32-bit ALU, the integrated datapath, and their testbenches here.
