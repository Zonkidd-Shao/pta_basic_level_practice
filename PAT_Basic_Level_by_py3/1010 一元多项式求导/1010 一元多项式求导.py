# 题目：1010 一元多项式求导
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
#   多项式求导：对多项式的每一项求导，
#   系数乘指数，指数减一，零多项式特殊处理。
#
import sys

a = list(map(int, sys.stdin.read().split()))
ans = []
for c, e in zip(a[::2], a[1::2]):
    if e: ans += [c * e, e - 1]
print(*ans if ans else [0, 0])
