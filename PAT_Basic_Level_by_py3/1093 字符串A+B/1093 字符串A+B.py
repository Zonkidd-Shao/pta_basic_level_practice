# 题目：1093 字符串A+B
#
# 题目描述：
#   给定两个字符串 A 和 B，本题要求你输出 A+B，即两个字符串的并集。要求先输出 A，再输出 B，但**重复的字符必须被剔除**。
#
# 输入格式：
#   输入在两行中分别给出 A 和 B，均为长度不超过 10^6的、由可见 ASCII 字符 (即码值为32~126)和空格组成的、由回车标识结束的非空字符串。
#
# 输出格式：
#   在一行中输出题面要求的 A 和 B 的和。
#
# 实现原理：
#   - 使用集合(Set)进行去重和快速查找
#   - 循环迭代处理
#
# 算法思路：
#   字符串处理：读取两个字符串，
#   进行字符串拼接或数字运算处理。
#
import sys

s=sys.stdin.readline().rstrip('\n')+sys.stdin.readline().rstrip('\n');seen=set()
print(''.join(x for x in s if not (x in seen or seen.add(x))))
