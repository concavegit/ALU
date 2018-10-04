//ALU module which takes in 2 32bit operands and 3 bit command and operates 8 different function
//operandA and operandB are the inputs
//command is the 3bit command
//It outputs the result of thechosen function along with zero,overflow flags.
`include "alu31.v"
`include "aluslice.v"
`include "fulladder.v"
`include "halfadder.v"
`include "mux8way.v"
`include "mux.v"
`include "mux321.v"

module alu
//Our idea for implementing the ALU is to string together 32 1 bit ALUs together

  (
   output [31:0] result,
   output        carryout,//Declaring outputs( result, carryout, overflow and zero flag)
   output        zero,
   output        overflow,
   input [31:0]  operandA,//Declaring inputs(A,B & command)
   input [31:0]  operandB,
   input [2:0]   command
   );
   wire          command01eq, invta;//Declaring intermediates for inversion

   // Invert a. We are adding the ability to invert the inputs so that we can efficiently use 2 gates (NOR and NAND) to perform 4 operations( AND,NOR,NAND,OR)
   xnor (command01eq, command[0], command[1]);
   and (invta, command01eq, command[2]);
//We invert using XNOR gates and the command bits that correspond to the operations we might want to perform.
   // inverting b.
   wire          ncommand2, subslt, invtb;// declaring intermedaites to help perform SLT and choose the correction operations
   wire bzero,isubslt,iinvtb;//intermediate bits for dealing with subtracting 0 from 0bug
   nor
     (bzero, operandB[0],operandB[1],operandB[2],operandB[3],operandB[4],operandB[5],operandB[6],operandB[7],operandB[8],operandB[9],operandB[10],operandB[11],operandB[12],operandB[12],operandB[13],operandB[14],operandB[15],operandB[16],operandB[17],operandB[18],operandB[19],operandB[20],operandB[21],operandB[22],operandB[23],operandB[24],operandB[25],operandB[26],operandB[27],operandB[28],operandB[29],operandB[30],operandB[31]);

   not (ncommand2, command[2]);
   and (isubslt, ncommand2, command[0],operandB[0]);
   and(subslt,isubslt,bzero);
   or (iinvtb, subslt, invta);
   and(invtb,iinvtb,bzero);
   wire [31:0]   iresult;//Intermediate for string together results

   wire          ic0, ic1, ic2, ic3,
                 ic4, ic5, ic6, ic7,
                 ic8, ic9, ic10, ic11,//Intermiediates for carry between the mini ALUs
                 ic12, ic13, ic14, ic15,
                 ic16, ic17, ic18, ic19,
                 ic20, ic21, ic22, ic23,
                 ic24, ic25, ic26, ic27,
                 ic28, ic29, ic30, ic31;

   wire          isb0;

   // Chain together ALUs
   aluslice
     a0(iresult[0], ic0, command, operandA[0], operandB[0], subslt, invta, invtb),
     a1a(iresult[1], ic1, command, operandA[1], operandB[1], ic0, invta, invtb),
     a2(iresult[2], ic2, command, operandA[2], operandB[2], ic1, invta, invtb),
     a3(iresult[3], ic3, command, operandA[3], operandB[3], ic2, invta, invtb),
     a4(iresult[4], ic4, command, operandA[4], operandB[4], ic3, invta, invtb),//Chained together
     a5(iresult[5], ic5, command, operandA[5], operandB[5], ic4, invta, invtb),//ALUs where carry
     a6(iresult[6], ic6, command, operandA[6], operandB[6], ic5, invta, invtb),//goes through all
     a7(iresult[7], ic7, command, operandA[7], operandB[7], ic6, invta, invtb),//and all of them 
     a8(iresult[8], ic8, command, operandA[8], operandB[8], ic7, invta, invtb),//output a 1 bit
     a9(iresult[9], ic9, command, operandA[9], operandB[9], ic8, invta, invtb),//Intermediate 
     a10(iresult[10], ic10, command, operandA[10], operandB[10], ic9, invta, invtb),//result
     a11(iresult[11], ic11, command, operandA[11], operandB[11], ic10, invta, invtb),
     a12(iresult[12], ic12, command, operandA[12], operandB[12], ic11, invta, invtb),
     a13(iresult[13], ic13, command, operandA[13], operandB[13], ic12, invta, invtb),
     a14(iresult[14], ic14, command, operandA[14], operandB[14], ic13, invta, invtb),
     a15(iresult[15], ic15, command, operandA[15], operandB[15], ic14, invta, invtb),
     a16(iresult[16], ic16, command, operandA[16], operandB[16], ic15, invta, invtb),
     a17(iresult[17], ic17, command, operandA[17], operandB[17], ic16, invta, invtb),
     a18(iresult[18], ic18, command, operandA[18], operandB[18], ic17, invta, invtb),
     a19(iresult[19], ic19, command, operandA[19], operandB[19], ic18, invta, invtb),
     a20(iresult[20], ic20, command, operandA[20], operandB[20], ic19, invta, invtb),
     a21(iresult[21], ic21, command, operandA[21], operandB[21], ic20, invta, invtb),
     a22(iresult[22], ic22, command, operandA[22], operandB[22], ic21, invta, invtb),
     a23(iresult[23], ic23, command, operandA[23], operandB[23], ic22, invta, invtb),
     a24(iresult[24], ic24, command, operandA[24], operandB[24], ic23, invta, invtb),
     a25(iresult[25], ic25, command, operandA[25], operandB[25], ic24, invta, invtb),
     a26(iresult[26], ic26, command, operandA[26], operandB[26], ic25, invta, invtb),
     a27(iresult[27], ic27, command, operandA[27], operandB[27], ic26, invta, invtb),
     a28(iresult[28], ic28, command, operandA[28], operandB[28], ic27, invta, invtb),
     a29(iresult[29], ic29, command, operandA[29], operandB[29], ic28, invta, invtb),
     a30(iresult[30], ic30, command, operandA[30], operandB[30], ic29, invta, invtb);

   wire          ioverflow;//Intermediate to handle overflow

   alu31 a31(iresult[31], ic31, ioverflow, command, operandA[31], operandB[31], ic30, invta, invtb);//Special case alu for the last one to determine overflow and zero flag

   // Zero flags if necessary
   wire          addsub;
   nor (addsub, command[2], command[1]);
   and (carryout, ic31, addsub);//Figuring out overflow and zero
   and (overflow, ioverflow, addsub);

	 /*
   // slt
   wire          slt;
   and (slt, subslt, command[1]);

   wire          sltsel;
   reg [31:0]    sltres = 0;//Figuring out SLT


   xor (sltsel, operandA[31], operandB[31]);
   mux m0(sltres[0], iresult[31], operandA[31], sltsel);
	 */

	 wire do_slt; // Are we doing SLT?
	 and (do_slt, subslt, command[1]); 

	 wire a_b_signs_diff, slt_out;
	 xor (a_b_signs_diff, operandA[31], operandB[31]);
	 mux slt_mux(slt_out, iresult[31], operandA[31], a_b_signs_diff);

	 wire [31:0] slt_out_32;
	 assign slt_out_32[31:1] = 32'b0;
	 assign slt_out_32[0] = slt_out;

   mux321 m1(result, iresult, slt_out_32, do_slt);

   // zero
   nor
     (
      zero,
      result[0], result[1], result[2], result[3],
      result[4], result[5], result[6], result[7],//Figuring out zero flag using a multiinput nor
      result[8], result[9], result[10], result[11],
      result[12], result[13], result[14], result[15],
      result[16], result[17], result[18], result[19],
      result[20], result[21], result[12], result[23],
      result[24], result[25], result[16], result[27],
      result[28], result[29], result[30], result[31]
      );
endmodule
