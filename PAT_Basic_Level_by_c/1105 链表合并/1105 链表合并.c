/*
 * 题目：1105 链表合并
 * 实现原理：
 *   将两个链表合并，规则如下：
 *   1. 将较短的链表反转
 *   2. 将反转后的短链表插入到长链表的第2、4、6...个节点后面
 *   算法步骤：
 *   1. 使用数组模拟链表，nodes[addr]存储节点信息
 *   2. 遍历两个链表，将节点按顺序存入list1和list2
 *   3. 确定长链表和短链表
 *   4. 反转短链表的前半部分
 *   5. 合并：遍历长链表，每两个节点后插入一个短链表节点
 *   6. 输出合并后的链表
 */
#include <stdio.h>
#include <string.h>

typedef struct {
    char address[10];   // 节点地址
    int data;           // 节点数据
    char next[10];      // 下一节点地址
} Node;

Node nodes[100000];     // 以地址为下标的节点表，模拟链表存储

int main() {
    char head1[10], head2[10];
    int N;
    scanf("%s %s %d", head1, head2, &N);    // 读入两条链表头地址和节点总数
    for (int i = 0; i < N; i++) {
        char addr[10], next[10];
        int data;
        scanf("%s %d %s", addr, &data, next);   // 读入节点地址、数据、后继地址
        int idx = atoi(addr);
        strcpy(nodes[idx].address, addr);
        nodes[idx].data = data;
        strcpy(nodes[idx].next, next);
    }
    Node list1[100000], list2[100000];  // 按链表顺序存放两条链表的节点
    int len1 = 0, len2 = 0;             // 两条链表的长度
    char cur[10];
    strcpy(cur, head1);
    while (strcmp(cur, "-1") != 0) {    // 沿 next 指针遍历第一条链表
        int idx = atoi(cur);
        list1[len1++] = nodes[idx];
        strcpy(cur, nodes[idx].next);
    }
    strcpy(cur, head2);
    while (strcmp(cur, "-1") != 0) {    // 沿 next 指针遍历第二条链表
        int idx = atoi(cur);
        list2[len2++] = nodes[idx];
        strcpy(cur, nodes[idx].next);
    }
    Node *long_list, *short_list;   // 长链表与短链表指针
    int long_len, short_len;
    if (len1 >= len2) {             // 确定哪个是长链表、哪个是短链表
        long_list = list1;
        long_len = len1;
        short_list = list2;
        short_len = len2;
    } else {
        long_list = list2;
        long_len = len2;
        short_list = list1;
        short_len = len1;
    }
    for (int i = 0; i < short_len / 2; i++) {   // 反转短链表
        Node t = short_list[i];
        short_list[i] = short_list[short_len - 1 - i];
        short_list[short_len - 1 - i] = t;
    }
    Node merged[200000];    // 合并后的链表
    int p = 0, q = 0;       // p 指向合并数组，q 指向短链表
    for (int i = 0; i < long_len; i++) {
        merged[p++] = long_list[i];
        if ((i + 1) % 2 == 0 && q < short_len) {    // 每两个长链表节点后插入一个短链表节点
            merged[p++] = short_list[q++];
        }
    }
    for (int i = 0; i < p - 1; i++) {
        printf("%s %d %s\n", merged[i].address, merged[i].data, merged[i + 1].address);
    }
    printf("%s %d -1\n", merged[p - 1].address, merged[p - 1].data);   // 尾节点后继为 -1
    return 0;
}