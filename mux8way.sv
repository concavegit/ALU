/*
 * Module mux8way
 *
 * Inputs: sel, in0, in1, in2, in3, in4, in5, in6, in7
 * Outputs: out
 * Function: if sel == 0 then in0, if sel == 1 then in1 ... if sel ==
 * 7 then in7
 */

module mux8way
  (
   output      out,
   input [2:0] sel,
   input       in0, in1, in2, in3, in4, in5, in6, in7
   );

   wire        a, b, c, d, e, f;

   mux
     m0(a, in0, in1, sel[0]),
     m1(b, in2, in3, sel[0]),
     m2(c, in4, in5, sel[0]),
     m3(d, in6, in7, sel[0]),

     m4(e, a, b, sel[1]),
     m5(f, c, d, sel[1]),

     m6(out, e, f, sel[2]);
endmodule 
