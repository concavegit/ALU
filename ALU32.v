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
`include "alu31.v"

module alu32 (output [31:0] out,
                      output      cout, zout,overflow,
                      input [31:0] a,
                      input [31:0] b,
                      input [2:0] add
                      );

   // Intermediate carry bits
   wire [30:0] carryout;
   wire [30:0] z;


   

   // Use this carry bit to cascade through the rest of the numbers
   // and the corresponding carry bit.
   alu1
     a0(out[0], carryout[0],z[0],add[0],add[1],add[2],a[0],b[0]);

   alu
     a1(out[1], carryout[1],z[1],z[0],add[0],add[1],add[2],a[1],b[1],carryout[0]),
     a2(out[2], carryout[2],z[2],z[1],add[0],add[1],add[2],a[2],b[2],carryout[1]),
     a3(out[3], carryout[3],z[3],z[2],add[0],add[1],add[2],a[3],b[3],carryout[2]),
     a4(out[4], carryout[4],z[4],z[3],add[0],add[1],add[2],a[4],b[4],carryout[3]),
     a5(out[5], carryout[5],z[5],z[4],add[0],add[1],add[2],a[5],b[5],carryout[4]),
     a6(out[6], carryout[6],z[6],z[5],add[0],add[1],add[2],a[6],b[6],carryout[5]),
     a7(out[7], carryout[7],z[7],z[6],add[0],add[1],add[2],a[7],b[7],carryout[6]),
     a8(out[8], carryout[8],z[8],z[7],add[0],add[1],add[2],a[8],b[8],carryout[7]),
     a9(out[9], carryout[9],z[9],z[8],add[0],add[1],add[2],a[9],b[9],carryout[8]),
     a10(out[10], carryout[10],z[10],z[9],add[0],add[1],add[2],a[10],b[10],carryout[9]),
     a11(out[11], carryout[11],z[11],z[10],add[0],add[1],add[2],a[11],b[11],carryout[10]),
     a12(out[12], carryout[12],z[12],z[11],add[0],add[1],add[2],a[12],b[12],carryout[11]),
     a13(out[13], carryout[13],z[13],z[12],add[0],add[1],add[2],a[13],b[13],carryout[12]),
     a14(out[14], carryout[14],z[14],z[13],add[0],add[1],add[2],a[14],b[14],carryout[13]),
     a15(out[15], carryout[15],z[15],z[14],add[0],add[1],add[2],a[15],b[15],carryout[14]),
     a16(out[16], carryout[16],z[16],z[15],add[0],add[1],add[2],a[16],b[16],carryout[15]),
     a17(out[17], carryout[17],z[17],z[16],add[0],add[1],add[2],a[17],b[17],carryout[16]),
     a18(out[18], carryout[18],z[18],z[17],add[0],add[1],add[2],a[18],b[18],carryout[17]),
     a19(out[19], carryout[19],z[19],z[18],add[0],add[1],add[2],a[19],b[19],carryout[18]),
     a20(out[20], carryout[20],z[20],z[19],add[0],add[1],add[2],a[20],b[20],carryout[19]),
     a21(out[21], carryout[21],z[21],z[20],add[0],add[1],add[2],a[21],b[21],carryout[20]),
     a22(out[22], carryout[22],z[22],z[21],add[0],add[1],add[2],a[22],b[22],carryout[21]),
     a23(out[23], carryout[23],z[23],z[22],add[0],add[1],add[2],a[23],b[23],carryout[22]),
     a24(out[24], carryout[24],z[24],z[23],add[0],add[1],add[2],a[24],b[24],carryout[23]),
     a25(out[25], carryout[25],z[25],z[24],add[0],add[1],add[2],a[25],b[25],carryout[24]),
     a26(out[26], carryout[26],z[26],z[25],add[0],add[1],add[2],a[26],b[26],carryout[25]),
     a27(out[27], carryout[27],z[27],z[26],add[0],add[1],add[2],a[27],b[27],carryout[26]),
     a28(out[28], carryout[28],z[28],z[27],add[0],add[1],add[2],a[28],b[28],carryout[27]),
     a29(out[29], carryout[29],z[29],z[28],add[0],add[1],add[2],a[29],b[29],carryout[28]),
     a30(out[30], carryout[30],z[30],z[29],add[0],add[1],add[2],a[30],b[30],carryout[29]);
     alu31
     a31(out[31],cout,overflow,zout,z[30],add[0],add[1],add[2],a[31],b[31],carryout[30]);

 
endmodule
