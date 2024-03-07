cd C:\Users\Arian\OneDrive\Desktop\Progs\VHDL\VHDL-Lab\Lab 2\Mux4x1
ghdl -s Mux4x1.vhd
ghdl -a Mux4x1.vhd
ghdl -a Mux4x1_tb.vhd
ghdl -e Mux4x1_tb
ghdl -r Mux4x1_tb --vcd=out.vcd
gtkwave out.vcd