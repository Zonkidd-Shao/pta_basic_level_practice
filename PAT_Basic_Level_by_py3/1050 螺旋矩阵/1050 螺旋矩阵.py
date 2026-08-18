# 题目：1050 螺旋矩阵
#
# 题目描述：
#   本题要求将给定的 N 个正整数按非递增的顺序，填入“螺旋矩阵”。所谓“螺旋矩阵”，是指从左上角第 1 个格子开始，按顺时针螺旋方向填充。要求矩阵的规模为 m 行 n 列，满足条件：m\times n 等于 N；m\ge n；且 m-n 取所有可能值中的最小值。
#
# 输入格式：
#   输入在第 1 行中给出一个正整数 N，第 2 行给出 N 个待填充的正整数。所有数字不超过 10^4，相邻数字以空格分隔。
#
# 输出格式：
#   输出螺旋矩阵。每行 n 个数字，共 m 行。相邻数字以 1 个空格分隔，行末不得有多余空格。
#
# 实现原理：
#   - 排序算法
#   - 循环迭代处理
#   - 列表操作
#
# 算法思路：
#   模拟法：按顺时针方向模拟螺旋填充过程，
#   维护上下左右四个边界。
#
import sys, math

data=list(map(int,sys.stdin.read().split())); n=data[0]; a=sorted(data[1:],reverse=True); m=math.ceil(math.sqrt(n))
while n%m: m+=1
q=[[0]*m for _ in range(n//m)]
idx=0
top,left,bot,right=0,0,len(q)-1,m-1
while idx<n:
    for j in range(left,right+1): q[top][j]=a[idx]; idx+=1
    top+=1
    for i in range(top,bot+1): q[i][right]=a[idx]; idx+=1
    right-=1
    if top<=bot:
        for j in range(right,left-1,-1): q[bot][j]=a[idx]; idx+=1
        bot-=1
    if left<=right:
        for i in range(bot,top-1,-1): q[i][left]=a[idx]; idx+=1
        left+=1
for row in q: print(*row)
