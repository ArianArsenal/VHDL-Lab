cd C:\Users\Arian\OneDrive\Desktop\Progs\VHDL\VHDL-Lab\Lab 10
ghdl -s CPU8BIT.vhd
ghdl -s RAM.vhd
ghdl -s TopModule.vhd
ghdl -a CPU8BIT.vhd
ghdl -a RAM.vhd
ghdl -a TopModule.vhd
ghdl -a CPU2_TB.vhd
ghdl -e CPU2_TB
ghdl -r CPU2_TB --vcd=out.vcd --stop-time=500ns
gtkwave out.vcd