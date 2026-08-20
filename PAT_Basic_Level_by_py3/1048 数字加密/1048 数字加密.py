import sys
a,b=sys.stdin.read().split()
n=max(len(a),len(b))
a=a.zfill(n)
b=b.zfill(n)
ra=a[::-1]
rb=b[::-1]
out=[]
for i,(x,y) in enumerate(zip(ra,rb),1):
    if i%2==1:
        z=(int(x)+int(y))%13
        out.append(str(z) if z<10 else 'JQK'[z-10])
    else:
        z=(int(y)-int(x)+10)%10
        out.append(str(z))
print(''.join(reversed(out)))
