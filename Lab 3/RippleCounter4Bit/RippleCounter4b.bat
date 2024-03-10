cd C:\Users\Arian\OneDrive\Desktop\Progs\VHDL\VHDL-Lab\Lab 3\RippleCounter4Bit
ghdl -s RippleCounter4b.vhd
ghdl -s TFF.vhd
ghdl -s FreqDivider.vhd
ghdl -a FreqDivider.vhd
ghdl -a TFF.vhd
ghdl -a RippleCounter4b.vhd
ghdl -a RippleCounter4b_tb.vhd
ghdl -e RippleCounter4b_tb
ghdl -r RippleCounter4b_tb --vcd=out.vcd --stop-time=500ns
gtkwave out.vcd