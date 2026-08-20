# 题目：1034 有理数四则运算
#
# 题目描述：
#   本题要求编写程序，计算 2 个有理数的和、差、积、商。
#
# 输入格式：
#   输入在一行中按照 `a1/b1 a2/b2` 的格式给出两个分数形式的有理数，其中分子和分母全是整型范围内的整数，负号只可能出现在分子前，分母不为 0。
#
# 输出格式：
#   分别在 4 行中按照 `有理数1 运算符 有理数2 = 结果` 的格式顺序输出 2 个有理数的和、差、积、商。注意输出的每个有理数必须是该有理数的最简形式 `k a/b`，其中 `k` 是整数部分，`a/b` 是最简分数部分；若为负数，则须加括号；若除法分母为 0，则输出 `Inf`。题目保证正确的输出中没有超过整型范围的整数。
#
# 实现原理：
#   - 循环迭代处理
#   - 列表操作
#
# 算法思路：
#   分数运算：实现分数的四则运算，
#   需要求最大公约数进行约分，注意负数和零的处理。
#
import sys
from fractions import Fraction

def fmt(x):
    if x == 0: return "0"
    if x.denominator == 0: return 'Inf'
    n, d = abs(x.numerator), x.denominator
    s = (str(n // d) if n >= d else '') + ('' if n % d == 0 else ('' if n < d else ' ') + f'{n%d}/{d}')
    return f'(-{s})' if x < 0 else s

a, b = map(Fraction, sys.stdin.read().split())
for op, f in [('+', lambda: a+b), ('-', lambda: a-b), ('*', lambda: a*b)]: print(fmt(a), op, fmt(b), '=', fmt(f()))
print(fmt(a), '/', fmt(b), '=', 'Inf' if b == 0 else fmt(a/b))
