cd C:\Users\Arian\OneDrive\Desktop\Progs\VHDL\VHDL-Lab\Lab 7\DUAL RAM
ghdl -s RAM_Dual.vhd
ghdl -a RAM_Dual.vhd
ghdl -a RAM_Dual_tb.vhd
ghdl -e RAM_Dual_tb
ghdl -r RAM_Dual_tb --vcd=out.vcd --stop-time=500ns
gtkwave out.vcd