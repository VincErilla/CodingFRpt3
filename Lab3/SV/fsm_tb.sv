`timescale 1ns / 1ps
module stimulus ();

   logic  clk;
   logic  left, right, hazard;
   logic  reset;
   
   logic LC, LB, LA, RA, RB, RC;
   
   integer handle3;
   integer desc3;
   
   // Instantiate DUT
   FSM dut (clk, reset, left, right, hazard, LC, LB, LA, RA, RB, RC);   
   
   // Setup the clock to toggle every 1 time units 
   initial 
     begin	
	clk = 1'b1;
	forever #5 clk = ~clk;
     end

   initial
     begin
	// Gives output file name
	handle3 = $fopen("fsm.out");
	// Tells when to finish simulation
	#500 $finish;		
     end

   always 
     begin
	desc3 = handle3;
	#5 $fdisplay(desc3, "%b %b || %b", 
		     reset, left, right, hazard);
     end   
   
   initial 
     begin      
	#0   reset = 1'b1;
	#41  reset = 1'b0;	
	#0   left = 1'b0;
	#40  left = 1'b1;
	#40  left = 1'b0;

     #0   reset = 1'b1;
	#41  reset = 1'b0;	
	#0   right = 1'b0;
	#40  right = 1'b1;
	#40  right = 1'b0;

     #0   reset = 1'b1;
	#41  reset = 1'b0;	
	#0   hazard = 1'b0;
	#40  hazard = 1'b1;
	#40  hazard = 1'b0;


     end

endmodule // FSM_tb

