# 题目：1059 C语言竞赛
#
# 题目描述：
#   C 语言竞赛是浙江大学计算机学院主持的一个欢乐的竞赛。既然竞赛主旨是为了好玩，颁奖规则也就制定得很滑稽：
#   - 0、冠军将赢得一份“神秘大奖”（比如很巨大的一本学生研究论文集……）。
#   - 1、排名为素数的学生将赢得最好的奖品 —— 小黄人玩偶！
#   - 2、其他人将得到巧克力。
#   给定比赛的最终排名以及一系列参赛者的 ID，你要给出这些参赛者应该获得的奖品。
#
# 输入格式：
#   输入第一行给出一个正整数 N（\le 10^4），是参赛者人数。随后 N 行给出最终排名，每行按排名顺序给出一位参赛者的 ID（4 位数字组成）。接下来给出一个正整数 K 以及 K 个需要查询的 ID。
#
# 输出格式：
#   对每个要查询的 ID，在一行中输出 `ID: 奖品`，其中奖品或者是 `Mystery Award`（神秘大奖）、或者是 `Minion`（小黄人）、或者是 `Chocolate`（巧克力）。如果所查 ID 根本不在排名里，打印 `Are you kidding?`（耍我呢？）。如果该 ID 已经查过了（即奖品已经领过了），打印 `ID: Checked`（不能多吃多占）。
#
# 实现原理：
#   - 使用集合(Set)进行去重和快速查找
#   - 循环迭代处理
#   - 列表操作
#
# 算法思路：
#   排名与查询：根据分数排名，
#   处理同分同名次的情况。
#
import sys

def is_prime(x):
    if x < 2:
        return False
    for divisor in range(2, int(x ** 0.5) + 1):
        if x % divisor == 0:
            return False
    return True


n = int(sys.stdin.readline())
rank = {sys.stdin.readline().strip(): i for i in range(1, n + 1)}
seen = set()
for _ in range(int(sys.stdin.readline())):
    x=sys.stdin.readline().strip()
    if x not in rank:
        print(f'{x}: Are you kidding?')
    elif x in seen:
        print(f'{x}: Checked')
    else:
        position = rank[x]
        award = (
            'Mystery Award' if position == 1
            else 'Minion' if is_prime(position)
            else 'Chocolate'
        )
        print(f'{x}: {award}')
        seen.add(x)
