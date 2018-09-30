/*
 * Module ALU
 * 
 * Inputs: a, b, c
 * Outputs: out
 * Function: sum = LSB of a + b + c
 * carry = MSB of a + b + c
 */

`include "fulladder.v"
`include "multiplexer.v"
`include "decoder.v"
`define OR or #30
`define NAND nand #10
`define XOR xor #60
`define NOT not #10



module alu
(  	
    output out,carry,
    input s0,s1,
    input abc
    

);

   // Intermediate   bits.
   wire                 inva, invb,noand0,add1,naor1,xo1,noand1 ;


   `XOR(inva,a,s0);
   `XOR(invb,b,s1);

  //
   fulladder
     f0(add1,carry,inva,invb,c);
   `NAND(naor1,inva,invb);
   `XOR(xo1,inva,invb);
   `OR(noand0,inva,invb);
   `NOT(noand1,noand0);
   multiplexer
     m0(out,s0,s1,naor1,x01,noand1,add1);






   
endmodule
