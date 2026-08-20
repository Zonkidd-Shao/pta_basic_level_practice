import sys

data = list(map(int, sys.stdin.read().strip().split()))
if not data:
    sys.exit(0)
n = data[0]
# need at least 2*n numbers after n
vals = data[1:]
if len(vals) < 2*n:
    # maybe lines split differently, but we have all ints
    top = vals[:n] if len(vals) >= n else []
    bottom = vals[n:2*n] if len(vals) >= 2*n else []
else:
    top = vals[:n]
    bottom = vals[n:2*n]

if not top or not bottom:
    sys.exit(0)
min_top = min(top)
max_bottom = max(bottom)
diff = min_top - max_bottom
if diff >= 1:
    print(f"Yes {diff}")
else:
    print(f"No {1 - diff}")
