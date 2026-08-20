/*
 * 题目：1065 单身狗
 * 实现原理：
 *   找出参加派对但另一半未参加的人。
 *   算法步骤：
 *   1. 使用couple数组存储情侣关系（couple[a]=b, couple[b]=a）
 *   2. 使用exist数组标记参加派对的人
 *   3. 遍历参加派对的人，检查其情侣是否也参加了派对
 *   4. 收集所有单身狗（情侣未参加的人）
 *   5. 排序后输出（格式化位5位数字）
 */
#include <stdio.h>
#include <stdlib.h>

int cmp(const void *a, const void *b) {  // 升序排序
    return *(int *)a - *(int *)b;
}

int main() {
    int N;
    scanf("%d", &N);
    
    int couple[100000];
    for (int i = 0; i < 100000; i++) couple[i] = -1;  // -1 表示无情侣，避免与编号00000冲突
    for (int i = 0; i < N; i++) {
        int a, b;
        scanf("%d %d", &a, &b);
        couple[a] = b;
        couple[b] = a;
    }
    
    int M;
    scanf("%d", &M);  // 参加派对的人数
    
    int guest[10000], exist[100000] = {0};  // guest: 到场编号; exist: 标记某人是否到场
    for (int i = 0; i < M; i++) {
        scanf("%d", &guest[i]);
        exist[guest[i]] = 1;
    }
    
    int single[10000], count = 0;  // single: 单身狗列表
    for (int i = 0; i < M; i++) {
        int c = couple[guest[i]];
        if (c == -1 || exist[c] == 0) {  // 无情侣或情侣未到场：单身狗
            single[count++] = guest[i];
        }
    }
    
    qsort(single, count, sizeof(int), cmp);  // 编号升序
    
    printf("%d\n", count);
    for (int i = 0; i < count; i++) {
        printf("%05d", single[i]);  // 5 位编号，不足补前导 0
        if (i < count - 1) {
            printf(" ");
        }
    }
    if (count > 0) printf("\n");
    
    return 0;
}