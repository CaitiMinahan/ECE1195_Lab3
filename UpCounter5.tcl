#TCL testbench for the up counter (5 bit counter): 

#restart simulation
restart

#generate clk 
add_force clk {0 0ns} {1 5000ps} -repeat_every 10000ps

#test all your inputs reset and enable 
add_force reset 1 
run 10 ns 
#test the output:
if{[get_value -radix unsigned Count] == [expr {0x00000000}]} {
	puts "Correct"
} else { 
	puts "Incorrect"
}

add_force reset 0 
run 10 ns 
add_force enable 1 
run 10 ns 
if{[get_value -radix unsigned Count] == [expr {0x00000001}]} {
	puts "Correct"
} else { 
	puts "Incorrect"
}