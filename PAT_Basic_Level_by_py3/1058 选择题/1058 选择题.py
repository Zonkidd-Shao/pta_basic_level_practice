# 题目：1058 选择题
#
# 题目描述：
#   批改多选题是比较麻烦的事情，本题就请你写个程序帮助老师批改多选题，并且指出哪道题错的人最多。
#
# 输入格式：
#   输入在第一行给出两个正整数 N（\le 1000）和 M（\le 100），分别是学生人数和多选题的个数。随后 M 行，每行顺次给出一道题的满分值（不超过 5 的正整数）、选项个数（不少于 2 且不超过 5 的正整数）、正确选项个数（不超过选项个数的正整数）、所有正确选项。注意每题的选项从小写英文字母 a 开始顺次排列。各项间以 1 个空格分隔。最后 N 行，每行给出一个学生的答题情况，其每题答案格式为 `(选中的选项个数 选项1 ……)`，按题目顺序给出。注意：题目保证学生的答题情况是合法的，即不存在选中的选项数超过实际选项数的情况。
#
# 输出格式：
#   按照输入的顺序给出每个学生的得分，每个分数占一行。注意判题时只有选择全部正确才能得到该题的分数。最后一行输出错得最多的题目的错误次数和编号（题目按照输入的顺序从 1 开始编号）。如果有并列，则按编号递增顺序输出。数字间用空格分隔，行首尾不得有多余空格。如果所有题目都没有人错，则在最后一行输出 `Too simple`。
#
# 实现原理：
#   - 循环迭代处理
#   - 列表操作
#
# 算法思路：
#   题目批改：读取正确答案和学生答案，
#   对比判断对错并统计错题。
#
import sys

n,m=map(int,sys.stdin.readline().split()); q=[list(map(int,sys.stdin.readline().split())) for _ in range(m)]; wrong=[0]*m; best=0
for _ in range(n):
    x=list(map(int,sys.stdin.readline().split())); score=0
    for i,(v,_,cnt,*ans) in enumerate(q):
        if x[i+1:i+1+x[i]]==ans: score+=v
        else: wrong[i]+=1
    print(score); best=max(best,*wrong)
print('Too simple' if best==0 else ' '.join(str(i+1) for i,x in enumerate(wrong) if x==best))
