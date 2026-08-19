/*
 * 题目：1051 复数乘法
 * 实现原理：
 *   计算两个复数的乘积。复数采用极坐标表示：R*(cos(P)+i*sin(P))
 *   复数乘法规则：(R1, P1) * (R2, P2) = (R1*R2, P1+P2)
 *   转换为直角坐标：A + Bi，其中
 *   - A = R1*R2*cos(P1+P2)
 *   - B = R1*R2*sin(P1+P2)
 *   算法步骤：
 *   1. 读取四个实数：R1, P1, R2, P2
 *   2. 计算A和B
 *   3. 处理精度问题：若|A|<0.005则置为0，同理B
 *   4. 格式化输出A+Bi（保留两位小数）
 */
#include <stdio.h>
#include <math.h>

int main() {
    double R1, P1, R2, P2;  // 两个复数的极坐标 (R, P)
    scanf("%lf %lf %lf %lf", &R1, &P1, &R2, &P2);
    double A = R1 * R2 * cos(P1 + P2);  // 乘积的实部
    double B = R1 * R2 * sin(P1 + P2);  // 乘积的虚部
    if (fabs(A) < 0.005) A = 0;  // 消除浮点误差导致的 -0.00，按四舍五入规则归零
    if (fabs(B) < 0.005) B = 0;
    printf("%.2lf%+.2lfi\n", A, B);  // %+.2lf 强制输出正负号（负号给 B，正号给 +）
    return 0;
}