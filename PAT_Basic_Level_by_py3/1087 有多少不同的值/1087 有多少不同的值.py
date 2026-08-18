# 题目：1087 有多少不同的值
#
# 题目描述：
#   当自然数 n 依次取 1、2、3、……、N 时，算式 \lfloor n/2\rfloor +\lfloor n/3\rfloor +\lfloor n/5\rfloor  有多少个不同的值？（注：\lfloor x\rfloor 为取整函数，表示不超过 x 的最大自然数，即 x 的整数部分。）
#
# 输入格式：
#   输入给出一个正整数 N（2 \le N \le 10^4）。
#
# 输出格式：
#   在一行中输出题面中算式取到的不同值的个数。
#
# 实现原理：
#   - 循环迭代处理
#
# 算法思路：
#   集合去重：计算各种表达式的值，
#   用集合统计不同值的个数。
#
import sys

n=int(sys.stdin.readline());print(len({i//2+i//3+i//5 for i in range(1,n+1)}))
