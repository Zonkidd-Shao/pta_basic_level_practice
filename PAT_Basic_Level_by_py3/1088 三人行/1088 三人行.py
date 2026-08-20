import sys

m,x,y=map(int,sys.stdin.read().split())
for a in range(99,9,-1):
 b=int(str(a)[::-1]);c=abs(a-b)/x
 if abs(b - c*y) < 1e-8:
  def rel(v):
   if abs(v - m) < 1e-8: return 'Ping'
   return 'Cong' if v>m else 'Gai'
  # 甲乙为整数，丙可能为小数，按浮点比较
  ra = 'Ping' if a==m else ('Cong' if a>m else 'Gai')
  rb = 'Ping' if b==m else ('Cong' if b>m else 'Gai')
  # 丙使用浮点比较
  if abs(c - m) < 1e-8: rc='Ping'
  elif c>m: rc='Cong'
  else: rc='Gai'
  # 按题意若丙为小数，与整数m比较仍按大小
  # 输出丙若为整数则以整数形式？题目输出甲的值即可，丙不直接输出数值只输出关系
  print(f"{a} {ra} {rb} {rc}")
  break
else:
 print('No Solution')
