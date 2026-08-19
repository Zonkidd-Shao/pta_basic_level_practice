# 题目：1022 D进制的A+B
#
# 题目描述：
#   输入两个非负 10 进制整数 A 和 B (\le 2^{30} -1)，输出 A+B 的 D (1 < D \le 10)进制数。
#
# 输入格式：
#   输入在一行中依次给出 3 个整数 A、B 和 D。
#
# 输出格式：
#   输出 A+B 的 D 进制数。
#
# 实现原理：
#   - 循环迭代处理
#
# 算法思路：
#   进制转换：将十进制数转换为指定进制，
#   通过除基取余法逐位计算。
#
import sys

a, b, d = map(int, sys.stdin.read().split()); n = a + b
if n == 0: print(0)
else:
    out = ''
    while n: out, n = str(n % d) + out, n // d
    print(out)
