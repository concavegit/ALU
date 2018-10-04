/*
 * Module mux
 *
 * Inputs: in0, in1, sel
 * Outputs: out
 * Function: if sel then in1 else in0.
 */
`define NAND nand #20

module mux
  (
   output out,
   input  in0, in1, sel
   );

   wire   a, b, c;

   `NAND (a, sel, sel),
     (b, in0, a),
     (c, sel, in1),
     (out, b, c);
endmodule
