# 题目：1028 人口普查
#
# 题目描述：
#
# 输入格式：
#
# 输出格式：
#
# 实现原理：
#   - 循环迭代处理
#   - 列表操作
#
# 算法思路：
#   日期比较：读取人员出生日期，
#   与有效日期范围比较，统计有效人数并找出最年长和最年轻的。
#
import sys
from datetime import date

n = int(sys.stdin.readline()); lo, hi = date(1814, 9, 6), date(2014, 9, 6); valid = []
for _ in range(n):
    name, d = sys.stdin.readline().split(); d = date(*map(int, d.split('/')))
    if lo <= d <= hi: valid.append((d, name))
if valid: print(len(valid), min(valid)[1], max(valid)[1])
else: print(0)
