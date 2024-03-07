cd C:\Users\Arian\OneDrive\Desktop\Progs\VHDL\VHDL-Lab\Lab 2\Comparator4bit
ghdl -s Comparator4bit.vhd
ghdl -s Comparator1bit.vhd
ghdl -a Comparator1bit.vhd
ghdl -a Comparator4bit.vhd
ghdl -a Comparator4bit_tb.vhd
ghdl -e Comparator4bit_tb
ghdl -r Comparator4bit_tb --vcd=out.vcd
gtkwave out.vcd

