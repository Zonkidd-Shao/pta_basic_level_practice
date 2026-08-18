// 1025 反转链表
// 给定链表首地址、结点总数 N 与正整数 K，将链表中每 K 个结点为一组进行反转，
// 最后不足 K 个的结点保持原序。输出反转后的链表（格式同输入）。
//
// 【实现原理】
// 算法思路：
//   1. 输入所有结点信息，以地址为索引存入数组 nodes[100000]（地址为 5 位非负整数，O(1) 查找）。
//   2. 从首地址开始，沿 next 指针遍历链表，按顺序收集有效结点的地址到 order 数组。
//      （注意：输入中可能存在不在链表上的结点，需要忽略。）
//   3. 对 order 数组进行分组反转：
//      - 每 K 个结点为一组，使用 reverse() 反转该组内的地址顺序。
//      - 最后不足 K 个的组保持原序。
//   4. 根据反转后的 order 顺序输出结果：
//      - 每个结点的 next 地址为 order 中下一个结点的地址（最后一个为 -1）。
// 关键点：
//   - 输入中可能存在多余结点（不在链表上），需要按链表顺序重新收集有效结点。
//   - 反转的是地址顺序，而非实际移动结点数据，高效且简单。
//   - 输出时地址格式为 5 位数字（不足补前导 0），-1 直接输出。
// 时间复杂度：O(N)，遍历链表和反转均为线性时间。
// 空间复杂度：O(N)，存储结点信息和地址顺序。
#include <iostream>
#include <vector>
#include <algorithm>

using namespace std;

struct Node {
    int addr;
    int data;
    int next;
};

int main() {
    int head, n, k;
    if (!(cin >> head >> n >> k)) return 0;

    // 用地址直接作下标，O(1) 查找（地址为 5 位非负整数）
    vector<Node> nodes(100000);
    for (int i = 0; i < n; ++i) {
        int addr, data, next;
        cin >> addr >> data >> next;
        nodes[addr] = {addr, data, next};
    }

    // 按链表顺序收集有效结点地址（忽略不在链上的多余结点）
    vector<int> order;
    int p = head;
    while (p != -1) {
        order.push_back(p);
        p = nodes[p].next;
    }

    int len = (int)order.size();
    // 每 K 个反转一组
    for (int i = 0; i + k <= len; i += k) {
        reverse(order.begin() + i, order.begin() + i + k);
    }

    // 输出，注意下一个地址需指向反转后的后继
    for (int i = 0; i < len; ++i) {
        int addr = order[i];
        int nextAddr = (i + 1 < len) ? order[i + 1] : -1;
        if (nextAddr == -1)
            printf("%05d %d -1\n", addr, nodes[addr].data);
        else
            printf("%05d %d %05d\n", addr, nodes[addr].data, nextAddr);
    }
    return 0;
}