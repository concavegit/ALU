/*
 * Module aluslice
 *
 * Inputs: command, a, b, cin, zin, invtb
 * Outputs: result, cout, zout
 * Function: result = a bit slice for all corresponding commands except
 * SLT, which is replaced with addition.
 * cout = the carry out of the fulladder
 * zout = the result is zero
 */

`include "fulladder.sv"
`include "mux8way.sv"

module aluslice
  (
   output      result, cout, zout,
   input [2:0] command,
   input       a, b, cin, zin, invtb
   );

   wire        b1;

   // Invert b if necessary
   xor(b1, invtb, b);

   // Add
   wire        sum;
   fulladder f0(sum, cout, a, b1, cin);

   // Xor
   wire        xorab;
   xor (xorab, a, b);

   // And
   wire        andab;
   and (andab, a, b);

   // Nand
   wire        nandab;
   nand (nandab, a, b);

   // Nor
   wire        norab;
   nor (norab, a, b);

   // Or
   wire        orab;
   or (orab, a, b);

   // Final result
   mux8way m1(result, command, sum, sum, xorab, sum, andab, nandab, norab, orab);

   // Set Zero
   or (zout, zin, sum);
endmodule
