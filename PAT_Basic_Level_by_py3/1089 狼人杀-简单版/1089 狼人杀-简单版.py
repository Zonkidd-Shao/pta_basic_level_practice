import sys

data = list(map(int, sys.stdin.read().split()))
if not data:
    print('No Solution')
    sys.exit(0)
n = data[0]
a = data[1:]
# a length may be >n if splitted, take first n
a = a[:n]
# if input had newlines, a contains n ints each is claim: positive=good, negative=wolf
# pad if needed
# Enumerate wolves (1-indexed for output, 0-indexed for logic)
# Convert a to 1-indexed list with dummy at 0
claims = [0] + a
for i in range(1, n+1):
    for j in range(i+1, n+1):
        wolves = {i, j}
        lie = []
        for k in range(1, n+1):
            x = claims[k]
            target = abs(x)
            is_wolf_target = target in wolves
            claim_is_wolf = x < 0
            # true if claim matches reality
            if claim_is_wolf != is_wolf_target:
                lie.append(k)
        if len(lie) == 2 and ( (lie[0] in wolves) + (lie[1] in wolves) == 1 ):
            print(f"{i} {j}")
            sys.exit(0)
print('No Solution')
