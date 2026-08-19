# 题目：1109 擅长C
#
# 题目描述：
#   当你被面试官要求用 C 写一个“Hello World”时，有本事像下图显示的那样写一个出来吗？
#   ![HWC.jpg](~/ba3b8678-061d-4fc6-a87e-ce08e1434410.jpg)
#
# 输入格式：
#   输入首先给出 26 个英文大写字母 A-Z，每个字母用一个 7\times 5 的、由 `C` 和 `.` 组成的矩阵构成。最后在一行中给出一个句子，以回车结束。句子是由若干个单词（每个包含不超过 10 个连续的大写英文字母）组成的，单词间以任何非大写英文字母分隔。
#   题目保证至少给出一个单词。
#
# 输出格式：
#   对每个单词，将其每个字母用矩阵形式在一行中输出，字母间有一列空格分隔。单词的首尾不得有多余空格。
#   相邻的两个单词间必须有一空行分隔。输出的首尾不得有多余空行。
#
# 实现原理：
#   - 循环迭代处理
#   - 列表操作
#
# 算法思路：
#   字符串处理：将英文句子转换为C语言风格，
#   处理大小写和特殊格式。
#
import sys,re

glyph=[[sys.stdin.readline().rstrip('\n') for _ in range(7)] for _ in range(26)];words=re.findall('[A-Z]+',sys.stdin.readline())
for wi,w in enumerate(words):
 if wi:print()
 for r in range(7):print(' '.join(glyph[ord(x)-65][r] for x in w))
