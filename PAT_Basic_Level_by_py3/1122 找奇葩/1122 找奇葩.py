# 题目：1122 找奇葩
# 未过滤偶数修复：if x%2==1 and c[x]%2==1
import sys
from collections import Counter
data=list(map(int,sys.stdin.read().split()))
if not data:
  sys.exit()
n=data[0]
nums=data[1:]
c=Counter(nums)
# 按出现顺序找第一个出现奇数次的奇数
seen=set()
for x in nums:
  if x not in seen:
    seen.add(x)
    if x%2==1 and c[x]%2==1:
      print(x)
      break
else:
  # fallback: 遍历 Counter 顺序
  print(next(x for x in c if x%2==1 and c[x]%2==1))
