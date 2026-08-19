# 题目：1008 数组元素循环右移问题
#
# 题目描述：
#
# 输入格式：
#
# 输出格式：
#
# 实现原理：
#   - 列表操作
#
# 算法思路：
#   数组循环移位：利用切片操作实现高效的数组右移，
#   避免逐位移动的低效操作。
#
import sys

data = list(map(int, sys.stdin.read().split()))
n, m = data[:2]
a = data[2:]
m %= n
print(*a[-m:] + a[:-m] if m else a)
