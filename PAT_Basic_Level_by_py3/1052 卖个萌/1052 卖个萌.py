# 题目：1052 卖个萌
#
# 题目描述：
#   萌萌哒表情符号通常由“手”、“眼”、“口”三个主要部分组成。简单起见，我们假设一个表情符号是按下列格式输出的：
#   ```
#   [左手]([左眼][口][右眼])[右手]
#   ```
#   现给出可选用的符号集合，请你按用户的要求输出表情。
#
# 输入格式：
#   输入首先在前三行顺序对应给出手、眼、口的可选符号集。每个符号括在一对方括号 `[]`内。题目保证每个集合都至少有一个符号，并不超过 10 个符号；每个符号包含 1 到 4 个非空字符。
#   之后一行给出一个正整数 K，为用户请求的个数。随后 K 行，每行给出一个用户的符号选择，顺序为左手、左眼、口、右眼、右手——这里只给出符号在相应集合中的序号（从 1 开始），数字间以空格分隔。
#
# 输出格式：
#   对每个用户请求，在一行中输出生成的表情。若用户选择的序号不存在，则输出 `Are you kidding me? @\/@`。
#
# 实现原理：
#   - 循环迭代处理
#   - 列表操作
#
# 算法思路：
#   字符串处理：解析表情符号，
#   根据用户输入组装输出结果。
#
import re
import sys

hands = re.findall(r'\[([^\]]*)\]', sys.stdin.readline())
eyes = re.findall(r'\[([^\]]*)\]', sys.stdin.readline())
mouths = re.findall(r'\[([^\]]*)\]', sys.stdin.readline())

for _ in range(int(sys.stdin.readline())):
    left_hand, left_eye, mouth, right_eye, right_hand = map(
        int, sys.stdin.readline().split()
    )
    if (
        1 <= left_hand <= len(hands)
        and 1 <= right_hand <= len(hands)
        and 1 <= left_eye <= len(eyes)
        and 1 <= right_eye <= len(eyes)
        and 1 <= mouth <= len(mouths)
    ):
        print(
            hands[left_hand - 1]
            + '('
            + eyes[left_eye - 1]
            + mouths[mouth - 1]
            + eyes[right_eye - 1]
            + ')'
            + hands[right_hand - 1]
        )
    else:
        print('Are you kidding me? @\\/@')
