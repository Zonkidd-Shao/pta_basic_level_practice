/*
 * 1123 舍入
 *
 * 【实现原理】
 * 题目给定一个浮点数，要求对其进行四舍五入到最接近的整数并输出。
 * 使用 C 标准库中的 round() 函数实现四舍五入。
 *
 * 【算法思路】
 * 1. 读入一个浮点数 x。
 * 2. 使用 round(x) 进行四舍五入取整。
 * 3. 使用 printf("%.0f") 输出结果，保留 0 位小数。
 *
 * 【复杂度分析】
 * - 时间复杂度：O(1)，仅执行常数次运算。
 * - 空间复杂度：O(1)，仅使用常数个变量。
 */
#include <iostream>
#include <cmath>
#include <cstdio>

using namespace std;

int main() {
    double x;
    if (!(cin >> x)) return 0;
    printf("%.0f\n", round(x));                  // 四舍五入到整数并输出
    return 0;
}