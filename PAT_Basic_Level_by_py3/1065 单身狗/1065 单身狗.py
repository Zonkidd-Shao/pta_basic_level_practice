# 题目：1065 单身狗
#
# 题目描述：
#   “单身狗”是中文对于单身人士的一种爱称。本题请你从上万人的大型派对中找出落单的客人，以便给予特殊关爱。
#
# 输入格式：
#   输入第一行给出一个正整数 N（\le 50 000），是已知夫妻/伴侣的对数；随后 N 行，每行给出一对夫妻/伴侣——为方便起见，每人对应一个 ID 号，为 5 位数字（从 00000 到 99999），ID 间以空格分隔；之后给出一个正整数 M（\le 10 000），为参加派对的总人数；随后一行给出这 M 位客人的 ID，以空格分隔。题目保证无人重婚或脚踩两条船。
#
# 输出格式：
#   首先第一行输出落单客人的总人数；随后第二行按 ID 递增顺序列出落单的客人。ID 间用 1 个空格分隔，行的首尾不得有多余空格。
#
# 实现原理：
#   - 使用集合(Set)进行去重和快速查找
#   - 使用字典(Dict)存储键值对映射
#   - 排序算法
#   - 循环迭代处理
#   - 列表操作
#
# 算法思路：
#   集合与映射：存储情侣关系，
#   找出派对中单独来的人。
#
import sys

n=int(sys.stdin.readline()); mate={}
for _ in range(n): a,b=sys.stdin.readline().split(); mate[a]=b;mate[b]=a
m=int(sys.stdin.readline()); a=sys.stdin.readline().split(); s=set(a); out=sorted(x for x in a if mate.get(x) not in s)
print(len(out)); print(*out)
