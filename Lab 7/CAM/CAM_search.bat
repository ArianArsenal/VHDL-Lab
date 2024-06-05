cd C:\Users\Arian\OneDrive\Desktop\Progs\VHDL\VHDL-Lab\Lab 7\CAM
ghdl -s CAM_search.vhd
ghdl -a CAM_search.vhd
ghdl -a CAM_search_tb.vhd
ghdl -e CAM_search_tb
ghdl -r CAM_search_tb --vcd=out.vcd --stop-time=500ns
gtkwave out.vcd
