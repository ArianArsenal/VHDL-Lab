cd C:\Users\Arian\OneDrive\Desktop\Progs\VHDL\VHDL-Lab\Lab 01\OR
ghdl -s OR_4Bit.vhd
ghdl -s OR_2Bit.vhd
ghdl -a OR_2Bit.vhd
ghdl -a OR_4Bit.vhd
ghdl -a OR_4Bit_tb.vhd
ghdl -e OR_4Bit_tb
ghdl -r OR_4Bit_tb --vcd=out.vcd
gtkwave out.vcd