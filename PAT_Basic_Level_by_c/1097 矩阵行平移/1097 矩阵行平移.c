/*
 * 题目：1097 矩阵行平移
 * 实现原理：
 *   对矩阵的奇数行（0行、2行、4行...）进行向右平移操作。
 *   第1次平移1位，第2次平移2位，...，第k次平移k位，然后重复。
 *   平移后的空位填充数字x。
 *   最后计算每列的和并输出。
 *   算法步骤：
 *   1. 读取n*n矩阵
 *   2. 对奇数行进行平移：将行内容保存到temp，前shift位填x，后面填原内容
 *   3. 计算每列的和并输出
 */
#include <stdio.h>

int main() {
    int n, k, x;        // n:矩阵阶数; k:平移位数循环周期; x:空位填充值
    scanf("%d %d %d", &n, &k, &x);
    int matrix[100][100];
    for (int i = 0; i < n; i++) {
        for (int j = 0; j < n; j++) {
            scanf("%d", &matrix[i][j]);
        }
    }
    int shift = 1;
    for (int i = 0; i < n; i += 2) {    // 只处理奇数行（第1、3、5...行）
        int temp[100];
        for (int j = 0; j < n; j++) temp[j] = matrix[i][j];     // 暂存整行
        for (int j = 0; j < n; j++) {
            if (j < shift) matrix[i][j] = x;        // 前shift位填入x
            else matrix[i][j] = temp[j - shift];    // 其余位右移
        }
        shift++;
        if (shift > k) shift = 1;       // 平移位数在1~k之间循环
    }
    for (int j = 0; j < n; j++) {       // 逐列求和
        int sum = 0;
        for (int i = 0; i < n; i++) sum += matrix[i][j];
        if (j > 0) printf(" ");
        printf("%d", sum);
    }
    printf("\n");
    return 0;
}