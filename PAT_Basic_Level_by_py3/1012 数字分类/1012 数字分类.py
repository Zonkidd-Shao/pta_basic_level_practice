# 题目：1012 数字分类
#
# 题目描述：
#   给定一系列正整数，请按要求对数字进行分类，并输出以下 5 个数字：
#   - A_1 = 能被 5 整除的数字中所有偶数的和；
#   - A_2 = 将被 5 除后余 1 的数字按给出顺序进行交错求和，即计算 n_1-n_2+n_3-n_4\cdots；
#   - A_3 = 被 5 除后余 2 的数字的个数；
#   - A_4 = 被 5 除后余 3 的数字的平均数，精确到小数点后 1 位；
#   - A_5 = 被 5 除后余 4 的数字中最大数字。
#
# 输入格式：
#   每个输入包含 1 个测试用例。每个测试用例先给出一个不超过 1000 的正整数 N，随后给出 N 个不超过 1000 的待分类的正整数。数字间以空格分隔。
#
# 输出格式：
#   对给定的 N 个正整数，按题目要求计算 A_1~A_5 并在一行中顺序输出。数字间以空格分隔，但行末不得有多余空格。
#   若分类之后某一类不存在数字，则在相应位置输出 `N`。
#
# 实现原理：
#   - 循环迭代处理
#   - 列表操作
#
# 算法思路：
#   逐位处理：将输入字符串逐位转换为数字求和，
#   再将结果转换为对应拼音输出。
#
import sys

a = list(map(int, sys.stdin.read().split()))[1:]
groups = [[] for _ in range(5)]
for x in a:
    r = x % 5
    if r != 0 or x % 2 == 0: groups[r].append(x)
out = [sum(groups[0]), sum(x * (-1) ** i for i, x in enumerate(groups[1])), len(groups[2]), sum(groups[3]) / len(groups[3]) if groups[3] else None, max(groups[4]) if groups[4] else None]
print(' '.join('N' if x is None or x == 0 and i in (0, 1) else (f'{x:.1f}' if i == 3 else str(x)) for i, x in enumerate(out)))
