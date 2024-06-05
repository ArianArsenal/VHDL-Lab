# VHDL-Lab
A repository for VHDL codes for the Computer Architecture Course

🧨How To Run VHDL Codes
1) Install the [GHDL Compiler](https://github.com/ghdl/ghdl/releases)

2) Add Path for GHDL in environment variables (for windows)

3) Install [GTKWave](https://gtkwave.sourceforge.net/) for showing wavelength

4) use the following GHDL commands to synthesize and run your simulation

# GHDL-Commands
use -s for non-testbench files .vhd 
use -a for all .vhd files including 
use -e for testbench file 
use -r for testbench file followed by --vcd=out.vcd

check below for example:

🎇__ checks syntax __
ghdl -s [filename].vhd


🎇__analyzes file__
ghdl -a [filename].vhd


🎆__analyzes TestBench__
ghdl -a [filename_tb].vhd


🎆__evaluates TestBench__
ghdl -e [filename_tb]


🎆__runs TestBench__
ghdl -r [filename_tb] --vcd=out.vcd


🎈__Open vcd file in GTKWAVE__
gtkwave out.vcd



