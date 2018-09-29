#include <verilated.h>
#include <verilated_vcd_c.h>
#include <limits>

#include <Valu.h>

void checkZero(Valu& top, std::string desc)
{
  if ((bool) top.result == top.zero)
    printf("zero is %d for %d %s %d, should be %d",
           top.result, top.operandA, desc.c_str(), top.operandB,
           (bool) top.result);
}

void flagsZero(Valu& top, std::string desc)
{
  if (top.carryout != 0)
    printf("carryout is %d for %d %s %d, should be 0",
           top.carryout, top.operandA, desc.c_str(), top.operandB);

  if (top.overflow != 0)
    printf("overflow is %d for %d %s %d, should be 0",
           top.overflow, top.operandA, desc.c_str(), top.operandB);

  checkZero(top, desc);
}

void checkBitwise(Valu& top, std::string desc, IData result)
{
  if (top.result != result)
    printf("Xor is %d for %d %s %d, should be %d\n",
           top.result, top.operandA, desc.c_str(), top.operandB, result);

  flagsZero(top, "^");
}

void checkSum(Valu& top)
{
  const auto sum = top.operandA + top.operandB;
  const auto carry = bool ((long) top.operandA + (long) top.operandB >> 32 & 1);
  const auto zero = sum == 0;
  const auto overflow = (top.operandA >= 0 and top.operandB >= 0)
    ? sum < 0 : top.operandA < 0 and top.operandB < 0 ? sum >= 0 : 0;

  if (top.result != sum)
    printf("Sum is %d for %d + %d, should be %d\n",
           top.result, top.operandA, top.operandB, sum);

  if (top.carryout != carry)
    printf("carryout is %d for %d + %d, should be %d\n",
           top.carryout, top.operandA, top.operandB, carry);

  checkZero(top, "+");

  if (top.overflow != overflow)
    printf("Overflow is %d for %d + %d, should be %d\n",
           top.overflow, top.operandA, top.operandB, overflow);
}

void checkDiff(Valu& top)
{
  const auto diff = top.operandA - top.operandB;
  const auto carry = bool ((long) top.operandA + (long) top.operandB >> 32 & 1);
  const auto zero = diff == 0;
  const auto overflow = (top.operandA >= 0 and top.operandB < 0)
    ? diff < 0 : top.operandA < 0 and top.operandB >= 0 ? diff >= 0 : 0;

  if (top.result != diff)
    printf("Difference is %d for %d - %d, should be %d\n",
           top.result, top.operandA, top.operandB, diff);

  if (top.carryout != carry)
    printf("carryout is %d for %d - %d, should be %d\n",
           top.carryout, top.operandA, top.operandB, carry);

  checkZero(top, "-");

  if (top.overflow != overflow)
    printf("overflow is %d for %d - %d, should be %d\n",
           top.overflow, top.operandA, top.operandB, overflow);
}

void checkXor(Valu& top) {checkBitwise(top, "^", top.operandA ^ top.operandB);}
void checkSLT(Valu& top) {checkBitwise(top, "<", top.operandA < top.operandB);}
void checkAnd(Valu& top) {checkBitwise(top, "&", top.operandA & top.operandB);}

void checkNand(Valu& top)
{
  checkBitwise(top, "NAND", ~(top.operandA & top.operandB));
}

void checkNor(Valu& top)
{
  checkBitwise(top, "NOR", ~(top.operandA | top.operandB));
}

void checkOr(Valu& top) {checkBitwise(top, "|", top.operandA | top.operandB);}

int main(int argc, char** argv)
{
  Verilated::commandArgs(argc, argv);

  Valu top;

  std::vector<int> failed_cases;

  top.operandA = -64;
  top.eval();
  int test_cases[][4] =
    {
     1, 9, 16, 3,
     2, 3, 4, 9,
     1, 0, 3, 2
    };

  const std::vector<void (*) (Valu &)> commands =
    {
     checkSum, checkDiff, checkXor, checkSLT,
     checkAnd, checkNand, checkNor, checkOr
    };

  for (auto i = 0; i < 4; i++)
    {
      top.operandA = test_cases[0][i];
      top.operandB = test_cases[1][i];
      top.command = test_cases[2][i];
      top.eval();

      printf("%d\n\n", i);
      commands[i](top);
    }

  top.final();
}
