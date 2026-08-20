# 题目：1115 裁判机
# 轮内逐人增量更新 valid
import sys
x,y=map(int,sys.stdin.readline().split());n,m=map(int,sys.stdin.readline().split());a=[list(map(int,sys.stdin.readline().split())) for _ in range(n)]
seen={x,y}
valid={abs(x-y)}
alive=set(range(n))
for r in range(m):
 out=[]
 for i in sorted(alive):
  z=a[i][r]
  if z in seen or z not in valid:
   out.append(i)
  else:
   # 增量更新 valid：新数与所有已见数的差
   for v in list(seen):
    valid.add(abs(z - v))
   seen.add(z)
 for i in out:
  alive.remove(i)
  print(f'Round #{r+1}: {i+1} is out.')
print('Winner(s): '+' '.join(str(i+1) for i in sorted(alive)) if alive else 'No winner.')
