/*
 * Module mux32
 *
 * Inputs: in0, in1, sel
 * Outputs: out
 * Function: if sel then in1 else in0.
 */

module mux32
  (
   output [31:0] out,
   input [31:0]  in0, in1,
   input         sel
   );

   wire          a;
   wire [$bits(in0) - 1:0] aa, bb;

   nand (a, sel, sel);

   genvar                  i;

   generate
      for (i = 0; i < $bits(in0); i = i + 1) begin
         nand (aa[i], in0[i], a),
        (bb[i], in1[i], sel),
        (out[i], aa[i], bb[i]);
      end
   endgenerate
endmodule
