/*
 * 题目：1060 爱丁顿数
 * 实现原理：
 *   求最大的E，使得有E天骑车超过E英里。
 *   算法步骤：
 *   1. 将骑行里程数组按降序排序
 *   2. 遍历排序后的数组，找到最大的E满足arr[E-1] > E
 *   3. 从i=0开始，若arr[i] > i+1，则E++
 *   4. 否则跳出循环，当前E即为答案
 *   时间复杂度：O(n log n)（排序）+ O(n)（遍历）
 */
#include <stdio.h>
#include <stdlib.h>

int cmp(const void *a, const void *b) {  // 降序排序
    return *(int *)b - *(int *)a;
}

int main() {
    int N;
    scanf("%d", &N);
    int arr[100000];  // 每天的骑行英里数
    for (int i = 0; i < N; i++) {
        scanf("%d", &arr[i]);
    }
    qsort(arr, N, sizeof(int), cmp);  // 从大到小排列
    
    int E = 0;  // 爱丁顿数
    for (int i = 0; i < N; i++) {  // 第 i 天对应第 i+1 大的英里数
        if (arr[i] > i + 1) {  // 有 i+1 天超过 i+1 英里，E 可以增大
            E++;
        } else {  // 之后都不会满足条件，停止
            break;
        }
    }
    printf("%d\n", E);
    return 0;
}