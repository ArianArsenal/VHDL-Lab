cd C:\Users\Arian\OneDrive\Desktop\Progs\VHDL\VHDL-Lab\Lab 4\CarrySelectAdder4Bit
ghdl -s HalfAdder.vhd
ghdl -s FullAdder.vhd
ghdl -s Mux2x1.vhd
ghdl -s CarryLookahead4Bit.vhd
ghdl -s CarrySelectAdder4Bit.vhd
ghdl -a HalfAdder.vhd
ghdl -a FullAdder.vhd
ghdl -a Mux2x1.vhd
ghdl -a CarryLookahead4Bit.vhd
ghdl -a CarrySelectAdder4Bit_tb.vhd
ghdl -e CarrySelectAdder4Bit_tb
ghdl -r CarrySelectAdder4Bit_tb --vcd=out.vcd --stop-time=500ns
gtkwave out.vcd
