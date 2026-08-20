# 1070 结绳 - sorted + 迭代折半
import sys
data = list(map(int, sys.stdin.read().split()))
if not data:
    sys.exit(0)
n = data[0]
a = sorted(data[1:1+n])
res = a[0]
for i in range(1, n):
    res = (res + a[i]) / 2
print(int(res))
