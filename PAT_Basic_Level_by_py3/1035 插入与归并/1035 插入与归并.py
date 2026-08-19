# 题目：1035 插入与归并
#
# 题目描述：
#   根据维基百科的定义：
#   **插入排序**是迭代算法，逐一获得输入数据，逐步产生有序的输出序列。每步迭代中，算法从输入序列中取出一元素，将之插入有序序列中正确的位置。如此迭代直到全部元素有序。
#   **归并排序**进行如下迭代操作：首先将原始序列看成 N 个只包含 1 个元素的有序子序列，然后每次迭代归并两个相邻的有序子序列，直到最后只剩下 1 个有序的序列。
#   现给定原始序列和由某排序算法产生的中间序列，请你判断该算法究竟是哪种排序算法？
#
# 输入格式：
#   输入在第一行给出正整数 N (\le100)；随后一行给出原始序列的 N 个整数；最后一行给出由某排序算法产生的中间序列。这里假设排序的目标序列是升序。数字间以空格分隔。
#
# 输出格式：
#   首先在第 1 行中输出`Insertion Sort`表示插入排序、或`Merge Sort`表示归并排序；然后在第 2 行中输出用该排序算法再迭代一轮的结果序列。题目保证每组测试的结果是唯一的。数字间以空格分隔，且行首尾不得有多余空格。
#
# 实现原理：
#   - 排序算法
#   - 循环迭代处理
#   - 列表操作
#
# 算法思路：
#   排序算法判断：模拟插入排序和归并排序过程，
#   判断当前是哪种排序并给出下一步结果。
#
import sys

n = int(sys.stdin.readline()); orig = list(map(int, sys.stdin.readline().split())); target = list(map(int, sys.stdin.readline().split()))
for i in range(1, n):
    a = orig[:]; a[:i+1] = sorted(a[:i+1])
    if a == target:
        a[:i+2] = sorted(a[:i+2]); print('Insertion Sort'); print(*a); break
else:
    step = 1
    while step < n:
        a = sum((sorted(target[i:i+step*2]) for i in range(0, n, step*2)), [])
        if a == target: break
        step *= 2
    step *= 2
    print('Merge Sort'); print(*sum((sorted(target[i:i+step]) for i in range(0,n,step)), []))
