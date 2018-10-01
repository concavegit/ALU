/*
 * Module ALU32
 * 
 * Inputs: a[32], b[32]
 * Outputs: out[32], carry, overflow
 * Function: sum = Least 4 significant bits of a + b + c
 * carry = MSB of a + b + c
 * overflow = the sum is more than 4 bits.
 * Comment Integer 2's complement addition.
 */

`include "alu.v"
`include "alu1.v"
module alu32 (output [31:0] out,
                      output      cout, zout,
                      input [31:0] a,
                      input [31:0] b,
                      input carryin,s0,s1);

   // Intermediate carry bits
   wire [30:0]carry out,
   wire [30:0]zero;


   

   // Use this carry bit to cascade through the rest of the numbers
   // and the corresponding carry bit.
   alu1
     a0(out[0], carryout[0],z[0]s0,s1,a[0],b[0],c);

   alu
     a1(out[1], carryout[1],z[1],z[0],s0,s1,a[1],b[1],carryout[0]);
     a1(out[2], carryout[2],z[2],z[1]s0,s1,a[2],b[2],carryout[1]);
     a1(out[3], carryout[3],z[3],z[2]s0,s1,a[3],b[3],carryout[2]);
     a1(out[4], carryout[4],z[4],z[3]s0,s1,a[4],b[4],carryout[3]);
     a1(out[5], carryout[5],z[5],z[4]s0,s1,a[5],b[5],carryout[4]);
     a1(out[6], carryout[6],z[6],z[5]s0,s1,a[6],b[6],carryout[5]);
     a1(out[7], carryout[7],z[7],z[6]s0,s1,a[7],b[7],carryout[6]);
     a1(out[8], carryout[8],z[8],z[7]s0,s1,a[8],b[8],carryout[7]);
     a1(out[9], carryout[9],z[9],z[8]s0,s1,a[9],b[9],carryout[8]);
     a1(out[10], carryout[10],z[10],z[9]s0,s1,a[10],b[10],carryout[9]);
     a1(out[11], carryout[11],z[11],z[10]s0,s1,a[11],b[11],carryout[10]);
     a1(out[12], carryout[12],z[12],z[11]s0,s1,a[12],b[12],carryout[11]);
     a1(out[13], carryout[13],z[13],z[12]s0,s1,a[13],b[13],carryout[12]);
     a1(out[14], carryout[14],z[14],z[13]s0,s1,a[14],b[14],carryout[13]);
     a1(out[15], carryout[15],z[15],z[14]s0,s1,a[15],b[15],carryout[14]);
     a1(out[16], carryout[16],z[16],z[15]s0,s1,a[16],b[16],carryout[15]);
     a1(out[17], carryout[17],z[17],z[16]s0,s1,a[17],b[17],carryout[16]);
     a1(out[18], carryout[18],z[18],z[17]s0,s1,a[18],b[18],carryout[17]);
     a1(out[19], carryout[19],z[19],z[18]s0,s1,a[19],b[19],carryout[18]);
     a1(out[20], carryout[20],z[20],z[19]s0,s1,a[20],b[20],carryout[19]);
     a1(out[21], carryout[21],z[21],z[20]s0,s1,a[21],b[21],carryout[20]);
     a1(out[22], carryout[22],z[22],z[21]s0,s1,a[22],b[22],carryout[21]);
     a1(out[23], carryout[23],z[23],z[22]s0,s1,a[23],b[23],carryout[22]);
     a1(out[24], carryout[24],z[24],z[23]s0,s1,a[24],b[24],carryout[23]);
     a1(out[25], carryout[25],z[25],z[24]s0,s1,a[25],b[25],carryout[24]);
     a1(out[26], carryout[26],z[26],z[25]s0,s1,a[26],b[26],carryout[25]);
     a1(out[27], carryout[27],z[27],z[26]s0,s1,a[27],b[27],carryout[26]);
     a1(out[28], carryout[28],z[28],z[27]s0,s1,a[28],b[28],carryout[27]);
     a1(out[29], carryout[29],z[29],z[28]s0,s1,a[29],b[29],carryout[28]);
     a1(out[30], carryout[30],z[30],z[29]s0,s1,a[30],b[30],carryout[29]);
     a1(out[31], cout,s0,s1,zout,z[30]a[31],b[31],carryout[30]);

 
endmodule
