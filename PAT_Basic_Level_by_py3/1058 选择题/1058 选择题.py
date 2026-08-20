# 1058 选择题 - 只有全对才得分
import sys
import re

data = sys.stdin.read().strip().splitlines()
if not data:
    sys.exit(0)
n, m = map(int, data[0].split())
correct = []
full = []
idx = 1
for i in range(m):
    parts = data[idx].split()
    idx += 1
    full.append(int(parts[0]))
    cnt = int(parts[2])
    opts = set(parts[3:3+cnt]) if cnt > 0 else set()
    correct.append(opts)

wrong = [0]*m
for _ in range(n):
    # need to handle that student line may be split across lines? join remaining
    while idx < len(data) and data[idx].strip() == "":
        idx += 1
    if idx >= len(data):
        break
    line = data[idx]
    idx += 1
    # collect groups until we have m groups; if not enough, read next line
    groups = re.findall(r'\(([^)]*)\)', line)
    while len(groups) < m and idx < len(data):
        line2 = data[idx]
        idx += 1
        groups += re.findall(r'\(([^)]*)\)', line2)
    score = 0
    for q in range(m):
        if q < len(groups):
            inner = groups[q].strip()
            if inner == "":
                stu = set()
            else:
                parts = inner.split()
                # first is count, rest are options
                try:
                    c = int(parts[0])
                    opts = set(parts[1:]) if c>0 else set()
                except:
                    opts = set(parts)
                stu = opts
        else:
            stu = set()
        if stu == correct[q]:
            score += full[q]
        else:
            wrong[q] += 1
    print(score)
maxWrong = max(wrong) if wrong else 0
if maxWrong == 0:
    print("Too simple")
else:
    out = str(maxWrong) + "".join(f" {i+1}" for i, w in enumerate(wrong) if w == maxWrong)
    print(out)
