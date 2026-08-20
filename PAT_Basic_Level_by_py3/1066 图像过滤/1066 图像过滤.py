# 1066 图像过滤
import sys
data = sys.stdin.read().strip().split()
if not data:
    sys.exit(0)
# first 5 values: M N A B rep
m, n, a, b, rep = map(int, data[:5])
vals = list(map(int, data[5:]))
idx = 0
out_lines = []
for i in range(m):
    row = []
    for j in range(n):
        v = vals[idx]; idx += 1
        if a <= v <= b:
            v = rep
        row.append(f"{v:03d}")
    out_lines.append(" ".join(row))
sys.stdout.write("\n".join(out_lines))
