/*
 * 题目：1045 快速排序
 * 实现原理：
 *   找出序列中所有的主元（pivot）。主元定义：排序后位置不变，且大于左侧所有元素。
 *   算法步骤：
 *   1. 复制原数组并排序得到b数组
 *   2. 遍历原数组，维护左侧最大值max_val
 *   3. 若a[i] == b[i]且a[i] > max_val，则a[i]是主元
 *   4. 更新max_val为当前最大值
 *   时间复杂度：O(n log n)（排序）+ O(n)（遍历）
 */
#include <stdio.h>
#include <stdlib.h>

int cmp(const void *a, const void *b) {
    return *(int *)a - *(int *)b;
}

int main() {
    int N;
    scanf("%d", &N);
    
    int a[100000], b[100000];  // a：原序列；b：排序后的序列
    for (int i = 0; i < N; i++) {
        scanf("%d", &a[i]);
        b[i] = a[i];
    }
    
    qsort(b, N, sizeof(int), cmp);  // 排序得到正确位置
    
    int result[100000];  // 存放找到的主元
    int cnt = 0;         // 主元个数
    int max_val = -1;    // 当前已扫描部分的最大值
    
    for (int i = 0; i < N; i++) {
        // 排序后位置不变，且大于左侧所有元素（即左侧最大值）→ 是主元
        if (a[i] == b[i] && a[i] > max_val) {
            result[cnt++] = a[i];
        }
        if (a[i] > max_val) {  // 更新左侧最大值
            max_val = a[i];
        }
    }
    
    printf("%d\n", cnt);
    for (int i = 0; i < cnt; i++) {  // 主元按原序列顺序输出，空格分隔
        if (i > 0) printf(" ");
        printf("%d", result[i]);
    }
    printf("\n");
    
    return 0;
}