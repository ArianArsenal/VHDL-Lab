cd C:\Users\Arian\OneDrive\Desktop\Progs\VHDL\VHDL-Lab\Lab 02\Decoder2x4
ghdl -s Decoder2x4.vhd
ghdl -a Decoder2x4.vhd
ghdl -a Decoder2x4_tb.vhd
ghdl -e Decoder2x4_tb
ghdl -r Decoder2x4_tb --vcd=out.vcd
gtkwave out.vcd