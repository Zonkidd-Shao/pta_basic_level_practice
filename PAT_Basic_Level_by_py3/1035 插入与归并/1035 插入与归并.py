import sys

data = sys.stdin.read().strip().split()
if not data:
    sys.exit(0)
n = int(data[0])
orig = list(map(int, data[1:1+n]))
target = list(map(int, data[1+n:1+2*n]))

# 判断插入排序
a = orig[:]
for i in range(1, n):
    a[:i+1] = sorted(a[:i+1])
    if a == target:
        # 再迭代一轮
        if i+1 < n:
            a[:i+2] = sorted(a[:i+2])
        print('Insertion Sort')
        print(*a)
        sys.exit(0)

# 归并排序：按 orig 模拟 k*=2 归并，找到target后继续下一次归并再输出
a = orig[:]
k = 1
while k < n:
    # 执行一次归并，k 为当前归并段长度
    nxt = []
    for j in range(0, n, 2*k):
        nxt.extend(sorted(a[j:j+2*k]))
    a = nxt
    if a == target:
        # 找到target，继续下一次归并
        k *= 2
        nxt2 = []
        for j in range(0, n, 2*k):
            nxt2.extend(sorted(a[j:j+2*k]))
        # 若 k 已超过 n，则 nxt2 就是 a 本身（无需再归并）
        if not nxt2:
            nxt2 = a
        print('Merge Sort')
        print(*nxt2)
        break
    k *= 2
