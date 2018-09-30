// Multiplexer circuit
`define AND and #50
`define OR or #50
`define NOT not #50
`define XOR xor #50
`define NAND nand #50
module behavioralMultiplexer
(
    output out,
    input address0, address1,
    input in0, in1, in2, in3
);
    // Join single-bit inputs into a bus, use address as index
    wire[3:0] inputs = {in3, in2, in1, in0};
    wire[1:0] address = {address1, address0};
    assign out = inputs[address];
endmodule


module structuralMultiplexer
(  	
    output out,
    input address0, address1,
    input in0, in1, in2, in3
    

);
    wire n1;
    wire x1;
    wire n2;
    wire n3;
    wire n4;
    wire x2;
    wire a1;
    wire a2;
    wire a3;
    wire a4;
    wire o1;
    wire o2;
    wire o3;
    wire o4;
    `NAND nA0andnA1(n1,address1,address0);
    `AND ot1(o1,n1,in0);
    `XOR s1(x1,address1,address0);
    `AND ss1(n2,x1,address0);
    `AND ot2(o2,n2,in1);
    `XOR s2(x2,address1,address0);
    `AND ss2(n3,x2,address1);
    `AND ot3(o3,n3,in2);
    `AND A0andA1(n4,address1,address0);
    `AND ot4(o4,n4,in3);
    `OR  fin(out,o1,o2,o3,o4);
endmodule

