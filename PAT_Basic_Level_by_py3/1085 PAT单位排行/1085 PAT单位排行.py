import sys
from collections import defaultdict

n = int(sys.stdin.readline())
d = defaultdict(lambda: [0.0, 0])  # score_weighted_sum, cnt
for _ in range(n):
    line = sys.stdin.readline()
    if not line:
        continue
    a, b, c = line.split()
    v = int(b)
    c = c.lower()
    if a[0] == 'B':
        d[c][0] += v / 1.5
    elif a[0] == 'A':
        d[c][0] += v
    else:  # T
        d[c][0] += v * 1.5
    d[c][1] += 1

ans = []
for k, (score, cnt) in d.items():
    total = int(score)
    ans.append((total, k, cnt))

ans.sort(key=lambda x: (-x[0], x[2], x[1]))

print(len(ans))
rank = 0
last = None
for i, x in enumerate(ans):
    if x[0] != last:
        rank = i + 1
        last = x[0]
    # x = (score, school, cnt)
    print(rank, x[1], x[0], x[2])
