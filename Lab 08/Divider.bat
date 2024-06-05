cd C:\Users\Arian\OneDrive\Desktop\Progs\VHDL\VHDL-Lab\Lab 08
ghdl -s Divider.vhd
ghdl -a Divider.vhd
ghdl -a Divider_tb.vhd
ghdl -e Divider_tb
ghdl -r Divider_tb --vcd=out.vcd 
gtkwave out.vcd
