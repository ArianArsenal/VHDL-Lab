cd C:\Users\Arian\OneDrive\Desktop\Progs\VHDL\VHDL-Lab\Lab 3\SeqDetector0110_0101
ghdl -s SeqDetector0110_0101.vhd
ghdl -a SeqDetector0110_0101.vhd
ghdl -a SeqDetector0110_0101_tb.vhd
ghdl -e SeqDetector0110_0101_tb
ghdl -r SeqDetector0110_0101_tb --vcd=out.vcd --stop-time=500ns
gtkwave out.vcd