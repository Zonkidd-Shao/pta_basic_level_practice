# 题目：1061 判断题
#
# 题目描述：
#   判断题的评判很简单，本题就要求你写个简单的程序帮助老师判题并统计学生们判断题的得分。
#
# 输入格式：
#   输入在第一行给出两个不超过 100 的正整数 N 和 M，分别是学生人数和判断题数量。第二行给出 M 个不超过 5 的正整数，是每道题的满分值。第三行给出每道题对应的正确答案，0 代表“非”，1 代表“是”。随后 N 行，每行给出一个学生的解答。数字间均以空格分隔。
#
# 输出格式：
#   按照输入的顺序输出每个学生的得分，每个分数占一行。
#
# 实现原理：
#   - 循环迭代处理
#   - 列表操作
#
# 算法思路：
#   简单计分：对比正确答案统计得分。
#
import sys

n,m=map(int,sys.stdin.readline().split()); score=list(map(int,sys.stdin.readline().split())); ans=list(map(int,sys.stdin.readline().split()))
for _ in range(n): print(sum(s for x,a,s in zip(map(int,sys.stdin.readline().split()),ans,score) if x==a))
