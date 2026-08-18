/*
 * 题目：1035 插入与归并
 * 实现原理：
 *   判断给定序列是插入排序还是归并排序的某一步结果，并输出下一步结果。
 *   算法步骤：
 *   1. 模拟插入排序过程，每一步后与目标序列比较
 *   2. 若在插入排序过程中匹配目标序列，则继续下一步并输出（插入排序）
 *   3. 若插入排序全过程未匹配，则模拟归并排序过程
 *   4. 归并排序每一步后与目标序列比较，匹配后继续下一步并输出
 *   插入排序特点：前半部分已排序，后半部分与原序列相同
 *   归并排序特点：序列被分成多个长度相同的有序段
 */
#include <stdio.h>
#include <stdlib.h>

int cmp(const void *a, const void *b) {
    return *(int *)a - *(int *)b;
}

int is_same(int a[], int b[], int n) {  // 判断两个数组是否完全相同
    for (int i = 0; i < n; i++) {
        if (a[i] != b[i]) return 0;
    }
    return 1;
}

void copy(int a[], int b[], int n) {  // 把 a 复制到 b
    for (int i = 0; i < n; i++) {
        b[i] = a[i];
    }
}

void print_arr(int a[], int n) {  // 按空格分隔输出数组（末尾无多余空格）
    for (int i = 0; i < n; i++) {
        printf("%d", a[i]);
        if (i < n - 1) printf(" ");
    }
    printf("\n");
}

int main() {
    int n;
    scanf("%d", &n);
    int origin[110], target[110], temp[110];  // 原始序列、目标序列、模拟用临时序列
    for (int i = 0; i < n; i++) {
        scanf("%d", &origin[i]);
    }
    for (int i = 0; i < n; i++) {
        scanf("%d", &target[i]);
    }
    copy(origin, temp, n);
    int is_insert = 0;  // 标记是否已匹配到目标序列（匹配后再走一步即输出）
    for (int i = 1; i < n; i++) {  // 模拟插入排序：逐步扩大已排序前缀
        int j = i, val = temp[i];
        while (j > 0 && temp[j - 1] > val) {  // 把 val 往前插到正确位置
            temp[j] = temp[j - 1];
            j--;
        }
        temp[j] = val;
        if (is_same(temp, target, n)) {
            is_insert = 1;  // 这一步恰好等于目标序列，下一步输出
        } else if (is_insert) {  // 已匹配过目标序列 → 当前步即下一步结果
            printf("Insertion Sort\n");
            print_arr(temp, n);
            return 0;
        }
    }
    copy(origin, temp, n);  // 插入排序全程未匹配 → 判定为归并排序，重新模拟
    for (int step = 2; step / 2 <= n; step *= 2) {  // step：当前归并段长度，逐次翻倍
        for (int i = 0; i < n; i += step) {  // 对每个段内部排序
            qsort(temp + i, (i + step <= n) ? step : n - i, sizeof(int), cmp);
        }
        if (is_same(temp, target, n)) {  // 匹配到目标序列 → 再做一次归并并输出
            step *= 2;
            for (int i = 0; i < n; i += step) {
                qsort(temp + i, (i + step <= n) ? step : n - i, sizeof(int), cmp);
            }
            printf("Merge Sort\n");
            print_arr(temp, n);
            return 0;
        }
    }
    return 0;
}