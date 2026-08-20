# 1069 微博转发抽奖
import sys
data = sys.stdin.read().strip().split()
if not data:
    print("Keep going...")
    sys.exit(0)
m, n, s = map(int, data[:3])
names = data[3:3+m]
# In case names contain spaces? they don't, so split works
if len(names) < m:
    # fallback read lines
    names += [""] * (m - len(names))
if s > m:
    print("Keep going...")
    sys.exit(0)
used = set()
win = []
i = s - 1
while i < m:
    if names[i] not in used:
        win.append(names[i])
        used.add(names[i])
        i += n
    else:
        i += 1
if win:
    sys.stdout.write("\n".join(win))
else:
    print("Keep going...")
