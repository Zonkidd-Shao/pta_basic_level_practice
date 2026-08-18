/*
 * 题目：1101 B是A的多少倍
 * 实现原理：
 *   将字符串A的最后D个字符移到最前面得到字符串B，计算B/A的值。
 *   算法步骤：
 *   1. 读取字符串A和整数D
 *   2. 将A的最后D个字符复制到B，然后将A连接到B后面
 *   3. 将B截断为与A相同长度
 *   4. 将A和B转换为浮点数，计算B/A并输出（保留两位小数）
 */
#include <stdio.h>
#include <string.h>

int main() {
    char A[20], B[20];  // A 为原数字串，B 存储循环移位后的数字串
    int D;              // 要移动的位数
    scanf("%s %d", A, &D);  // 读入数字串 A 和移动位数 D
    int len = strlen(A);    // 数字串长度
    strcpy(B, A + len - D); // 将 A 末尾 D 个字符复制到 B 开头
    strcat(B, A);           // 再拼上完整 A，形成循环移位效果
    B[len] = '\0';          // 截取前 len 位，得到移位后的字符串 B
    double ans = atof(B) / atof(A);  // 将字符串转数值，计算 B 是 A 的多少倍
    printf("%.2f\n", ans);  // 保留两位小数输出倍数
    return 0;
}