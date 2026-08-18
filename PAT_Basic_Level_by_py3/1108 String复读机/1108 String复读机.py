# 题目：1108 String复读机
#
# 题目描述：
#   给定一个长度不超过 10^4 的、仅由英文字母构成的字符串。请将字符重新调整顺序，按 `StringString....` （注意区分大小写）这样的顺序输出，并忽略其它字符。当然，六种字符的个数不一定是一样多的，若某种字符已经输出完，则余下的字符仍按 `String` 的顺序打印，直到所有字符都被输出。例如 `gnirtSSs` 要调整成 `StringS` 输出，其中 `s` 是多余字符被忽略。
#
# 输入格式：
#   输入在一行中给出一个长度不超过 10^4 的、仅由英文字母构成的非空字符串。
#
# 输出格式：
#   在一行中按题目要求输出排序后的字符串。题目保证输出非空。
#
# 实现原理：
#   - 循环迭代处理
#   - 列表操作
#
# 算法思路：
#   字符串匹配：按顺序从原字符串中选取字符，
#   看能组成多少个目标字符串。
#
import sys
from collections import Counter

c=Counter(sys.stdin.readline().strip());out=[]
while any(c[x] for x in 'String'):
 for x in 'String':
  if c[x]:out.append(x);c[x]-=1
print(''.join(out))
