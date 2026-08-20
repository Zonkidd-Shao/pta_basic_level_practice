/*
 * 1110 区块反转
 *
 * 【实现原理】
 * 题目给定一个单链表和一个整数 K，要求将链表每 K 个结点分为一块，
 * 反转"块"的顺序（即块与块之间交换位置，块内结点保持原有顺序），
 * 最后输出反转后的链表。
 *
 * 【算法思路】
 * 1. 使用固定大小数组（100000）以地址为下标存储所有结点。
 * 2. 从头结点开始遍历链表，将结点地址按原始顺序收集到 order 数组中。
 * 3. 将 order 按每 K 个结点一组（最后一块可能不足 K 个）切分成多个块。
 * 4. 反转各块的顺序（即块整体位置反转）。
 * 5. 将反转后的块按顺序重新拼接，得到新的结点序列。
 * 6. 按新序列顺序输出结点（地址、数据、下一结点地址）。
 *
 * 【复杂度分析】
 * - 时间复杂度：O(N)，遍历链表一次，分块和反转操作均为 O(N)。
 * - 空间复杂度：O(N + 100000)，存储结点信息和序列。
 */
#include <iostream>
#include <vector>
#include <algorithm>
#include <cstdio>

using namespace std;

struct Node {
    int addr, data, next;  // 结点地址、数据、下一结点地址
};

int main() {
    int head, n, k;
    if (!(cin >> head >> n >> k)) return 0;

    vector<Node> nodes(100000);                  // 以地址为下标存储结点
    for (int i = 0; i < n; ++i) {
        int a, d, ne; cin >> a >> d >> ne; nodes[a] = {a, d, ne};
    }

    vector<int> order;
    // 遍历链表，按原始顺序收集结点地址
    for (int p = head; p != -1; p = nodes[p].next) order.push_back(p);

    // 将 order 按每 K 个结点分为一块
    vector<vector<int>> blocks;
    for (size_t i = 0; i < order.size(); i += k)
        blocks.emplace_back(order.begin() + i, order.begin() + i + min((size_t)k, order.size() - i));
    reverse(blocks.begin(), blocks.end());       // 反转块顺序

    vector<int> res;
    // 将反转后的块重新拼接为序列
    for (auto& b : blocks) for (int x : b) res.push_back(x);

    // 输出反转后的链表
    for (size_t i = 0; i < res.size(); ++i) {
        int addr = res[i];
        int nextAddr = (i + 1 < res.size()) ? res[i + 1] : -1;
        if (nextAddr == -1) printf("%05d %d -1\n", addr, nodes[addr].data);
        else printf("%05d %d %05d\n", addr, nodes[addr].data, nextAddr);
    }
    return 0;
}