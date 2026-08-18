/*
 * 题目：1025 反转链表
 * 实现原理：
 *   将链表按每k个结点一组进行反转，最后不足k个的部分保持不变。
 *   算法步骤：
 *   1. 使用数组模拟链表存储：nodes[addr]存储data和next
 *   2. 遍历链表，将所有有效结点的地址存入list数组
 *   3. 对list数组中每k个元素进行局部反转（使用首尾交换法）
 *   4. 按反转后的顺序输出链表（格式化地址为5位）
 *   注意：输入可能包含无效结点（不在链表中），需遍历链表过滤。
 */
#include <stdio.h>
#include <stdlib.h>

typedef struct {
    int data;       // 结点数据
    int next;       // 下一结点地址
} Node;

int main() {
    int start, n, k;            // 首结点地址、结点总数、每 k 个一组反转
    scanf("%d %d %d", &start, &n, &k);
    Node nodes[100000];         // 以地址为下标模拟链表存储
    for (int i = 0; i < n; i++) {
        int addr, data, next;
        scanf("%d %d %d", &addr, &data, &next);
        nodes[addr].data = data;
        nodes[addr].next = next;
    }
    int list[100000], len = 0;  // list 按链表顺序收集有效结点地址
    int p = start;
    while (p != -1) {           // 沿 next 指针遍历，过滤不在链表中的无效结点
        list[len++] = p;
        p = nodes[p].next;
    }
    for (int i = 0; i < len - len % k; i += k) {   // 每 k 个一组，末尾不足 k 个的部分不反转
        for (int j = 0; j < k / 2; j++) {          // 组内首尾对调实现反转
            int temp = list[i + j];
            list[i + j] = list[i + k - 1 - j];
            list[i + k - 1 - j] = temp;
        }
    }
    for (int i = 0; i < len - 1; i++) {   // 除末尾结点外输出：地址 数据 下一结点地址
        printf("%05d %d %05d\n", list[i], nodes[list[i]].data, list[i + 1]);
    }
    printf("%05d %d -1\n", list[len - 1], nodes[list[len - 1]].data);   // 尾结点的 next 固定为 -1
    return 0;
}