cd C:\Users\Arian\OneDrive\Desktop\Progs\VHDL\VHDL-Lab\Lab 09
ghdl -s HalfAdder.vhd
ghdl -s FullAdder.vhd
ghdl -s Divider.vhd
ghdl -s Mux8x1.vhd
ghdl -s Multiply4b.vhd
ghdl -s RippleAdder4b.vhd
ghdl -s ALU.vhd
ghdl -a HalfAdder.vhd
ghdl -a FullAdder.vhd
ghdl -a Divider.vhd
ghdl -a Mux8x1.vhd
ghdl -a Multiply4b.vhd
ghdl -a RippleAdder4b.vhd
ghdl -a ALU.vhd
ghdl -a ALU_tb.vhd
ghdl -e ALU_tb
ghdl -r ALU_tb --vcd=out.vcd
gtkwave out.vcd

