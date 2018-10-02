// Multiplexer circuit
`define AND and #50
`define OR or #50
`define NOT not #50
`define XOR xor #50
`define NAND nand #50

module multiplexer81
  (  	
        output out,
        input  a0, a1,a2,
        input  in0,in1,in2,in3,in4,in5,in6,in7
  

        );
   wire        n1,n2,n0,int0,int1,int2,int3,int4,int5,int6,int7;
   `NOT(n0,a0);
   `NOT(n1,a1);
   `NOT(n2,a2);
   `AND(int0,n0,n1,n2,in0);
   `AND(int1,a0,n1,n2,in1);
   `AND(int2,n0,a1,n2,in2);
   `AND(int3,a0,a1,n2,in3);
   `AND(int4,n0,n1,a2,in4);
   `AND(int5,a0,n1,a2,in5);
   `AND(int6,n0,a1,a2,in6);

   `AND(int7,a0,a1,a2,in7);
   `OR(out,int0,int1,int2,int3,int4,int5,int6,int7);
 
   
   
endmodule
