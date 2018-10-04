//2 way single bit mux 

module mux
  (
   output out,
   input  in0, in1, sel
   );

   wire   a, b, c;

   nand (a, sel, sel),
     (b, in0, a),
     (c, sel, in1),
     (out, b, c);
endmodule
