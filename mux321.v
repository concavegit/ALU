module mux321(Y, A, B, sel);
//*********************************************************

 output [31:0] Y;
 input [31:0] A, B;
 input sel;
 reg [31:0] Y;

 always @(A or B or sel)
 if (sel == 1'b0)
 Y = A;
 else
 Y = B;

 endmodule
