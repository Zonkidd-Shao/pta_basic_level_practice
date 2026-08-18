// 1075 链表元素分类
//
// 实现原理：
// 给定一个链表（以数组形式存储）和一个分类阈值 K，将链表结点按 data 值重新排列：
//   1. 负值结点排在最前面
//   2. data 在 [0, K] 区间内的结点排在中间
//   3. data > K 的结点排在最后
// 各类内部保持原始链表中的相对顺序不变。
//
// 算法步骤：
// 1. 使用大小为 100000 的数组存储链表结点（地址为索引）
// 2. 从 head 开始遍历链表，按链接顺序收集所有结点地址到 order 数组
// 3. 遍历 order，根据 data 值将结点地址分别放入 neg（负值）、mid（[0,K]）、big（>K）三个向量
// 4. 按 neg → mid → big 的顺序合并结果
// 5. 遍历结果数组，按链表格式输出每个结点的地址、数据和下一结点地址
//
// 注意：
// - 输入中可能包含不在链表中的多余结点，需忽略
// - 地址为 5 位数字，输出时需用 %05d 补零
//
// 复杂度分析：
// 时间复杂度：O(N)，N 为输入结点数（实际链表遍历 + 分类遍历）。
// 空间复杂度：O(MAX_ADDR)，约 100000 的结点数组空间。
#include <iostream>
#include <vector>
#include <cstdio>

using namespace std;

struct Node {
    int addr, data, next;
};

int main() {
    int head, n, k;
    if (!(cin >> head >> n >> k)) return 0;

    // 以地址为索引存储结点（地址范围 0~99999）
    vector<Node> nodes(100000);
    for (int i = 0; i < n; ++i) {
        int a, d, ne;
        cin >> a >> d >> ne;
        nodes[a] = {a, d, ne};
    }

    // 按链表链接顺序收集所有有效结点地址
    vector<int> order;
    for (int p = head; p != -1; p = nodes[p].next) order.push_back(p);

    // 按 data 值分类：负值、[0,K]、>K
    vector<int> neg, mid, big;
    for (int addr : order) {
        int v = nodes[addr].data;
        if (v < 0) neg.push_back(addr);
        else if (v >= 0 && v <= k) mid.push_back(addr);
        else big.push_back(addr);
    }

    // 合并结果：先负值，再 [0,K]，最后 >K
    vector<int> res;
    for (int a : neg) res.push_back(a);
    for (int a : mid) res.push_back(a);
    for (int a : big) res.push_back(a);

    // 输出重排后的链表
    for (size_t i = 0; i < res.size(); ++i) {
        int addr = res[i];
        int nextAddr = (i + 1 < res.size()) ? res[i + 1] : -1;
        if (nextAddr == -1) printf("%05d %d -1\n", addr, nodes[addr].data);
        else printf("%05d %d %05d\n", addr, nodes[addr].data, nextAddr);
    }
    return 0;
}