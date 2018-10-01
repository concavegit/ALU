/*
 * Module ALU

 * Inputs: a, b, c
 * Outputs: out
 * Function: sum = LSB of a + b + c
 * carry = MSB of a + b + c
 */

`include "fulladder.v"
`include "multiplexer8.v"
`define OR or #30
`define NAND nand #10
`define XOR xor #60
`define NOT not #10

module alu1
  (
   output out,carry,z1,
   input  s0,s1,s2,
   input  a, b,c
   );

   // Intermediate   bits.
    wire    invb,and0,or0,nand0,nor0,add1,naor1,xo1,noand1,ns0,ns1 ;
   `NOT(ns0,s0);
   `NOT(ns1,s1);
   `AND(invb,ns0,ns1);
   
   `XOR(invb,b,s1);

   fulladder
     f0(add1,carry,a,invb,c);
   `AND(and0,a,b);
   `NOT(nand0,and0);
   `XOR(xo1,a,b);
   `OR(or0,a,b);
   `NOT(nor0,or0);
   multiplexer8
     m0(out,s0,s1,s2,add1,add1,xo1,xo1,and0,nand0,nor0,or0),
     m1(z1,s0,s1,s2,add1,add1,xo1,xo1,and0,nand0,nor0,or0);
endmodule


