/*
 * 1026 程序运行时间
 *
 * 【实现原理】
 * 题目要求根据两次时钟打点数（C1 和 C2）计算程序运行时间。
 * 时钟每秒打点 CLK_TCK = 100 次，因此打点数差值除以 100 即为秒数。
 * 
 * 【算法思路】
 * 1. 计算差值 diff = C2 - C1
 * 2. 将差值转换为秒数：total = diff / 100，并进行四舍五入
 * 3. 将 total 秒转换为 hh:mm:ss 格式输出
 * 
 * 【关键点】
 * - 四舍五入技巧：diff / 100 的四舍五入等价于 (diff + 50) / 100（整数除法）
 *   因为 diff 除以 100 的余数若 >= 50 则进位，否则舍去
 * - 注意数据范围：C1 和 C2 可能较大，需要使用 long long 类型
 * 
 * 【复杂度分析】
 * - 时间复杂度：O(1)，仅常数次运算
 * - 空间复杂度：O(1)，仅使用常数个变量
 */

#include <iostream>
#include <cstdio>

using namespace std;

int main() {
    long long c1, c2;
    if (!(cin >> c1 >> c2)) return 0;

    // 计算打点差值，并四舍五入到秒
    // (diff + 50) / 100 实现四舍五入：余数 >= 50 时进位
    long long diff = c2 - c1;
    long long total = (diff + 50) / 100;  // 除以 100 并四舍五入到秒

    // 将总秒数转换为 hh:mm:ss 格式
    int ss = total % 60; total /= 60;  // 取余得到秒数
    int mm = total % 60; total /= 60;  // 取余得到分钟数
    int hh = (int)total;               // 剩余即为小时数

    // 按两位宽度输出，不足补零
    printf("%02d:%02d:%02d\n", hh, mm, ss);
    return 0;
}