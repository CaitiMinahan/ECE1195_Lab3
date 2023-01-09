#TCL testbench for the right shift (32 bit shift register): 

#restart simulation
restart

#initialize inputs: 
add_force D -radix hex ABCDEFAB

#generate clk 
add_force clk {0 0ns} {1 5000ps} -repeat_every 10000ps

#test the load, shift, and reset signals:
add_force reset 1 
run 10 ns 
#test the output:
if{[get_value -radix unsigned Q] == [expr {0x00000000}]} {
	puts "Correct"
} else { 
	puts "Incorrect"
}

add_force reset 0 
run 10 ns 
 
add_force Load 1 
run 10 ns 
if{[get_value -radix unsigned Q] == [expr {0xABCDEFAB}]} {
	puts "Correct"
} else { 
	puts "Incorrect"
}

add_force Load 0 
run 10 ns 
add_force Sin 1 
run 10 ns
if{[get_value -radix unsigned Q] == [expr {0x55E6F7D5}]} {
	puts "Correct"
} else { 
	puts "Incorrect"
}
 
