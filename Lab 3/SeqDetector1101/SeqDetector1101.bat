cd C:\Users\Arian\OneDrive\Desktop\Progs\VHDL\VHDL-Lab\Lab 3\SeqDetector1101
ghdl -s SeqDetector1101.vhd
ghdl -s FreqDivider.vhd
ghdl -a FreqDivider.vhd
ghdl -a SeqDetector1101.vhd
ghdl -a SeqDetector1101_tb.vhd
ghdl -e SeqDetector1101_tb
ghdl -r SeqDetector1101_tb --vcd=out.vcd --stop-time=500ns
gtkwave out.vcd