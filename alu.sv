/*
 * Module alu
 *
 * Inputs: operandA, operandB, command
 * Outputs: result, carryout, zero, overflow
 * Function: result = the result of the corresponding command.
 * carryout = the carry output of either addition or subtraction, 0
 * otherwise.
 * zero = 1 if the command is addition or subtraction and the result
 * is 0, 0 otherwise.
 */

`include "aluslice.sv"
`include "mux.sv"
`include "mux32.sv"

`define NOT not #10

module ALU
  (
   output [31:0] result,
   output        carryout,
   output        zero,
   output        overflow,
   input [31:0]  operandA,
   input [31:0]  operandB,
   input [2:0]   command
   );

   // Is b not 0?
   wire          nbz;
   `OR
     (
      nbz,
      operandB[0], operandB[1], operandB[2], operandB[3],
      operandB[4], operandB[5], operandB[6], operandB[7],
      operandB[8], operandB[9], operandB[10], operandB[11],
      operandB[12], operandB[13], operandB[14], operandB[15],
      operandB[16], operandB[17], operandB[18], operandB[19],
      operandB[20], operandB[21], operandB[12], operandB[23],
      operandB[24], operandB[25], operandB[16], operandB[27],
      operandB[28], operandB[29], operandB[30], operandB[31]
      );

   // Set invtb if not addition (non-subtraction/slt does not matter)
   // and not zero
   wire          invtb;
   `AND (invtb, nbz, command[0]);

   // Chain together ALUs
   wire [31:0]   iresult;
   wire          ic0, ic1, ic2, ic3,
                 ic4, ic5, ic6, ic7,
                 ic8, ic9, ic10, ic11,
                 ic12, ic13, ic14, ic15,
                 ic16, ic17, ic18, ic19,
                 ic20, ic21, ic22, ic23,
                 ic24, ic25, ic26, ic27,
                 ic28, ic29, ic30, ic31;

   wire          iz0, iz1, iz2, iz3,
                 iz4, iz5, iz6, iz7,
                 iz8, iz9, iz10, iz11,
                 iz12, iz13, iz14, iz15,
                 iz16, iz17, iz18, iz19,
                 iz20, iz21, iz22, iz23,
                 iz24, iz25, iz26, iz27,
                 iz28, iz29, iz30, iz31;

   aluslice
     a0(iresult[0], ic0, iz0, command, operandA[0], operandB[0], invtb, 1'b0, invtb),
     a1a(iresult[1], ic1, iz1, command, operandA[1], operandB[1], ic0, iz0, invtb),
     a2(iresult[2], ic2, iz2, command, operandA[2], operandB[2], ic1, iz1, invtb),
     a3(iresult[3], ic3, iz3, command, operandA[3], operandB[3], ic2, iz2, invtb),
     a4(iresult[4], ic4, iz4, command, operandA[4], operandB[4], ic3, iz3, invtb),
     a5(iresult[5], ic5, iz5, command, operandA[5], operandB[5], ic4, iz4, invtb),
     a6(iresult[6], ic6, iz6, command, operandA[6], operandB[6], ic5, iz5, invtb),
     a7(iresult[7], ic7, iz7, command, operandA[7], operandB[7], ic6, iz6, invtb),
     a8(iresult[8], ic8, iz8, command, operandA[8], operandB[8], ic7, iz7, invtb),
     a9(iresult[9], ic9, iz9, command, operandA[9], operandB[9], ic8, iz8, invtb),
     a10(iresult[10], ic10, iz10, command, operandA[10], operandB[10], ic9, iz9, invtb),
     a11(iresult[11], ic11, iz11, command, operandA[11], operandB[11], ic10, iz10, invtb),
     a12(iresult[12], ic12, iz12, command, operandA[12], operandB[12], ic11, iz11, invtb),
     a13(iresult[13], ic13, iz13, command, operandA[13], operandB[13], ic12, iz12, invtb),
     a14(iresult[14], ic14, iz14, command, operandA[14], operandB[14], ic13, iz13, invtb),
     a15(iresult[15], ic15, iz15, command, operandA[15], operandB[15], ic14, iz14, invtb),
     a16(iresult[16], ic16, iz16, command, operandA[16], operandB[16], ic15, iz15, invtb),
     a17(iresult[17], ic17, iz17, command, operandA[17], operandB[17], ic16, iz16, invtb),
     a18(iresult[18], ic18, iz18, command, operandA[18], operandB[18], ic17, iz17, invtb),
     a19(iresult[19], ic19, iz19, command, operandA[19], operandB[19], ic18, iz18, invtb),
     a20(iresult[20], ic20, iz20, command, operandA[20], operandB[20], ic19, iz19, invtb),
     a21(iresult[21], ic21, iz21, command, operandA[21], operandB[21], ic20, iz20, invtb),
     a22(iresult[22], ic22, iz22, command, operandA[22], operandB[22], ic21, iz21, invtb),
     a23(iresult[23], ic23, iz23, command, operandA[23], operandB[23], ic22, iz22, invtb),
     a24(iresult[24], ic24, iz24, command, operandA[24], operandB[24], ic23, iz23, invtb),
     a25(iresult[25], ic25, iz25, command, operandA[25], operandB[25], ic24, iz24, invtb),
     a26(iresult[26], ic26, iz26, command, operandA[26], operandB[26], ic25, iz25, invtb),
     a27(iresult[27], ic27, iz27, command, operandA[27], operandB[27], ic26, iz26, invtb),
     a28(iresult[28], ic28, iz28, command, operandA[28], operandB[28], ic27, iz27, invtb),
     a29(iresult[29], ic29, iz29, command, operandA[29], operandB[29], ic28, iz28, invtb),
     a30(iresult[30], ic30, iz30, command, operandA[30], operandB[30], ic29, iz29, invtb),
     a31(iresult[31], ic31, iz31, command, operandA[31], operandB[31], ic30, iz30, invtb);

   // Detect Overflow
   wire          ioverflow;
   `XOR (ioverflow, ic31, ic30);

   // Detect Zero
   wire          iz;
   `NOT (iz, iz31);

   // Zero flags if necessary
   wire          addsub;
   `NOR (addsub, command[2], command[1]);
   `AND (carryout, ic31, addsub);
   `AND (overflow, ioverflow, addsub);
   `AND (zero, iz, addsub);

   // slt ?
   wire          slt;
   wire          ncommand2;
   `NOT (ncommand2, command[2]);
   `AND (slt, ncommand2, command[1], command[0]);

   // slt result
   wire          sltsel;
   wire [31:0]   sltres;
   assign          sltres[31:1] = 0;

   `XOR (sltsel, operandA[31], operandB[31]);
   mux m0(sltres[0], iresult[31], operandA[31], sltsel);

   // Select either the SLT result or alu slice result
   mux32 m1(result, iresult, sltres, slt);
endmodule
