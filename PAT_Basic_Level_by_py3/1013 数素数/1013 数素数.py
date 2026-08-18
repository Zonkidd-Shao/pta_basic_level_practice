# 题目：1013 数素数
#
# 题目描述：
#   令 P_i 表示第 i 个素数。现任给两个正整数 M \le N \le 10^4，请输出 P_M 到 P_N 的所有素数。
#
# 输入格式：
#   输入在一行中给出 M 和 N，其间以空格分隔。
#
# 输出格式：
#   输出从 P_M 到 P_N 的所有素数，每 10 个数字占 1 行，其间以空格分隔，但行末不得有多余空格。
#
# 实现原理：
#   - 循环迭代处理
#   - 列表操作
#
# 算法思路：
#   素数筛法或素数判定：通过数学方法判断素数，
#   利用试除法或埃氏筛法高效找出素数。
#
import sys

m, n = map(int, sys.stdin.readline().split())
ps = []
x = 2
while len(ps) < n:
    if all(x % d for d in range(2, int(x ** .5) + 1)): ps.append(x)
    x += 1
for i in range(m - 1, n, 10): print(*ps[i:i + 10])
