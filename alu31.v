

`include "fulladder.v"
`include "multiplexer8.v"
`define OR or #30
`define NAND nand #10
`define XOR xor #60
`define NOT not #10

module alu1
  (
   output out,carry,z1,overflow,
   input  s0,s1,s2,
   input  a, b,c,z0
   );

   // Intermediate   bits.
    wire    invb,and0,or0,nand0,nor0,add1,naor1,xo1,noand1,ns0,ns1,z2 ;
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
     m0(out,s0,s1,s2,add1,add1,xo1,xo1,and0,nand0,nor0,or0);
   `OR(z2,z0,out);
   `NOT(z1,z2);
   `XOR(overflow,c,carry);
endmodule
