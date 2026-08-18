# 题目：1105 链表合并
#
# 题目描述：
#   给定两个单链表 L_1 = a_1 \to a_2\to \cdots \to a_{n-1}\to a_n 和 L_2 = b_1 \to b_2\to \cdots \to b_{m-1}\to b_m。如果 n\ge 2m，你的任务是将比较短的那个链表逆序，然后将之并入比较长的那个链表，得到一个形如 a_1 \to a_2 \to b_{m} \to a_3 \to a_4 \to b_{m-1}\cdots  的结果。例如给定两个链表分别为 6→7 和 1→2→3→4→5，你应该输出 1→2→7→3→4→6→5。
#
# 输入格式：
#   输入首先在第一行中给出两个链表 L_1 和 L_2 的头结点的地址，以及正整数
#   N (\le 10^5)，即给定的结点总数。一个结点的地址是一个 5 位数的非负整数，空地址 NULL 用 `-1` 表示。
#   随后 N 行，每行按以下格式给出一个结点的信息：
#   ```
#   Address Data Next
#   ```
#   其中 `Address` 是结点的地址，`Data` 是不超过 10^5 的正整数，`Next` 是下一个结点的地址。题目保证没有空链表，并且较长的链表至少是较短链表的两倍长。
#
# 输出格式：
#   按顺序输出结果链表，每个结点占一行，格式与输入相同。
#
# 实现原理：
#   - 使用字典(Dict)存储键值对映射
#   - 循环迭代处理
#   - 列表操作
#
# 算法思路：
#   链表处理：使用字典存储节点地址映射，
#   先遍历链表得到节点顺序，
#   再按K个一组进行反转，最后重新连接输出。
#
import sys

h1,h2,n=sys.stdin.readline().split();d={}
for _ in range(int(n)):
 a,x,b=sys.stdin.readline().split();d[a]=(x,b)
def walk(h):
 r=[]
 while h!='-1':r.append(h);h=d[h][1]
 return r
a,b=walk(h1),walk(h2)
if len(a)<len(b):a,b=b,a
out=[]
for i,x in enumerate(a):
 out.append(x)
 if i%2==1 and b:out.append(b.pop())
out+=b[::-1]
for i,x in enumerate(out):print(x,d[x][0],out[i+1] if i+1<len(out) else '-1')
