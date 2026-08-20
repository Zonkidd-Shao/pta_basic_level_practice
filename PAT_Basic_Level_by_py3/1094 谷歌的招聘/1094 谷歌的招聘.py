import sys, math

def is_prime(x):
    if x < 2:
        return False
    if x % 2 == 0:
        return x == 2
    r = int(math.isqrt(x))
    for j in range(3, r+1, 2):
        if x % j == 0:
            return False
    return True

data = sys.stdin.read().strip().split()
if len(data) < 2:
    print('404')
    sys.exit(0)
L = int(data[0]); K = int(data[1])
# N may be on next token, but could contain leading zeros split? N is one token
s = data[2] if len(data) > 2 else ""
# If N was split incorrectly due to spaces? N is digits only, so token is fine
# But spec says second line is N as string length L, may contain newline, already captured
# If s length < L and there are more tokens, join?
if len(s) < L and len(data) > 3:
    s = ''.join(data[2:])
s = s.strip()
for i in range(L - K + 1):
    if i+K > len(s):
        break
    x_str = s[i:i+K]
    try:
        x_val = int(x_str)
    except:
        continue
    if is_prime(x_val):
        print(x_str)
        break
else:
    print('404')
