import sys

data = sys.stdin.read().strip().split()
if not data:
    sys.exit(0)
it = iter(data)
n = int(next(it)); k = int(next(it)); x = int(next(it))
a = [[int(next(it)) for _ in range(n)] for _ in range(n)]

shift = 1
for i in range(0, n, 2):
    row = a[i][:]
    for j in range(n):
        if j < shift:
            a[i][j] = x
        else:
            a[i][j] = row[j - shift]
    shift += 1
    if shift > k:
        shift = 1

col_sums = [sum(a[i][j] for i in range(n)) for j in range(n)]
print(' '.join(map(str, col_sums)))
