/*
 * 题目：1030 完美数列
 * 实现原理：
 *   给定一个正整数数列和p，找出最长的完美数列（满足max <= min * p）。
 *   算法步骤：
 *   1. 对数列进行排序（从小到大）
 *   2. 对每个元素arr[i]，使用二分查找找到最大的j满足arr[j] <= arr[i] * p
 *   3. 更新最大长度max_len = j - i + 1
 *   时间复杂度：O(n log n)（排序O(n log n) + n次二分查找O(n log n)）
 *   使用long long类型避免溢出。
 */
#include <stdio.h>
#include <stdlib.h>

int cmp(const void *a, const void *b) {
    return *(long long *)a - *(long long *)b;  // qsort 的升序比较函数
}

int main() {
    int n;
    long long p;
    scanf("%d %lld", &n, &p);
    long long arr[100000];  // 数列；用 long long 避免 arr[i] * p 溢出
    for (int i = 0; i < n; i++) {
        scanf("%lld", &arr[i]);
    }
    qsort(arr, n, sizeof(long long), cmp);  // 升序排序
    int max_len = 0;  // 最长完美数列的长度
    for (int i = 0; i < n; i++) {  // 以 arr[i] 为最小值，找能构成完美数列的最长区间
        int left = i, right = n - 1;
        while (left <= right) {  // 二分查找最大的 j，使 arr[j] <= arr[i] * p
            int mid = (left + right) / 2;
            if (arr[mid] <= arr[i] * p) {
                left = mid + 1;
            } else {
                right = mid - 1;
            }
        }
        if (left - i > max_len) {  // 区间长度为 left - i，更新最大值
            max_len = left - i;
        }
    }
    printf("%d\n", max_len);
    return 0;
}