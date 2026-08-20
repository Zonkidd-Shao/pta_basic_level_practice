# 题目：1081 检查密码
#
# 题目描述：
#   本题要求你帮助某网站的用户注册模块写一个密码合法性检查的小功能。该网站要求用户设置的密码必须由不少于6个字符组成，并且只能有英文字母、数字和小数点 `.`，还必须既有字母也有数字。
#
# 输入格式：
#   输入第一行给出一个正整数 N（\le 100），随后 N 行，每行给出一个用户设置的密码，为不超过 80 个字符的非空字符串，以回车结束。
#   **注意：** 题目保证不存在只有小数点的输入。
#
# 输出格式：
#   对每个用户的密码，在一行中输出系统反馈信息，分以下5种：
#   - 如果密码合法，输出`Your password is wan mei.`；
#   - 如果密码太短，不论合法与否，都输出`Your password is tai duan le.`；
#   - 如果密码长度合法，但存在不合法字符，则输出`Your password is tai luan le.`；
#   - 如果密码长度合法，但只有字母没有数字，则输出`Your password needs shu zi.`；
#   - 如果密码长度合法，但只有数字没有字母，则输出`Your password needs zi mu.`。
#
# 实现原理：
#   - 循环迭代处理
#
# 算法思路：
#   密码强度验证：检查密码长度、字符类型等条件，
#   判断密码是否符合要求。
#
import sys

for _ in range(int(sys.stdin.readline())):
 s=sys.stdin.readline().rstrip('\n')
 # 保留行首空格？密码以回车结束，strip 会去掉首尾空格但题目密码可含空格？按题意用 rstrip('\n')后不用strip，非法字符包含空格需判断；此处用 rstrip('\n') 后若用strip会误删。这里按原逻辑用 rstrip('\n') 的原始串判断，但长度判断需按原串？PAT题中密码不含首尾空格，用strip不影响；保留原实现但修正合法字符判断
 if len(s)<6:print('Your password is tai duan le.')
 elif not all(c.isalnum() or c=='.' for c in s):print('Your password is tai luan le.')
 elif not any(x.isalpha() for x in s):print('Your password needs zi mu.')
 elif not any(x.isdigit() for x in s):print('Your password needs shu zi.')
 else:print('Your password is wan mei.')
