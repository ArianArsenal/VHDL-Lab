cd C:\Users\Arian\OneDrive\Desktop\Progs\VHDL\VHDL-Lab\Lab 2\Encoder4x2
ghdl -s Encoder4x2.vhd
ghdl -a Encoder4x2.vhd
ghdl -a Encoder4x2_tb.vhd
ghdl -e Encoder4x2_tb
ghdl -r Encoder4x2_tb --vcd=out.vcd
gtkwave out.vcd