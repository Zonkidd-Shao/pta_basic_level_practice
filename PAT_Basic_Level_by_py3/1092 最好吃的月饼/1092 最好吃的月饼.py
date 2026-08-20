import sys
n,m=map(int,sys.stdin.readline().split())
a=[0]*n
for _ in range(m):
    vals=list(map(int,sys.stdin.readline().split()))
    for i,x in enumerate(vals):
        if i < n:
            a[i]+=x
print(max(a))
print(*[i+1 for i,x in enumerate(a) if x==max(a)])
