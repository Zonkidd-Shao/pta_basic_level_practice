# 1071 小赌怡情
import sys
data = sys.stdin.read().strip().split()
if not data:
    sys.exit(0)
T = int(data[0]); K = int(data[1])
idx = 2
for _ in range(K):
    if idx + 3 >= len(data):
        break
    n1 = int(data[idx]); b = int(data[idx+1]); t = int(data[idx+2]); n2 = int(data[idx+3])
    idx += 4
    if T == 0:
        print("Game Over.")
        break
    if t > T:
        print(f"Not enough tokens.  Total = {T}.")
        continue
    if (n1 > n2 and b == 0) or (n1 < n2 and b == 1):
        T += t
        print(f"Win {t}!  Total = {T}.")
    else:
        T -= t
        print(f"Lose {t}.  Total = {T}.")
        if T == 0:
            print("Game Over.")
            break
