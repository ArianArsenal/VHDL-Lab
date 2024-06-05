cd C:\Users\Arian\OneDrive\Desktop\Progs\VHDL\VHDL-Lab\Lab 04\RippleAdder4Bit
ghdl -s HalfAdder.vhd
ghdl -s FullAdder.vhd
ghdl -s RippleAdder4Bit.vhd
ghdl -a HalfAdder.vhd
ghdl -a FullAdder.vhd
ghdl -a RippleAdder4Bit.vhd
ghdl -a RippleAdder4Bit_tb.vhd
ghdl -e RippleAdder4Bit_tb
ghdl -r RippleAdder4Bit_tb --vcd=out.vcd --stop-time=500ns
gtkwave out.vcd
