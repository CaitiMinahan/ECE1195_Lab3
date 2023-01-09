#TCL testbench for the MultTop: 

#restart simulation
restart

#random testing: 
#give A and B random 32-bit values 
add_force A -radix hex FFFFFFFF
add_force B -radix hex FFFFFFFF 

#generate clk 
add_force clk {0 0ns} {1 5000ps} -repeat_every 10000ps

#edge cases:
#give the reset signal  
add_force rst 1 
run 10 ns 
add_force rst 0 
run 10 ns 

#poll for done signal 
while {[get_value -radix bin Done] == 0} {
	#continue running until done = 1 (busy wait)
	run 10 ns
}

#test for the correct output 
if {[get_value -radix unsigned R] == [expr {0xFFFFFFFF * 0xFFFFFFFF}]} {
	puts "Correct"
} else {
	puts "Incorrect"
}
 
 