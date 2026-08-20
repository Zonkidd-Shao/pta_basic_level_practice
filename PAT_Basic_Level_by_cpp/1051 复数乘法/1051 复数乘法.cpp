// 1051 复数乘法
//
// 实现原理：
// 本题要求计算两个复数的乘积。复数以极坐标形式给出：每个复数由半径 r 和辐角 p（弧度制）表示。
// 根据复数乘法的极坐标运算法则：两个复数相乘，其模长等于两模长之积，辐角等于两辐角之和。
// 即：若 z1 = r1 * (cos(p1) + i*sin(p1))，z2 = r2 * (cos(p2) + i*sin(p2))，
// 则 z1 * z2 = r1*r2 * [cos(p1+p2) + i*sin(p1+p2)]。
//
// 关键步骤：
// 1. 读取两个复数的极坐标参数 (r1, p1) 和 (r2, p2)（弧度）
// 2. 计算乘积的模长 r = r1 * r2
// 3. 辐角相加 ang = p1 + p2（无需转角度）
// 4. 计算实部 a = r * cos(ang)，虚部 b = r * sin(ang)
// 5. 将绝对值小于 0.005 的值规整为 0.0，避免输出 -0.00
// 6. 按 "a+bi" 格式输出，保留两位小数
//
// 复杂度分析：
// 时间复杂度：O(1)，仅进行常数次数学运算。
// 空间复杂度：O(1)，只使用几个基本变量。
#include <iostream>
#include <cmath>
#include <cstdio>

using namespace std;

int main() {
    double r1, p1, r2, p2;
    if (!(cin >> r1 >> p1 >> r2 >> p2)) return 0;

    // 输入已为弧度，直接相加：极坐标乘法模长相乘、辐角相加
    double r = r1 * r2;
    double ang = p1 + p2;
    // 由极坐标转直角坐标：实部 = r*cosθ，虚部 = r*sinθ
    double a = r * cos(ang);
    double b = r * sin(ang);

    // 接近 0 的值规整为 0.00，避免输出 -0.00
    if (fabs(a) < 0.005) a = 0.0;
    if (fabs(b) < 0.005) b = 0.0;

    // %+.2f 表示带符号输出，保证虚部符号正确显示
    printf("%.2f%+.2fi\n", a, b);
    return 0;
}