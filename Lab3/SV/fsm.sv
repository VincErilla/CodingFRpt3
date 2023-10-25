module FSM (clk, reset, left, right, LC, LB, LA, RC, RB, RA);

   input logic  clk;
   input logic  reset;
   input logic 	left, right;
   
   output logic [2:0] LC, LB, LA, RC, RB, RA;


   typedef enum 	logic [2:0] {S0, S1, S2, S3, S4, S5, S6} statetype;
   statetype state, nextstate;
   
   
   
   // state register
   always_ff @(posedge clk, posedge reset)
     if (reset) state <= S0;
     else 
     
   
   // next state logic
   always_comb
     case (state)
       S0: begin
	  LC <= 1'b0;	
    LB <= 1'b0;
    LA <= 1'b0;
    RA <= 1'b0;
    RB <= 1'b0;
    RC <= 1'b0;  
	  if (reset) nextstate <= S0;
	  else if (left)   nextstate <= S1;
    else nextstate <= S4;
       end
       S1: begin
	  LC <= 1'b0;	
    LB <= 1'b0;
    LA <= 1'b1;
    RA <= 1'b0;
    RB <= 1'b0;
    RC <= 1'b0;	  	  
	  if (left) nextstate <= S2;
    else if (right) nextstate <= S4;
	  else   nextstate <= S0;
       end
       S2: begin
	  LC <= 1'b0;	
    LB <= 1'b1;
    LA <= 1'b1;
    RA <= 1'b0;
    RB <= 1'b0;
    RC <= 1'b0;	  	  
	  if (left) nextstate <= S3;
    else if (right) nextstate <= S4;
	  else   nextstate <= S0;
       end
       S3: begin
	  LC <= 1'b1;	
    LB <= 1'b1;
    LA <= 1'b1;
    RA <= 1'b0;
    RB <= 1'b0;
    RC <= 1'b0;	  	  
	  if (left) nextstate <= S0;
    else if (right) nextstate <= S4;
	  else   nextstate <= S0;
       end
       S4: begin
	  LC <= 1'b0;	
    LB <= 1'b0;
    LA <= 1'b0;
    RA <= 1'b1;
    RB <= 1'b0;
    RC <= 1'b0;	  	  
	  if (right) nextstate <= S5;
    else if (left) nextstate <= S1;
	  else   nextstate <= S0;
       end
       S5: begin
	  LC <= 1'b0;	
    LB <= 1'b0;
    LA <= 1'b0;
    RA <= 1'b1;
    RB <= 1'b1;
    RC <= 1'b0;	  	  
	  if (right) nextstate <= S6;
    else if (left) nextstate <= S1;
	  else   nextstate <= S0;
       end
       S6: begin
	  LC <= 1'b0;	
    LB <= 1'b0;
    LA <= 1'b0;
    RA <= 1'b1;
    RB <= 1'b1;
    RC <= 1'b1;	  	  
	  if (right) nextstate <= S0;
    else if (left) nextstate <= S1;
	  else   nextstate <= S0;
       end
       default: begin
	  LC <= 1'b0;	
    LB <= 1'b0;
    LA <= 1'b0;
    RA <= 1'b0;
    RB <= 1'b0;
    RC <= 1'b0;	  	  
	  nextstate <= S0;
       end
     endcase
   
endmodule
