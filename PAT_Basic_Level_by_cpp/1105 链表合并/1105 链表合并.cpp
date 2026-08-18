/*
 * 1105 链表合并
 *
 * 【实现原理】
 * 题目给定两个单链表，每个结点由地址（5 位整数）、数据、下一结点地址三部分组成。
 * 要求将两个链表的所有结点按地址（数值）升序排序，合并成一个新链表并输出。
 *
 * 【算法思路】
 * 1. 使用大小固定的数组（100000）存储所有结点，以地址为下标直接存取。
 * 2. 分别从两个链表的头结点开始遍历，将每个结点的地址按原始顺序收集到 order 数组中。
 * 3. 对 order 数组按地址数值升序排序。
 * 4. 遍历排序后的 order 数组，依次输出每个结点的地址、数据、下一个结点的地址。
 *    最后一个结点的 next 指向 -1。
 *
 * 【复杂度分析】
 * - 时间复杂度：O(N + M + (N+M)log(N+M))，其中 N 和 M 分别为两个链表的长度，
 *   排序时间占主导。
 * - 空间复杂度：O(100000) ≈ O(1)，使用固定大小的数组存储结点。
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
    int h1, n1, h2, n2;
    if (!(cin >> h1 >> n1 >> h2 >> n2)) return 0;

    vector<Node> nodes(100000);                  // 以地址为下标存储结点
    for (int i = 0; i < n1; ++i) {
        int a, d, ne; cin >> a >> d >> ne; nodes[a] = {a, d, ne};
    }
    for (int i = 0; i < n2; ++i) {
        int a, d, ne; cin >> a >> d >> ne; nodes[a] = {a, d, ne};
    }

    vector<int> order;
    // 遍历第一个链表，按原始顺序收集结点地址
    for (int p = h1; p != -1; p = nodes[p].next) order.push_back(p);
    // 遍历第二个链表，按原始顺序收集结点地址
    for (int p = h2; p != -1; p = nodes[p].next) order.push_back(p);
    sort(order.begin(), order.end());            // 按地址升序排序

    // 按合并后的顺序输出链表
    for (size_t i = 0; i < order.size(); ++i) {
        int addr = order[i];
        int nextAddr = (i + 1 < order.size()) ? order[i + 1] : -1;
        if (nextAddr == -1) printf("%05d %d -1\n", addr, nodes[addr].data);
        else printf("%05d %d %05d\n", addr, nodes[addr].data, nextAddr);
    }
    return 0;
}