/*
 * Module halfadder
 *
 * Inputs: a, b
 * Outputs: sum, carry
 * Function: sum = LSB of a + b
 * carry = MSB of a + b
 */

`define XOR xor #50
`define AND and #50

module halfadder (input a, b,
                  output sum, carry);

   // The MSB is 1 iff both bits are different
   `XOR (sum, a, b);

   // The LSB is 1 iff both bits are 0
   `AND (carry, a, b);

endmodule
