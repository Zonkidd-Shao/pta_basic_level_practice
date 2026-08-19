# 题目：1007 素数对猜想
#
# 题目描述：
#
# 输入格式：
#
# 输出格式：
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

n = int(sys.stdin.readline())
prime = [True] * (n + 1)
for i in range(2, int(n ** .5) + 1):
    if prime[i]: prime[i * i:n + 1:i] = [False] * len(prime[i * i:n + 1:i])
ps = [i for i in range(2, n + 1) if prime[i]]
print(sum(b - a == 2 for a, b in zip(ps, ps[1:])))
