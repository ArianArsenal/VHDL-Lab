cd C:\Users\Arian\OneDrive\Desktop\Progs\VHDL\VHDL-Lab\Lab 06\ShiftRegister8B
ghdl -s ShiftRegister8B.vhd
ghdl -a ShiftRegister8B.vhd
ghdl -a ShiftRegister8B_tb.vhd
ghdl -e ShiftRegister8B_tb
ghdl -r ShiftRegister8B_tb --vcd=out.vcd --stop-time=500ns
gtkwave out.vcd