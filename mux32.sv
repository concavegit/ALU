/*
 * Module mux32
 *
 * Inputs: in0, in1, sel
 * Outputs: out
 * Function: if sel then in1 else in0.
 */
`define NAND nand #20

module mux32
  (
   output [31:0] out,
   input [31:0]  in0, in1,
   input         sel
   );

   wire          a;
   wire [31:0]   aa, bb;

   `NAND (a, sel, sel);

   genvar        i;

   generate
      for (i = 0; i < 32; i = i + 1) begin
         `NAND (aa[i], in0[i], a),
        (bb[i], in1[i], sel),
        (out[i], aa[i], bb[i]);
      end
   endgenerate
endmodule
