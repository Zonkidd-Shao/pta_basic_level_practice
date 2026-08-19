/*
 * 题目：1110 区块反转
 * 实现原理：
 *   将链表按每K个节点为一个区块进行反转。如果最后不足K个节点，则保持原序。
 *   反转规则：将所有区块整体逆序，每个区块内部保持原序。
 *   算法步骤：
 *   1. 使用数组模拟链表，nodes[addr]存储节点信息
 *   2. 将链表节点按顺序存入list数组
 *   3. 如果有剩余节点（不足K个），先将剩余节点放入结果
 *   4. 从最后一个区块开始，依次将每个区块的节点放入结果
 *   5. 输出结果链表
 */
#include <stdio.h>
#include <stdlib.h>

typedef struct {
    int address;    // 节点地址
    int data;       // 节点数据
    int next;       // 下一节点地址
} Node;

int main() {
    int start, N, K;
    scanf("%d %d %d", &start, &N, &K);  // 读入头节点地址、节点总数、区块大小
    Node nodes[100000];                 // 以地址为下标的节点表
    for (int i = 0; i < N; i++) {
        int addr, data, next;
        scanf("%d %d %d", &addr, &data, &next); // 读入节点地址、数据、后继地址
        nodes[addr].address = addr;
        nodes[addr].data = data;
        nodes[addr].next = next;
    }
    Node list[100000];      // 按链表顺序存储节点
    int cnt = 0;            // 链表实际长度
    int cur = start;
    while (cur != -1) {     // 沿 next 遍历整条链表
        list[cnt++] = nodes[cur];
        cur = nodes[cur].next;
    }
    Node result[100000];    // 反转后的结果链表
    int idx = 0;
    int blocks = cnt / K;       // 完整区块数
    int remainder = cnt % K;    // 末尾不足 K 个的剩余节点数
    if (remainder > 0) {        // 剩余节点保持原序，先放入结果（反转后位于最前）
        for (int i = cnt - remainder; i < cnt; i++) {
            result[idx++] = list[i];
        }
    }
    for (int i = blocks - 1; i >= 0; i--) { // 从最后一个区块往前，每个区块内部保持原序
        for (int j = 0; j < K; j++) {
            result[idx++] = list[i * K + j];
        }
    }
    for (int i = 0; i < idx - 1; i++) {     // 输出合并结果，地址按 5 位补齐
        printf("%05d %d %05d\n", result[i].address, result[i].data, result[i + 1].address);
    }
    printf("%05d %d -1\n", result[idx - 1].address, result[idx - 1].data);   // 尾节点后继为 -1
    return 0;
}