# 题目：1025 反转链表
#
# 题目描述：
#   给定一个常数 K 以及一个单链表 L，请编写程序将 L 中每 K 个结点反转。例如：给定 L 为 1→2→3→4→5→6，K 为 3，则输出应该为 3→2→1→6→5→4；如果 K 为 4，则输出应该为 4→3→2→1→5→6，即最后不到 K 个元素不反转。
#
# 输入格式：
#   每个输入包含 1 个测试用例。每个测试用例第 1 行给出第 1 个结点的地址、结点总个数正整数 N (\le 10^5)、以及正整数 K (\le N)，即要求反转的子链结点的个数。结点的地址是 5 位非负整数，NULL 地址用 -1 表示。
#   接下来有 N 行，每行格式为：
#   ```
#   Address Data Next
#   ```
#   其中 `Address` 是结点地址，`Data` 是该结点保存的整数数据，`Next` 是下一结点的地址。
#
# 输出格式：
#   对每个测试用例，顺序输出反转后的链表，其上每个结点占一行，格式与输入相同。
#
# 实现原理：
#   - 使用字典(Dict)存储键值对映射
#   - 循环迭代处理
#   - 列表操作
#
# 算法思路：
#   链表处理：使用字典存储节点地址映射，
#   先遍历链表得到节点顺序，
#   再按K个一组进行反转，最后重新连接输出。
#
import sys

head, n, k = sys.stdin.readline().split(); n, k = int(n), int(k)
nodes = {}
for _ in range(n):
    addr, data, nxt = sys.stdin.readline().split(); nodes[addr] = (data, nxt)
order = []
while head != '-1': order.append(head); head = nodes[head][1]
for i in range(0, len(order) - k + 1, k): order[i:i+k] = reversed(order[i:i+k])
for i, addr in enumerate(order): print(addr, nodes[addr][0], order[i+1] if i+1 < len(order) else '-1')
