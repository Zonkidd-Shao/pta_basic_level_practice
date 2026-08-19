# 题目：1027 打印沙漏
#
# 题目描述：
#
# 输入格式：
#
# 输出格式：
#
# 实现原理：
#   - 循环迭代处理
#
# 算法思路：
#   图形打印：根据给定字符数计算沙漏行数，
#   逐行打印上半部分和下半部分。
#
import sys

n, ch = sys.stdin.read().split(); n = int(n)
k = int(((n + 1) / 2) ** .5)
while 2 * k * k - 1 > n: k -= 1
for i in range(k, 0, -1): print(' ' * (k-i) + ch * (2*i-1))
for i in range(2, k+1): print(' ' * (k-i) + ch * (2*i-1))
print(n - (2*k*k-1))
