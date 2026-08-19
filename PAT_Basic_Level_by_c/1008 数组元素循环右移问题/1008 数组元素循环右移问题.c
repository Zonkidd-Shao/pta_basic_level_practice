/*
 * 题目：1008 数组元素循环右移问题
 * 实现原理：
 *   将数组元素循环右移m位，要求使用最少的辅助空间。
 *   采用经典的"三次反转法"实现：
 *   1. 反转整个数组
 *   2. 反转前m个元素
 *   3. 反转剩余的n-m个元素
 *   例如：数组[1,2,3,4,5]右移2位
 *   - 整体反转：[5,4,3,2,1]
 *   - 前2位反转：[4,5,3,2,1]
 *   - 后3位反转：[4,5,1,2,3]
 *   注意：先对m取模n，避免移动次数超过数组长度。
 */
#include <stdio.h>

void reverse(int arr[], int start, int end) {   // 反转数组 [start, end] 区间内的元素
    while (start < end) {                       // 头尾元素交换，向中间靠拢
        int temp = arr[start];
        arr[start] = arr[end];
        arr[end] = temp;
        start++;
        end--;
    }
}

int main() {
    int n, m;
    scanf("%d %d", &n, &m);
    m %= n;                                     // 对 m 取模，去掉多余的整圈移动
    int arr[100];
    for (int i = 0; i < n; i++) {
        scanf("%d", &arr[i]);
    }
    reverse(arr, 0, n - 1);                     // 三次反转法第一步：整个数组反转
    reverse(arr, 0, m - 1);                     // 第二步：反转前 m 个元素
    reverse(arr, m, n - 1);                     // 第三步：反转剩余 n-m 个元素
    for (int i = 0; i < n; i++) {
        printf("%d", arr[i]);
        if (i < n - 1) {                        // 数字之间用空格分隔
            printf(" ");
        }
    }
    printf("\n");
    return 0;
}