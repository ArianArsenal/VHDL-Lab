cd C:\Users\Arian\OneDrive\Desktop\Progs\VHDL\VHDL-Lab\Lab 05\BCDAdder
ghdl -s HalfAdder.vhd
ghdl -s FullAdder.vhd
ghdl -s RippleAdder4Bit.vhd
ghdl -s BCDAdder4Bit.vhd
ghdl -a HalfAdder.vhd
ghdl -a FullAdder.vhd
ghdl -a RippleAdder4Bit.vhd
ghdl -a BCDAdder4Bit.vhd
ghdl -a BCDAdder4Bit_tb.vhd
ghdl -e BCDAdder4Bit_tb
ghdl -r BCDAdder4Bit_tb --vcd=out.vcd --stop-time=500ns
gtkwave out.vcd