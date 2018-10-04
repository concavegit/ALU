//This is a 2 way 32 bit mux gate

module mux321(Y, A, B, sel);

 output [31:0] Y;
 input [31:0] A, B;
 input sel;
 reg [31:0] Y;

 always @(A or B or sel)// Choosing input on the baisis of the address bit
 if (sel == 1'b0)
 Y = A;
 else
 Y = B;

 endmodule
