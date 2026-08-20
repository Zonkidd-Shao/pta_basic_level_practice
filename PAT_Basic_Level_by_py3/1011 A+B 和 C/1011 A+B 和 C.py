# 题目：1011 A+B 和 C
#
# 题目描述：
#   给定区间 [-2^{31}, 2^{31}] 内的 3 个整数 A、B 和 C，请判断 A+B 是否大于 C。
#
# 输入格式：
#   输入第 1 行给出正整数 T (\le 10)，是测试用例的个数。随后给出 T 组测试用例，每组占一行，顺序给出 A、B 和 C。整数间以空格分隔。
#
# 输出格式：
#   对每组测试用例，在一行中输出 `Case #X: true` 如果 A+B>C，否则输出 `Case #X: false`，其中 `X` 是测试用例的编号（从 1 开始）。
#
# 实现原理：
#   - 循环迭代处理
#   - 列表操作
#
# 算法思路：
#   根据题目要求进行数据处理和计算，
#   使用适当的数据结构和算法提高效率。
#
import sys

for i, line in enumerate(sys.stdin.read().splitlines()[1:], 1):
    a, b, c = map(int, line.split())
    print(f'Case #{i}: {str(a + b > c).lower()}')
