/*
 * 题目：1066 图像过滤
 * 实现原理：
 *   对图像进行过滤处理，将像素值在[A,B]范围内的像素替换为指定值。
 *   算法步骤：
 *   1. 读取图像尺寸M*N和过滤参数A、B、replace
 *   2. 逐行读取每个像素值
 *   3. 若像素值在[A,B]范围内，则替换为replace
 *   4. 按3位格式输出每个像素值（不足3位补0）
 */
#include <stdio.h>

int main() {
    int M, N, A, B, replace;  // 图像尺寸 M*N，过滤区间 [A,B] 及替换值
    scanf("%d %d %d %d %d", &M, &N, &A, &B, &replace);
    
    for (int i = 0; i < M; i++) {
        for (int j = 0; j < N; j++) {  // 逐像素处理
            int temp;
            scanf("%d", &temp);
            if (temp >= A && temp <= B) {  // 像素值落在 [A,B] 内则替换
                temp = replace;
            }
            printf("%03d", temp);  // 3 位宽度输出，不足补前导 0
            if (j < N - 1) {  // 行内用空格分隔
                printf(" ");
            }
        }
        printf("\n");  // 每行结束换行
    }
    
    return 0;
}