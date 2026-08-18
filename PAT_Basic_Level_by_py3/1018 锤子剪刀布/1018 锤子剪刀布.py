# 题目：1018 锤子剪刀布
#
# 题目描述：
#   大家应该都会玩“锤子剪刀布”的游戏：两人同时给出手势，胜负规则如图所示：
#   ![alt text](image.png)
#   现给出两人的交锋记录，请统计双方的胜、平、负次数，并且给出双方分别出什么手势的胜算最大。
#
# 输入格式：
#   输入第 1 行给出正整数 N（\le 10^5），即双方交锋的次数。随后 N 行，每行给出一次交锋的信息，即甲、乙双方同时给出的的手势。`C` 代表“锤子”、`J` 代表“剪刀”、`B` 代表“布”，第 1 个字母代表甲方，第 2 个代表乙方，中间有 1 个空格。
#
# 输出格式：
#   输出第 1、2 行分别给出甲、乙的胜、平、负次数，数字间以 1 个空格分隔。第 3 行给出两个字母，分别代表甲、乙获胜次数最多的手势，中间有 1 个空格。如果解不唯一，则输出按字母序最小的解。
#
# 实现原理：
#   - 循环迭代处理
#   - 列表操作
#
# 算法思路：
#   根据题目要求进行数据处理和计算，
#   使用适当的数据结构和算法提高效率。
#
import sys

win = {'C':'J', 'J':'B', 'B':'C'}
n = int(sys.stdin.readline()); wa = wb = 0; ca = dict.fromkeys('BCJ', 0); cb = dict.fromkeys('BCJ', 0)
for _ in range(n):
    a, b = sys.stdin.readline().split()
    if a == b: continue
    if win[a] == b: wa += 1; ca[a] += 1
    else: wb += 1; cb[b] += 1
print(wa, n-wa-wb, wb); print(wb, n-wa-wb, wa)
print(max(ca, key=lambda x: (ca[x], -'BCJ'.index(x))), max(cb, key=lambda x: (cb[x], -'BCJ'.index(x))))
