module alu31
  (
   output      result, cout, overflow,
   input [2:0] sel,
   input       a, b, cin, invta, invtb
   );

   wire        a1, b1;

   // Invert a if necessary
   xor (a1, invta, a);

   // Invert b if necessary
   xor(b1, invtb, b);

   // Add
   wire        sum;
   fulladder f0(sum, cout, a1, b1, cin);

   // Xor
   wire        xorab;
   xor (xorab, a, b);

   // Nand
   wire        nandab;
   nand (nandab, a1, b1);

   // Nor
   wire        norab;
   nor (norab, a1, b1);

   // Final result
   mux8way m1(result, sel, sum, sum, xorab, sum, norab, nandab, norab, nandab);

   // Overflow
   xor(overflow, cin, cout);
endmodule
