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
      // SLT
      // operandA = 0;
      // operandB = 1;
      // command = 3;
      // #100000

      // ADD
      // operandA = 0;
      // operandB = -1;
      // command = 0;
      // #100000 operandA = 0;

      // SUB
      // operandA = 0;
      // operandB = 1;
      // command = 1;
      // #100000;

      // XOR
      // operandA = 0;
      // operandB = 0;
      // command = 2;
      // #100000

      // AND
      // operandA = 1;
      // operandB = 1;
      // command = 4;
      // #100000

      // NAND
      // operandA = 1;
      // operandB = 1;
      // command = 5;
      // #100000

      // NOR
      // operandA = 0;
      // operandB = 0;
      // command = 6;
      // #100000

      // OR
      operandA = 0;
      operandB = 0;
      command = 7;
      #100000
      // operandA = 0;
      // operandB = 0;
        // command = 3'b010;
        // #100
        $finish;
          end
endmodule
