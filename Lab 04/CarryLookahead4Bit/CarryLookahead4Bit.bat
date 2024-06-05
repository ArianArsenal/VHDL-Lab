cd C:\Users\Arian\OneDrive\Desktop\Progs\VHDL\VHDL-Lab\Lab 04\CarryLookahead4Bit
ghdl -s HalfAdder.vhd
ghdl -s FullAdder.vhd
ghdl -s CarryLookahead4Bit.vhd
ghdl -a HalfAdder.vhd
ghdl -a FullAdder.vhd
ghdl -a CarryLookahead4Bit.vhd
ghdl -a CarryLookahead4Bit_tb.vhd
ghdl -e CarryLookahead4Bit_tb
ghdl -r CarryLookahead4Bit_tb --vcd=out.vcd --stop-time=500ns
gtkwave out.vcd
