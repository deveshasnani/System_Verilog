vlib work 
vlog -writetoplevels questa.tops -timescale 1ns/1ns design.sv pkt_class.sv 
vsim lab3_2;
run 
vsim lab3;
run
exit