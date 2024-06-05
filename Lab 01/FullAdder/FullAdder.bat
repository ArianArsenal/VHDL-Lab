cd C:\Users\Arian\OneDrive\Desktop\Progs\VHDL\VHDL-Lab\Lab 01\FullAdder
ghdl -s FullAdder.vhd
ghdl -s HalfAdder.vhd
ghdl -a HalfAdder.vhd
ghdl -a FullAdder.vhd
ghdl -a FullAdder_tb.vhd
ghdl -e FullAdder_tb
ghdl -r FullAdder_tb --vcd=out.vcd
gtkwave out.vcd