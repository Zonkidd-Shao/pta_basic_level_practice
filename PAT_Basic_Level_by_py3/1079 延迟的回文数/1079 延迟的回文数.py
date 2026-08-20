# 题目：1079 延迟的回文数
#
# 题目描述：
#   给定一个 k+1 位的正整数 N，写成 a_k \cdots a_1 a_0 的形式，其中对所有 i 有 0 \le a_i < 10 且 a_k > 0。N 被称为一个**回文数**，当且仅当对所有 i 有 a_i = a_{k-i}。零也被定义为一个回文数。
#   非回文数也可以通过一系列操作变出回文数。首先将该数字逆转，再将逆转数与该数相加，如果和还不是一个回文数，就重复这个逆转再相加的操作，直到一个回文数出现。如果一个非回文数可以变出回文数，就称这个数为**延迟的回文数**。（定义翻译自 https://en.wikipedia.org/wiki/Palindromic_number ）
#   给定任意一个正整数，本题要求你找到其变出的那个回文数。
#
# 输入格式：
#   输入在一行中给出一个不超过1000位的正整数。
#
# 输出格式：
#   对给定的整数，一行一行输出其变出回文数的过程。每行格式如下
#   ```
#   A + B = C
#   ```
#   其中 `A` 是原始的数字，`B` 是 `A` 的逆转数，`C` 是它们的和。`A` 从输入的整数开始。重复操作直到 `C` 在 10 步以内变成回文数，这时在一行中输出 `C is a palindromic number.`；或者如果 10 步都没能得到回文数，最后就在一行中输出 `Not found in 10 iterations.`。
#
# 实现原理：
#   - 循环迭代处理
#   - 列表操作
#
# 算法思路：
#   回文判断与大数加法：逐次将数与其反转相加，
#   直到得到回文数或达到步数上限。
#
import sys

n=sys.stdin.readline().strip()
for i in range(10):
 r=n[::-1]
 if n==r: print(n,'is a palindromic number.');break
 print(n,'+',r,'=',int(n)+int(r));n=str(int(n)+int(r))
else:
 if n==n[::-1]: print(n,'is a palindromic number.')
 else: print('Not found in 10 iterations.')
