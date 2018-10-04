/*
 * Module delaytest
 * This shows the waveform for the largest delay, as measured for the
 * longest time to drive from X.
 */
`include "alu.sv"
module delaytest();
   reg signed [31:0] operandA, operandB;
   reg signed [2:0]  command;
   wire signed [31:0] result;
   wire        carryout, zero, overflow;

   ALU alu(result, carryout, zero, overflow, operandA, operandB, command);
   initial begin
      $dumpfile("test.vcd");
      $dumpvars();
      operandA = 0;
      operandB = 1;
      command = 3;
      // A few more (non-exhaustive) cases we tried.
      #100000 operandA = 0;
      operandB = -1;
      command = 5;
      #100000 operandA = 0;
      operandB = 0;
      command = 0;
      #100000;
      operandA = 223423;
      operandB = 3232211;
      command = 1;
      #100000$finish;
   end
endmodule
