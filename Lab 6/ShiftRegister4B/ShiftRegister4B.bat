cd C:\Users\Arian\OneDrive\Desktop\Progs\VHDL\VHDL-Lab\Lab 6\ShiftRegister4B
ghdl -s DFF.vhd
ghdl -s Mux4x1.vhd
ghdl -s PriorityEncoder4x2.vhd
ghdl -s ShiftRegister4B.vhd
ghdl -a DFF.vhd
ghdl -a Mux4x1.vhd
ghdl -a PriorityEncoder4x2.vhd
ghdl -a ShiftRegister4B.vhd
ghdl -a ShiftRegister4B_tb.vhd
ghdl -e ShiftRegister4B_tb
ghdl -r ShiftRegister4B_tb --vcd=out.vcd --stop-time=500ns
gtkwave out.vcd