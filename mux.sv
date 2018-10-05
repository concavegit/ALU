/*
 * Module mux
 *
 * Inputs: in0, in1, sel
 * Outputs: out
 * Function: if sel then in1 else in0.
 */
`define NAND nand #20
`define NOT not #10

module mux
  (
   output out,
   input  in0, in1, sel
   );

   wire   a, b, c;

   `NOT (a, sel);
   `NAND
     (b, in0, a),
     (c, sel, in1),
     (out, b, c);
endmodule
