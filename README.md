# ALU
The main report is in [report.md](report.md).

## Structure
The structure is a reprocess for the arguments, a midprocessor to combine the transformed arguments, and a postprocessor to transform the outputs.
A left branch is a 'yes', and a right brangh is a 'no'.

![](uml/concept2.png)

## Test Bench
The main principle of the test bench is to thoroughly check addition.
Inverting the second test case input gives the same coverage for subtraction.
The addition test cases are created by specifying whether or not each input and sum is nonnegative.
This consequently tests carrying, as carrying only happens when a negative and positive number are added to create a positive number or both operands are negative.
Overflows can also be tested by specifying both inputs as the same sign and the sum as the opposite signs.

The bit-wise operators are checked on the same test cases, as there is a good amount of randomness already in the generated test cases and other edge cases are tested later.
There is also another set of generated cases for when the addition is 0, testing the zero flag.
However, this checks the ALU's output to its zero flag.
For a problem here to be detected, the ALU's other functions must be properly fixed.
This is a feature as the designer will not try to fix a perfectly good zero flag prematurely.
The zero flag also tests an edge case of SLT, as zero draws the line between less than or less than or equal to via subtraction.
The overflow flag is also tested by generating cases where the sum is the maximum or minimum number before overflowing.

The testing loop iterates over all 8 configurations for the addition test case generator, 1024 random instances of each test case spec, and all 8 functions.
For all of the above cases, an overflow test and zero test are also tested, leading to 3 * 8 * 1024 * 8 test cases.
The covered output cases are calculated below and demonstrate good coverage.

| Flag     | Intentionally False | Intentionally True |
|----------|---------------------|--------------------|
| Overflow | 192512              | 4096               |
| Carry    | 188416              | 8192               |
| Zero     | 44032               | 16384              |

Along with this table, all combinations of 0, -1, and the upper and lower limits of the inputs are tested as well for all operations to test edge cases.
XOR, NOR, NAND, AND, OR, and SLT get to shine especially here, as the controlled presence of 1s and 0s in the bits make for distinct outputs.

## Timing Analysis
