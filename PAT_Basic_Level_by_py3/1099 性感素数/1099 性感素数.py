# 题目：1099 性感素数
#
# 题目描述：
#   “性感素数”是指形如 (p, p+6) 这样的一对素数。之所以叫这个名字，是因为拉丁语管“六”叫“sex”（即英语的“性感”）。（原文摘自 http://mathworld.wolfram.com/SexyPrimes.html）
#   现给定一个整数，请你判断其是否为一个性感素数。
#
# 输入格式：
#   输入在一行中给出一个正整数 N (\le 10^8)。
#
# 输出格式：
#   若 N 是一个性感素数，则在一行中输出 `Yes`，并在第二行输出与 N 配对的另一个性感素数（若这样的数不唯一，输出较小的那个）。若 N 不是性感素数，则在一行中输出 `No`，然后在第二行输出大于 N 的最小性感素数。
#
# 实现原理：
#   - 循环迭代处理
#
# 算法思路：
#   素数筛法或素数判定：通过数学方法判断素数，
#   利用试除法或埃氏筛法高效找出素数。
#
import sys

n=int(sys.stdin.readline())
def p(x):return x>1 and all(x%i for i in range(2,int(x**.5)+1))
if p(n) and (p(n-6) or p(n+6)):print('Yes');print(n-6 if p(n-6) else n+6)
else:
 while not(p(n) and (p(n-6) or p(n+6))):n+=1
 print('No');print(n)
