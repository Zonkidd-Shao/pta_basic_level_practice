/*
 * 题目：1050 螺旋矩阵
 * 实现原理：
 *   将n个整数按从大到小的顺序排成螺旋矩阵。
 *   算法步骤：
 *   1. 对数组进行降序排序
 *   2. 确定矩阵行数m和列数n（m >= n，且m*n=N，m-n最小）
 *   3. 使用模拟法填充螺旋矩阵：
 *      - 从左到右填充上边界
 *      - 从上到下填充右边界
 *      - 从右到左填充下边界
 *      - 从下到上填充左边界
 *      - 缩小边界，重复上述过程
 *   4. 按行输出矩阵
 */
#include <stdio.h>
#include <stdlib.h>
#include <math.h>

int cmp(const void *a, const void *b) {
    return *(int *)b - *(int *)a;  // 降序比较函数
}

int main() {
    int N;
    scanf("%d", &N);
    
    int arr[10000];
    for (int i = 0; i < N; i++) {
        scanf("%d", &arr[i]);
    }
    
    qsort(arr, N, sizeof(int), cmp);  // 从大到小排序
    
    int m, n;
    for (n = sqrt(N); n >= 1; n--) {  // 从 sqrt(N) 向下找第一个能整除 N 的 n，保证 m>=n 且 m-n 最小
        if (N % n == 0) {
            m = N / n;
            break;
        }
    }
    
    int matrix[10000][100] = {0};  // 螺旋矩阵
    int top = 0, bottom = m - 1;   // 上下边界
    int left = 0, right = n - 1;   // 左右边界
    int index = 0;                 // 待填入 arr 的下标
    
    while (index < N) {  // 按圈从外向内填充
        for (int j = left; j <= right && index < N; j++) {  // 上边：从左到右
            matrix[top][j] = arr[index++];
        }
        top++;  // 上边界下移
        
        for (int i = top; i <= bottom && index < N; i++) {  // 右边：从上到下
            matrix[i][right] = arr[index++];
        }
        right--;  // 右边界左移
        
        for (int j = right; j >= left && index < N; j--) {  // 下边：从右到左
            matrix[bottom][j] = arr[index++];
        }
        bottom--;  // 下边界上移
        
        for (int i = bottom; i >= top && index < N; i--) {  // 左边：从下到上
            matrix[i][left] = arr[index++];
        }
        left++;  // 左边界右移
    }
    
    for (int i = 0; i < m; i++) {  // 按行输出矩阵
        for (int j = 0; j < n; j++) {
            printf("%d", matrix[i][j]);
            if (j < n - 1) printf(" ");
        }
        printf("\n");
    }
    
    return 0;
}