# 题目：1104 天长地久
#
# 题目描述：
#   “天长地久数”是指一个 K 位正整数 A，其满足条件为：A 的各位数字之和为 m，A+1 的各位数字之和为 n，且 m 与 n 的最大公约数是一个大于 2 的素数。本题就请你找出这些天长地久数。
#
# 输入格式：
#   输入在第一行给出正整数 N（\le 5），随后 N 行，每行给出一对 K（3<K<10）和 m（1<m<90），其含义如题面所述。
#
# 输出格式：
#   对每一对输入的 K 和 m，首先在一行中输出 `Case X`，其中 `X` 是输出的编号（从 1 开始）；然后一行输出对应的 n 和 A，数字间以空格分隔。如果解不唯一，则每组解占一行，按 n 的递增序输出；若仍不唯一，则按 A 的递增序输出。若解不存在，则在一行中输出 `No Solution`。
#
# 实现原理：
#   - 循环迭代处理
#   - 列表操作
#
# 算法思路：
#   逐位处理：将输入字符串逐位转换为数字求和，
#   再将结果转换为对应拼音输出。
#
import sys,math

def prime(x):return x>2 and all(x%i for i in range(2,int(x**.5)+1))
for case in range(1,int(sys.stdin.readline())+1):
 k,m=map(int,sys.stdin.readline().split());ans=[]
 for a in range(10**(k-1),10**k):
  if sum(map(int,str(a)))!=m:continue
  n=sum(map(int,str(a+1)))
  if prime(math.gcd(m,n)):ans.append((n,a))
 print(f'Case {case}')
 print('\n'.join(f'{n} {a}' for n,a in ans) or 'No Solution')
