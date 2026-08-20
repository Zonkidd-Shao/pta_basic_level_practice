/*
 * 题目：1105 链表合并
 * 实现原理：
 *   将两个链表合并，规则如下：
 *   1. 将较短的链表反转
 *   2. 将反转后的短链表间隔插入到长链表的第2、4、6...个节点后面
 */
#include <stdio.h>
#include <string.h>
#include <stdlib.h>

typedef struct {
    char address[6];
    int data;
    char next[6];
} Node;

Node nodes[100000];

int main() {
    char head1[6], head2[6];
    int N;
    scanf("%s %s %d", head1, head2, &N);
    for (int i = 0; i < N; i++) {
        char addr[6], nxt[6];
        int data;
        scanf("%s %d %s", addr, &data, nxt);
        int idx = atoi(addr);
        if (idx < 0 || idx >= 100000) continue;
        strncpy(nodes[idx].address, addr, 5);
        nodes[idx].address[5] = '\0';
        nodes[idx].data = data;
        strncpy(nodes[idx].next, nxt, 5);
        nodes[idx].next[5] = '\0';
        // 处理 -1 情况：strncpy 会复制 "-1"
        if (strcmp(nxt, "-1") == 0) strcpy(nodes[idx].next, "-1");
    }
    Node list1[100000], list2[100000];
    int len1 = 0, len2 = 0;
    char cur[6];
    strcpy(cur, head1);
    while (strcmp(cur, "-1") != 0) {
        int idx = atoi(cur);
        if (idx < 0 || idx >= 100000) break;
        list1[len1++] = nodes[idx];
        strcpy(cur, nodes[idx].next);
        if (len1 >= 100000) break;
    }
    strcpy(cur, head2);
    while (strcmp(cur, "-1") != 0) {
        int idx = atoi(cur);
        if (idx < 0 || idx >= 100000) break;
        list2[len2++] = nodes[idx];
        strcpy(cur, nodes[idx].next);
        if (len2 >= 100000) break;
    }
    Node *long_list, *short_list;
    int long_len, short_len;
    if (len1 >= len2) {
        long_list = list1; long_len = len1; short_list = list2; short_len = len2;
    } else {
        long_list = list2; long_len = len2; short_list = list1; short_len = len1;
    }
    for (int i = 0; i < short_len / 2; i++) {
        Node t = short_list[i];
        short_list[i] = short_list[short_len - 1 - i];
        short_list[short_len - 1 - i] = t;
    }
    Node merged[200000];
    int p = 0, q = 0;
    for (int i = 0; i < long_len; i++) {
        if (p >= 200000) break;
        merged[p++] = long_list[i];
        if ((i + 1) % 2 == 0 && q < short_len) {
            if (p >= 200000) break;
            merged[p++] = short_list[q++];
        }
    }
    // 若短链仍有剩余且长链长度为奇数? 按题目 n>=2m 保证已插完，无需额外处理
    for (int i = 0; i < p - 1; i++) {
        printf("%s %d %s\n", merged[i].address, merged[i].data, merged[i + 1].address);
    }
    if (p > 0) printf("%s %d -1\n", merged[p - 1].address, merged[p - 1].data);
    return 0;
}
