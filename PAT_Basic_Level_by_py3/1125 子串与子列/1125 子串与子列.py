# 题目：1125 子串与子列
#
# 题目描述：
#   **子串**是一个字符串中连续的一部分，而**子列**是字符串中保持字符顺序的一个子集，可以连续也可以不连续。例如给定字符串 `atpaaabpabtt`，`pabt`是一个子串，而 `pat` 就是一个子列。
#   现给定一个字符串 S 和一个子列 P，本题就请你找到 S 中包含 P 的最短子串。若解不唯一，则输出起点最靠左边的解。
#
# 输入格式：
#   输入在第一行中给出字符串 S，第二行给出 P。S 非空，由不超过 10^4 个小写英文字母组成；P 保证是 S 的一个非空子列。
#
# 输出格式：
#   在一行中输出 S 中包含 P 的最短子串。若解不唯一，则输出起点最靠左边的解。
#
# 实现原理：
#   - 循环迭代处理
#   - 列表操作
#
# 算法思路：
#   子串/子序列判断：判断一个字符串是否为另一个的子串或子序列，
#   子串要求连续，子序列不要求连续。
#
import sys

s,p=sys.stdin.read().split();best=(len(s)+1,0,0);i=0
while i<len(s):
 j=i;k=0
 while j<len(s) and k<len(p):
  if s[j]==p[k]:k+=1
  j+=1
 if k<len(p):break
 end=j-1;k=len(p)-1
 while end>=i:
  if s[end]==p[k]:k-=1
  if k<0:break
  end-=1
 if j-end<best[0]:best=(j-end,end,j)
 i=end+1
print(s[best[1]:best[2]])
