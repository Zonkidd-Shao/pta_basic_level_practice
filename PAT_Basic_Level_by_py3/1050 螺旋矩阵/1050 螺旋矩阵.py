import sys, math
data=list(map(int,sys.stdin.read().split()))
if not data:
    sys.exit(0)
N=data[0]
a=sorted(data[1:],reverse=True)
n=int(math.sqrt(N))
while N % n != 0:
    n-=1
m=N//n
q=[[0]*n for _ in range(m)]
idx=0
top,left,bot,right=0,0,m-1,n-1
while idx<N:
    for j in range(left,right+1):
        if idx>=N: break
        q[top][j]=a[idx]; idx+=1
    top+=1
    for i in range(top,bot+1):
        if idx>=N: break
        q[i][right]=a[idx]; idx+=1
    right-=1
    if top<=bot:
        for j in range(right,left-1,-1):
            if idx>=N: break
            q[bot][j]=a[idx]; idx+=1
        bot-=1
    if left<=right:
        for i in range(bot,top-1,-1):
            if idx>=N: break
            q[i][left]=a[idx]; idx+=1
        left+=1
for row in q:
    print(*row)
