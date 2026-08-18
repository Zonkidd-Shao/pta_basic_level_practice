# 题目：1115 裁判机
#
# 题目描述：
#   有一种数字游戏的规则如下：首先由裁判给定两个不同的正整数，然后参加游戏的几个人轮流给出正整数。要求给出的数字必须是前面已经出现的某两个正整数之差，且不能等于之前的任何一个数。游戏一直持续若干轮，中间有写重复或写错的人就出局。
#   本题要求你实现这个游戏的裁判机，自动判断每位游戏者给出的数字是否合法，以及最后的赢家。
#
# 输入格式：
#   输入在第一行中给出 2 个初始的正整数，保证都在 [1, 10^5] 范围内且不相同。
#   第二行依次给出参加比赛的人数 N（2\le N\le 10）和每个人都要经历的轮次数 M（2\le M\le 10^3）。
#   以下 N 行，每行给出 M 个正整数。第 i 行对应第 i 个人给出的数字（i=1, \cdots , N）。游戏顺序是从第 1 个人给出第 1 个数字开始，每人顺次在第 1 轮给出自己的第 1 个数字；然后每人顺次在第 2 轮给出自己的第 2 个数字，以此类推。
#
# 输出格式：
#   如果在第 `k` 轮，第 `i` 个人出局，就在一行中输出 `Round #k: i is out.`。出局人后面给出的数字不算；同一轮出局的人按编号增序输出。直到最后一轮结束，在一行中输出 `Winner(s): W1 W2 ... Wn`，其中 `W1 ... Wn` 是最后的赢家编号，按增序输出。数字间以 1 个空格分隔，行末不得有多余空格。如果没有赢家，则输出 `No winner.`。
#
# 实现原理：
#   - 使用集合(Set)进行去重和快速查找
#   - 排序算法
#   - 循环迭代处理
#   - 列表操作
#
# 算法思路：
#   游戏裁判：模拟猜数字游戏的裁判逻辑，
#   根据规则判断玩家回答是否正确。
#
import sys

x,y=map(int,sys.stdin.readline().split());n,m=map(int,sys.stdin.readline().split());a=[list(map(int,sys.stdin.readline().split())) for _ in range(n)];seen={x,y};alive=set(range(n))
for r in range(m):
 out=[];valid={abs(u-v) for u in seen for v in seen if u!=v}
 for i in sorted(alive):
  z=a[i][r]
  if z in seen or z not in valid:out.append(i)
  else:seen.add(z)
 for i in out:alive.remove(i);print(f'Round #{r+1}: {i+1} is out.')
print('Winner(s): '+' '.join(str(i+1) for i in sorted(alive)) if alive else 'No winner.')
