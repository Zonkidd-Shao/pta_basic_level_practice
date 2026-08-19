# 题目：1029 旧键盘
#
# 题目描述：
#
# 输入格式：
#
# 输出格式：
#
# 实现原理：
#   - 使用集合(Set)进行去重和快速查找
#   - 循环迭代处理
#
# 算法思路：
#   字符对比：对比输入字符串和实际输出字符串，
#   找出缺失的字符（坏键）。
#
import sys

a, b = sys.stdin.readline().rstrip('\n'), sys.stdin.readline().rstrip('\n')
seen = set()
for c in a:
    if c not in b and c.upper() not in seen: print(c.upper(), end=''); seen.add(c.upper())
print()
