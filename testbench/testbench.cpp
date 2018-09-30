#include <verilated.h>
#include <limits>
#include <random>

#include <Valu.h>

/**
 * Warn if the result and zero flag are mismatched.
 * This is used in the other checkers.
 *
 * @param dut the device under testing.
 * @param desc the symbol for the operation that was carried out.
 */
void checkZero(Valu& dut, std::string desc)
{
  if ((bool) dut.result == dut.zero)
    printf("zero is %d for %d %s %d, should be %d",
           dut.result, dut.operandA, desc.c_str(), dut.operandB,
           (bool) dut.result);
}

/**
 * Warn if the overflow or carry bits are nonzero.
 * This is used in the non-addition or subtraction checkers.
 *
 * @param dut the device under testing
 * @param desc the symbol for the operation carried out
 */
void flagsZero(Valu& dut, std::string desc)
{
  if (dut.carryout != 0)
    printf("carryout is %d for %d %s %d, should be 0",
           dut.carryout, dut.operandA, desc.c_str(), dut.operandB);

  if (dut.overflow != 0)
    printf("overflow is %d for %d %s %d, should be 0",
           dut.overflow, dut.operandA, desc.c_str(), dut.operandB);

  checkZero(dut, desc);
}

/**
 * Warn if the outputs match the result for a bitwise function.
 * This is used in non-addition or subtraction checkers.
 *
 * @param dut the device under testing
 * @param func the name of the operation carried out
 * @param desc the symbol for the operation carried out
 */
void checkBitwise(Valu& dut, std::string func, std::string desc, IData result)
{
  if (dut.result != result)
    printf("%s is %d for %d %s %d, should be %d\n",
           func.c_str(), dut.result, dut.operandA, desc.c_str(), dut.operandB, result);

  flagsZero(dut, "^");
}

/**
 * Warn if the outputs of the dut are incorrect for a sum.
 *
 * @param dut the device under testing
 */
void checkSum(Valu& dut)
{
  const int operandA = dut.operandA;
  const int operandB = dut.operandB;
  const int sum = operandA + operandB;
  const bool carry = bool ((long) operandA + (long) operandB >> 32 & 1);
  const bool zero = sum == 0;
  const bool overflow = operandA >= 0 && operandB >= 0
    ? sum < 0 : (operandA < 0 && operandB < 0 ? sum >= 0 : 0);

  if (dut.result != sum)
    printf("Sum is %d for %d + %d, should be %d\n",
           dut.result, operandA, operandB, sum);

  if (dut.carryout != carry)
    printf("carryout is %d for %d + %d, should be %d\n",
           dut.carryout, operandA, operandB, carry);

  checkZero(dut, "+");

  if (dut.overflow != overflow)
    printf("Overflow is %d for %d + %d, should be %d\n",
           dut.overflow, operandA, operandB, overflow);
}

/**
 * Warn if the outputs of the dut are incorrect for subtraction.
 *
 * @param dut the device under testing
 */
void checkDiff(Valu& dut)
{
  const int operandA = dut.operandA;
  const int operandB = dut.operandB;
  const int diff = operandA - operandB;
  const bool carry = bool ((long) operandA + (long) operandB >> 32 & 1);
  const bool zero = diff == 0;
  const bool overflow = operandA >= 0 && operandB < 0
    ? diff < 0 : operandA < 0 && operandB >= 0 ? diff >= 0 : 0;

  if (dut.result != diff)
    printf("Difference is %d for %d - %d, should be %d\n",
           dut.result, operandA, operandB, diff);

  if (dut.carryout != carry)
    printf("carryout is %d for %d - %d, should be %d\n",
           dut.carryout, operandA, operandB, carry);

  checkZero(dut, "-");

  if (dut.overflow != overflow)
    printf("Overflow is %d for %d - %d, should be %d\n",
           dut.overflow, operandA, operandB, overflow);
}

// Warn for each biwise function and SLT.
void checkXor(Valu& dut) {checkBitwise(dut, "Xor",  "^", dut.operandA ^ dut.operandB);}
void checkSLT(Valu& dut) {checkBitwise(dut, "SLT", "<", dut.operandA < dut.operandB);}
void checkAnd(Valu& dut) {checkBitwise(dut, "And", "&", dut.operandA & dut.operandB);}
void checkNand(Valu& dut) {checkBitwise(dut, "Nand", "NAND", ~(dut.operandA & dut.operandB));}
void checkNor(Valu& dut) {checkBitwise(dut, "Nor", "NOR", ~(dut.operandA | dut.operandB));}
void checkOr(Valu& dut) {checkBitwise(dut, "Or", "|", dut.operandA | dut.operandB);}

/**
 * Generate test cases which match the input criteria.
 * Overflows are handled for when the signs of the input are the same
 * but do not match the sign of the sum
 *
 * @param a_nonneg true iff operandA is desired to be nonnegative.
 * @param b_nonneg true iff operandB is desired to be nonnegative.
 * @param sum_nonneg true iff the sum is desired to be negative.
 * @return a tuple a operandB and operandA which match the input
 * criteria.
 */
std::tuple<int, int> genTestCase(bool a_nonneg, bool b_nonneg, bool sum_nonneg)
{
  std::random_device rd;
  std::mt19937 rng(rd());

  // If a and b are negative but a negative sum is desired a has to be
  // the minimum integer plus 1.
  const int a = a_nonneg ? rand() : - (rand() + (b_nonneg || sum_nonneg));

  std::tuple<int, int> b_range;

  if (a_nonneg == b_nonneg)
    {
      if (sum_nonneg == a_nonneg)
        {
          if (a_nonneg) b_range = {0, std::numeric_limits<int>::max() - a};
          else b_range = {std::numeric_limits<int>::min() - a, -1};
        } else
        {
          if (a_nonneg) b_range = {std::numeric_limits<int>::max() - a + 1, std::numeric_limits<int>::max()};
          else b_range = {std::numeric_limits<int>::min(), std::numeric_limits<int>::min() - a - 1};
        }
    } else
    {
      if (a_nonneg)
        {
          if (sum_nonneg) b_range = {-a, -1};
          else b_range = {std::numeric_limits<int>::min(), -a - 1};
        } else
        {
          if (sum_nonneg) b_range = {-a, std::numeric_limits<int>::max()};
          else b_range = {-a - 1, std::numeric_limits<int>::min() - a};
        }
    }

  int min_b_range = std::min(std::get<0>(b_range), std::get<1>(b_range));
  int max_b_range = std::max(std::get<0>(b_range), std::get<1>(b_range));
  std::uniform_int_distribution<int> uni(min_b_range, max_b_range);

  return {a, uni(rng)};
}

int main(int argc, char** argv)
{
  Verilated::commandArgs(argc, argv);

  Valu dut;
  std::random_device rd;
  std::mt19937 rng(rd());

  const std::vector<void (*) (Valu &)> test_commands =
    {
     checkSum, checkDiff, checkXor, checkSLT,
     checkAnd, checkNand, checkNor, checkOr
    };

  // Iterate through all test case specs
  for (auto i = 0; i < 8; i++)
    {

      // Randomly select 1024 test cases for each test case spec
      for (auto j = 0; j < 1024; j++)
        {
          const auto test_case = genTestCase(i & 1, bool (i & 2), bool (i & 4));
          const auto b = std::get<1>(test_case);

          // Check each test case for each function
          for (auto k = 0; k < 8; k++)
            {
              dut.operandA = std::get<0>(test_case);

              // Because the test cases are created for addition, negate
              // the second input so that the same coverage for addition
              // is applied to subtraction.
              dut.operandB = k == 1 ? -b : b;
              dut.command = k;
              dut.eval();
              test_commands[k](dut);

              // Verify zero-flag on.
              dut.operandA = rand() % 2 ? rand() : -rand();
              dut.operandB = k == 1 ? dut.operandA : -dut.operandA;
              dut.eval();
              test_commands[k](dut);

              // Test overflow at the minimum and maximum values
              dut.operandA = rand() % 2 ? rand() : -(rand() + 1);
              const int overflow_b = (dut.operandA < 0 ? std::numeric_limits<int>::min() : std::numeric_limits<int>::max()) - dut.operandA;
              dut.operandB = k == 1 ? -overflow_b : overflow_b;
              test_commands[k](dut);
            }
        }
    }

  // Test all combinations of edge values
  int edge_vals[] = {0, -1, std::numeric_limits<int>::min(), std::numeric_limits<int>::max()};

  for (const auto& val0 : edge_vals)
    for (const auto& val1 : edge_vals)
      for (const auto& test_command : test_commands)
        {
          dut.operandA = val0;
          dut.operandB = val1;
          dut.eval();
          test_command(dut);
        }

  dut.final();
}
