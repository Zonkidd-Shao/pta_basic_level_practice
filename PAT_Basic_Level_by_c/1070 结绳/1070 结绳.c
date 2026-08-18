/*
 * 题目：1070 结绳
 * 实现原理：
 *   将N条绳子连接成一条，每次连接两条绳子会使总长度变为两者之和的一半。
 *   为了最大化最终长度，采用贪心策略：每次连接最短的两条绳子。
 *   算法步骤：
 *   1. 将所有绳子长度从小到大排序
 *   2. 从最短的绳子开始，依次与下一条绳子连接
 *   3. 每次连接后更新当前长度为 (current + next) / 2
 *   4. 最终结果向下取整输出
 */
#include <stdio.h>
#include <stdlib.h>

int cmp(const void *a, const void *b) {  // 升序排序
    return *(int *)a - *(int *)b;
}

int main() {
    int N;
    scanf("%d", &N);
    
    int rope[10000];  // 各段绳子的长度
    for (int i = 0; i < N; i++) {
        scanf("%d", &rope[i]);
    }
    
    qsort(rope, N, sizeof(int), cmp);  // 升序排列，贪心：先连接最短的
    
    double res = rope[0];  // 当前结绳长度（从最短的一段开始）
    for (int i = 1; i < N; i++) {
        res = (res + rope[i]) / 2;  // 与新的一段连接，长度折半相加
    }
    
    printf("%d\n", (int)res);  // 结果向下取整输出
    
    return 0;
}