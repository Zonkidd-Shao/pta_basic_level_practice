# 1060 爱丁顿数: sorted降序后 E = max(i where a[i-1] > i)
import sys
data = list(map(int, sys.stdin.read().split()))
if not data:
    print(0)
else:
    n = data[0]
    a = sorted(data[1:1+n], reverse=True)
    E = 0
    for i, x in enumerate(a, 1):
        if x > i:
            E = i
        else:
            break
    print(E)
