cd C:\Users\Arian\OneDrive\Desktop\Progs\VHDL\VHDL-Lab\Lab 07\RAM
ghdl -s RAM.vhd
ghdl -a RAM.vhd
ghdl -a RAM_tb.vhd
ghdl -e RAM_tb
ghdl -r RAM_tb --vcd=out.vcd --stop-time=500ns
gtkwave out.vcd
