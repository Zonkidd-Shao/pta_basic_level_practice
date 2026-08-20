import sys
import math
import itertools

data = list(map(int, sys.stdin.read().split()))
if not data:
    sys.exit(0)
k = data[0]
nums = data[1:]

for x in nums[:k]:
    if x <= 0:
        print("No")
        continue
    divisors = []
    r = int(math.isqrt(x))
    for d in range(1, r+1):
        if x % d == 0:
            divisors.append(d)
            if d != x // d:
                divisors.append(x // d)
    if len(divisors) < 4:
        print("No")
        continue
    found = False
    # 检查任意4个不同因子的和能否被x整除
    for combo in itertools.combinations(divisors, 4):
        if sum(combo) % x == 0:
            found = True
            break
    print("Yes" if found else "No")
