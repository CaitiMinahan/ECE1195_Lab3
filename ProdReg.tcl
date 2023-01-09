#TCL testbench for the Product Register: 

#restart simulation
restart

#initialize inputs: 
add_force D -radix hex FFFFFFFFFFFFFFFF

#generate clk 
add_force clk {0 0ns} {1 5000ps} -repeat_every 10000ps

#create tests for reset and enable/load signals: 
add_force rst 1 
run 10 ns
add_force rst 0 
run 10 ns 
add_force en 1 
run 10 ns 

#test the output:
if{[get_value -radix unsigned Q] == [expr {0xFFFFFFFFFFFFFFFF}]} {
	puts "Correct"
} else { 
	puts "Incorrect"
}
