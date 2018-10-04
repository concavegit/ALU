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
      #100000 $finish;
   end
endmodule
