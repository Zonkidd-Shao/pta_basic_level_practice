/*
 * 题目：1075 链表元素分类
 * 实现原理：
 *   将链表元素按规则重新排列：所有负数排在前面，0到K之间的数排在中间，大于K的数排在最后。
 *   算法步骤：
 *   1. 使用数组模拟链表，nodes[addr]存储节点信息
 *   2. 遍历链表，将所有节点地址存入list数组
 *   3. 分三次遍历list数组：
 *      - 第一次收集负数节点
 *      - 第二次收集0到K之间的节点
 *      - 第三次收集大于K的节点
 *   4. 将结果数组重新连接成链表输出
 */
#include <stdio.h>

struct Node {
    int data;
    int next;
};

int main() {
    struct Node nodes[100000];  // 用地址做下标的数组模拟链表
    int first, N, K;
    scanf("%d %d %d", &first, &N, &K);
    for (int i = 0; i < N; i++) {  // 读入所有节点
        int addr, data, next;
        scanf("%d %d %d", &addr, &data, &next);
        nodes[addr].data = data;
        nodes[addr].next = next;
    }
    int list[100000], count = 0;  // list: 按链表顺序存放各节点地址
    int p = first;
    while (p != -1) {  // 沿 next 指针遍历整条链表
        list[count++] = p;
        p = nodes[p].next;
    }
    int result[100000], idx = 0;  // result: 重排后的节点地址序列
    for (int i = 0; i < count; i++) {  // 第一遍：收集负数节点
        if (nodes[list[i]].data < 0) {
            result[idx++] = list[i];
        }
    }
    for (int i = 0; i < count; i++) {  // 第二遍：收集 [0, K] 区间的节点
        int val = nodes[list[i]].data;
        if (val >= 0 && val <= K) {
            result[idx++] = list[i];
        }
    }
    for (int i = 0; i < count; i++) {  // 第三遍：收集大于 K 的节点
        if (nodes[list[i]].data > K) {
            result[idx++] = list[i];
        }
    }
    for (int i = 0; i < idx - 1; i++) {  // 按新顺序输出，相邻节点地址相连
        printf("%05d %d %05d\n", result[i], nodes[result[i]].data, result[i + 1]);
    }
    printf("%05d %d -1\n", result[idx - 1], nodes[result[idx - 1]].data);  // 最后一个节点指向 -1
    return 0;
}