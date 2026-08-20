# 1067 试密码
import sys
data = sys.stdin.read().splitlines()
if not data:
    sys.exit(0)
first = data[0].strip().split()
p = first[0]
n = int(first[1]) if len(first) > 1 else int(data[1].strip())
# if password and n on same line, attempts start at line 1, else line 2
attempt_start = 1 if len(first) > 1 else 2
cnt = 0
for line in data[attempt_start:]:
    if line == "#":
        break
    cnt += 1
    if line == p:
        print("Welcome in")
        break
    else:
        print(f"Wrong password: {line}")
        if cnt >= n:
            print("Account locked")
            break
