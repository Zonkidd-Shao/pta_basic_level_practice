# 题目：1080 MOOC期终成绩
#
# 题目描述：
#   对于在中国大学MOOC（http://www.icourse163.org/ ）学习“数据结构”课程的学生，想要获得一张合格证书，必须首先获得不少于200分的在线编程作业分，然后总评获得不少于60分（满分100）。总评成绩的计算公式为 G = (G_{mid-term}\times 40\% + G_{final}\times 60\%)，如果 G_{mid-term} > G_{final}；否则总评 G 就是 G_{final}。这里 G_{mid-term} 和 G_{final} 分别为学生的期中和期末成绩。
#   现在的问题是，每次考试都产生一张独立的成绩单。本题就请你编写程序，把不同的成绩单合为一张。
#
# 输入格式：
#   输入在第一行给出3个整数，分别是 P（做了在线编程作业的学生数）、M（参加了期中考试的学生数）、N（参加了期末考试的学生数）。每个数都不超过10000。
#   接下来有三块输入。第一块包含 P 个在线编程成绩 G_p；第二块包含 M 个期中考试成绩 G_{mid-term}；第三块包含 N 个期末考试成绩 G_{final}。每个成绩占一行，格式为：`学生学号 分数`。其中`学生学号`为不超过20个字符的英文字母和数字；`分数`是非负整数（编程总分最高为900分，期中和期末的最高分为100分）。
#
# 输出格式：
#   打印出获得合格证书的学生名单。每个学生占一行，格式为：
#   `学生学号` G_p G_{mid-term} G_{final} G
#   如果有的成绩不存在（例如某人没参加期中考试），则在相应的位置输出“-1”。输出顺序为按照总评分数（四舍五入精确到整数）递减。若有并列，则按学号递增。题目保证学号没有重复，且至少存在1个合格的学生。
#
# 实现原理：
#   - 使用字典(Dict)存储键值对映射
#   - 排序算法
#   - 循环迭代处理
#   - 列表操作
#
# 算法思路：
#   成绩计算与排序：根据平时分、期中、期末成绩计算总评，
#   筛选及格学生并按总评排序。
#
import sys

p,m,n=map(int,sys.stdin.readline().split()); d={}
for _ in range(p):a,b=sys.stdin.readline().split();d[a]=[int(b),-1,-1]
for _ in range(m):a,b=sys.stdin.readline().split();d.setdefault(a,[-1,-1,-1])[1]=int(b)
for _ in range(n):a,b=sys.stdin.readline().split();d.setdefault(a,[-1,-1,-1])[2]=int(b)
ans=[]
for a,(g,mid,fin) in d.items():
 final=fin if mid<=fin else int(mid*.4+fin*.6+.5)
 if g>=200 and final>=60:ans.append((a,g,mid,fin,final))
for x in sorted(ans,key=lambda x:(-x[-1],x[0])):print(*x)
