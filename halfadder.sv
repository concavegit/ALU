/*
 * Module halfadder
 *
 * Inputs: a, b
 * Outputs: sum, carry
 * Function: sum = LSB of a + b
 * carry = MSB of a + b
 */

module halfadder (input a, b,
                  output sum, carry);

   // The MSB is 1 iff both bits are different
   xor (sum, a, b);

   // The LSB is 1 iff both bits are 0
   and (carry, a, b);

endmodule
