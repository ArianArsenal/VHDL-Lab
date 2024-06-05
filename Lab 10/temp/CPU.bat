cd C:\Users\Arian\OneDrive\Desktop\Progs\VHDL\VHDL-Lab\Lab 10
ghdl -s CPU8BIT2.vhd
ghdl -a CPU8BIT2.vhd
ghdl -a CPU8BIT2_tb.vhd
ghdl -e CPU8BIT2_tb
ghdl -r CPU8BIT2_tb --vcd=out.vcd
gtkwave out.vcd

