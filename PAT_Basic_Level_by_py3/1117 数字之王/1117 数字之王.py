# 题目：1117 数字之王
# 未立方修复：reduce(lambda x,y:x*y, map(lambda d:int(d)**3, str(x)))
import sys
from collections import Counter
import functools
a,b=map(int,sys.stdin.read().split());a=list(range(a,b+1))
while max(a)>=10:
 a=[sum(map(int,str(functools.reduce(lambda x,y:x*y,map(lambda d:int(d)**3,str(x)))))) for x in a]
c=Counter(a);m=max(c.values());print(m);print(*[x for x in range(10) if c[x]==m])
