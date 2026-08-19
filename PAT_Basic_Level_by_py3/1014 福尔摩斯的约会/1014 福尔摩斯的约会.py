# 题目：1014 福尔摩斯的约会
#
# 题目描述：
#   大侦探福尔摩斯接到一张奇怪的字条：
#   ```
#   我们约会吧！
#   3485djDkxh4hhGE
#   2984akDfkkkkggEdsb
#   s&hgsfdk
#   d&Hyscvnm
#   ```
#   大侦探很快就明白了，字条上奇怪的乱码实际上就是约会的时间`星期四 14:04`，因为前面两字符串中第 1 对相同的大写英文字母（大小写有区分）是第 4 个字母 `D`，代表星期四；第 2 对相同的字符是 `E` ，那是第 5 个英文字母，代表一天里的第 14 个钟头（于是一天的 0 点到 23 点由数字 0 到 9、以及大写字母 `A` 到 `N` 表示）；后面两字符串第 1 对相同的英文字母 `s` 出现在第 4 个位置（从 0 开始计数）上，代表第 4 分钟。现给定两对字符串，请帮助福尔摩斯解码得到约会的时间。
#
# 输入格式：
#   输入在 4 行中分别给出 4 个非空、不包含空格、且长度不超过 60 的字符串。
#
# 输出格式：
#   在一行中输出约会的时间，格式为 `DAY HH:MM`，其中 `DAY` 是某星期的 3 字符缩写，即 `MON` 表示星期一，`TUE` 表示星期二，`WED` 表示星期三，`THU` 表示星期四，`FRI` 表示星期五，`SAT` 表示星期六，`SUN` 表示星期日。题目输入保证每个测试存在唯一解。
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

a, b, c, d = [sys.stdin.readline().strip() for _ in range(4)]
days = 'MON TUE WED THU FRI SAT SUN'.split()
found = 0
for x, y in zip(a, b):
    if x == y:
        if found == 0 and 'A' <= x <= 'G': day, found = days[ord(x)-65], 1
        elif found == 1 and (x.isdigit() or 'A' <= x <= 'N'):
            hour = int(x) if x.isdigit() else ord(x) - ord('A') + 10
            break
for i, (x, y) in enumerate(zip(c, d)):
    if x == y and x.isalpha(): minute = i; break
print(f'{day} {hour:02d}:{minute:02d}')
