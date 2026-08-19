# 题目：1044 火星数字
#
# 题目描述：
#   火星人是以 13 进制计数的：
#   - 地球人的 0 被火星人称为 tret。
#   - 地球人数字 1 到 12 的火星文分别为：jan, feb, mar, apr, may, jun, jly, aug, sep, oct, nov, dec。
#   - 火星人将进位以后的 12 个高位数字分别称为：tam, hel, maa, huh, tou, kes, hei, elo, syy, lok, mer, jou。
#   例如地球人的数字 `29` 翻译成火星文就是 `hel mar`；而火星文 `elo nov` 对应地球数字 `115`。为了方便交流，请你编写程序实现地球和火星数字之间的互译。
#
# 输入格式：
#   输入第一行给出一个正整数 N（<100），随后 N 行，每行给出一个 [0, 169) 区间内的数字 —— 或者是地球文，或者是火星文。
#
# 输出格式：
#   对应输入的每一行，在一行中输出翻译后的另一种语言的数字。
#
# 实现原理：
#   - 循环迭代处理
#   - 列表操作
#
# 算法思路：
#   进制与字符串转换：实现地球数字与火星数字的相互转换，
#   处理13进制和特殊的火星文表示。
#
import sys

low = 'tret jan feb mar apr may jun jly aug sep oct nov dec'.split(); high = 'tam hel maa huh tou kes hei elo syy lok mer jou'.split()
for _ in range(int(sys.stdin.readline())):
    s = sys.stdin.readline().strip()
    if s[0].isdigit():
        n = int(s); print(high[n//13] + ((' ' + low[n%13]) if n%13 else '') if n >= 13 else low[n])
    else:
        a = s.split(); print((high.index(a[0])*13 if a[0] in high else 0) + (low.index(a[-1]) if a[-1] in low else 0))
