cd C:\Users\Arian\OneDrive\Desktop\Progs\VHDL\VHDL-Lab\Lab 7\ROM
ghdl -s ROM.vhd
ghdl -a ROM.vhd
ghdl -a ROM_tb.vhd
ghdl -e ROM_tb
ghdl -r ROM_tb --vcd=out.vcd --stop-time=500ns
gtkwave out.vcd