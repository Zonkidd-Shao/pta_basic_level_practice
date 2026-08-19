# 题目：1032 挖掘机技术哪家强
#
# 题目描述：
#   为了用事实说明挖掘机技术到底哪家强，PAT 组织了一场挖掘机技能大赛。现请你根据比赛结果统计出技术最强的那个学校。
#
# 输入格式：
#   输入在第 1 行给出不超过 10^5 的正整数 N，即参赛人数。随后 N 行，每行给出一位参赛者的信息和成绩，包括其所代表的学校的编号（从 1 开始连续编号）、及其比赛成绩（百分制），中间以空格分隔。
#
# 输出格式：
#   在一行中给出总得分最高的学校的编号、及其总分，中间以空格分隔。题目保证答案唯一，没有并列。
#
# 实现原理：
#   - 使用字典(Dict)存储键值对映射
#   - 循环迭代处理
#   - 列表操作
#
# 算法思路：
#   数组统计：统计每个学校的总分，
#   找出总分最高的学校。
#
import sys
from collections import defaultdict

d = defaultdict(int)
for _ in range(int(sys.stdin.readline())):
    k, v = map(int, sys.stdin.readline().split()); d[k] += v
print(*max(d.items(), key=lambda x: x[1]))
