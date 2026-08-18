/*
 * 题目：1063 计算谱半径
 * 实现原理：
 *   计算复数集合的谱半径（即模最大的复数的模）。
 *   复数a+bi的模 = sqrt(a^2 + b^2)
 *   算法步骤：
 *   1. 读取N个复数（每个复数由a和b组成）
 *   2. 计算每个复数的模
 *   3. 记录最大的模
 *   4. 输出最大模（保留两位小数）
 */
#include <stdio.h>
#include <math.h>

int main() {
    int N;
    scanf("%d", &N);
    
    double max_radius = 0;  // 记录模的最大值
    for (int i = 0; i < N; i++) {
        int a, b;  // 复数的实部与虚部
        scanf("%d %d", &a, &b);
        double radius = sqrt(a * a + b * b);  // 计算该复数的模
        if (radius > max_radius) {  // 更新最大模
            max_radius = radius;
        }
    }
    
    printf("%.2f\n", max_radius);  // 谱半径保留两位小数输出
    
    return 0;
}