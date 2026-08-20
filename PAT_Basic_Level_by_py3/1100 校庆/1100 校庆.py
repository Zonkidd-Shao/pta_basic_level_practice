import sys

data = sys.stdin.read().strip().split()
if not data:
    sys.exit(0)
it = iter(data)
try:
    n = int(next(it))
except StopIteration:
    sys.exit(0)
old = set()
for _ in range(n):
    try:
        old.add(next(it).strip())
    except StopIteration:
        break
try:
    m = int(next(it))
except StopIteration:
    m = 0
a = []
for _ in range(m):
    try:
        a.append(next(it).strip())
    except StopIteration:
        break
b = [x for x in a if x in old]
print(len(b))
# 最年长按生日 id[6:14] 比较
candidates = b if b else a
if candidates:
    # 按生日字符串比较，yyyymmdd 越小越年长
    ans = min(candidates, key=lambda x: x[6:14] if len(x) >= 14 else x[6:])
    print(ans)
