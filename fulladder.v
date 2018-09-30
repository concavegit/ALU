/*
 * Module fulladder
 * 
 * Inputs: a, b, c
 * Outputs: sum, carry
 * Function: sum = LSB of a + b + c
 * carry = MSB of a + b + c
 */

`include "halfadder.v"
`define OR or #50

module fulladder(input a, b, c,
                 output sum, carry);

   // Intermediate sum and carry bits.
   wire                 sum0, carry0, carry1;

   // Chain halfadders together to find the LSB of the sum.
   halfadder
     h0(a, b, sum0, carry0),
     h1(sum0, c, sum, carry1);

   // The carry bit is 1 if any of the last additions carried.
   `OR (carry, carry0, carry1);
endmodule
