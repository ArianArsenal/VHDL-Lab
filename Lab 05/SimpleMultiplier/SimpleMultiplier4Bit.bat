cd C:\Users\Arian\OneDrive\Desktop\Progs\VHDL\VHDL-Lab\Lab 05\SimpleMultiplier
ghdl -s FullAdder.vhd
ghdl -s HalfAdder.vhd
ghdl -s SimpleMultiplier4Bit.vhd
ghdl -a FullAdder.vhd
ghdl -a HalfAdder.vhd
ghdl -a SimpleMultiplier4Bit.vhd
ghdl -a SimpleMultiplier4Bit_tb.vhd
ghdl -e SimpleMultiplier4Bit_tb
ghdl -r SimpleMultiplier4Bit_tb --vcd=out.vcd --stop-time=500ns
gtkwave out.vcd