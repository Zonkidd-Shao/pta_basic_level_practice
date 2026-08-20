# 题目：1110 区块反转
# 块间反转 块内保序 blocks=[a[i:i+k] for ...]; a=sum(reversed(blocks),[])
import sys
h,n,k=sys.stdin.readline().split();k=int(k);d={}
for _ in range(int(n)):
 a,x,b=sys.stdin.readline().split();d[a]=(x,b)
a=[]
while h!='-1':a.append(h);h=d[h][1]
blocks=[a[i:i+k] for i in range(0,len(a),k)]
a=[x for block in reversed(blocks) for x in block]
for i,x in enumerate(a):print(x,d[x][0],a[i+1] if i+1<len(a) else '-1')
