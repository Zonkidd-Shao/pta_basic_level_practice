# 题目：1054 求平均值
#
# 题目描述：
#   拍集体照时队形很重要，这里对给定的 N 个人 K 排的队形设计排队规则如下：
#   - 每排人数为 N/K（向下取整），多出来的人全部站在最后一排；
#   - 后排所有人的个子都不比前排任何人矮；
#   - 每排中最高者站中间（中间位置为 m/2+1，其中 m 为该排人数，除法向下取整）；
#   - 每排其他人以中间人为轴，按身高非增序，先右后左交替入队站在中间人的两侧（例如5人身高为190、188、186、175、170，则队形为175、188、190、186、170。这里假设你面对拍照者，所以你的左边是中间人的右边）；
#   - 若多人身高相同，则按名字的字典序升序排列。这里保证无重名。
#   现给定一组拍照人，请编写程序输出他们的队形。
#
# 输入格式：
#   每个输入包含 1 个测试用例。每个测试用例第 1 行给出两个正整数 N（\le 10^4，总人数）和 K（\le 10，总排数）。随后 N 行，每行给出一个人的名字（不包含空格、长度不超过 8 个英文字母）和身高（[30, 300] 区间内的整数）。
#
# 输出格式：
#   输出拍照的队形。即K排人名，其间以空格分隔，行末不得有多余空格。注意：假设你面对拍照者，后排的人输出在上方，前排输出在下方。
#
# 实现原理：
#   - 循环迭代处理
#   - 列表操作
#
# 算法思路：
#   合法性检查与数值计算：检查输入是否为合法数字，
#   对合法数字求平均值。
#
import sys

a=sys.stdin.readline().split()[1:]; good=[]
for x in a:
    try:
        v=float(x); ok=-1000<=v<=1000 and ('.' not in x or len(x.split('.')[1])<=2)
    except: ok=False
    if ok: good.append(v)
    else: print(f'ERROR: {x} is not a legal number')
if not good: print('The average of 0 numbers is Undefined')
elif len(good)==1: print(f'The average of 1 number is {good[0]:.2f}')
else: print(f'The average of {len(good)} numbers is {sum(good)/len(good):.2f}')
