/*
 * 题目：1034 有理数四则运算
 * 实现原理：
 *   对两个有理数进行加减乘除运算，输出结果需为最简分数形式。
 *   算法步骤：
 *   1. 使用欧几里得算法(gcd)求最大公约数
 *   2. 定义print函数格式化输出分数：
 *      - 处理正负号（负数用括号包裹）
 *      - 分离整数部分和分数部分
 *      - 约分后输出
 *   3. 四则运算公式：
 *      - 加法：a/b + c/d = (ad+bc)/bd
 *      - 减法：a/b - c/d = (ad-bc)/bd
 *      - 乘法：a/b * c/d = ac/bd
 *      - 除法：a/b / c/d = ad/bc（注意除数为0时输出Inf）
 */
#include <stdio.h>

long long gcd(long long a, long long b) {
    return b == 0 ? a : gcd(b, a % b);  // 欧几里得算法求最大公约数
}

void print(long long a, long long b) {
    if (a == 0) {
        printf("0");
        return;
    }
    int flag = 0;  // 标记是否为负数（负数需用括号包裹）
    if (a < 0 && b > 0 || a > 0 && b < 0) {  // 分子分母异号 → 负分数
        printf("(-");
        flag = 1;
    }
    a = a < 0 ? -a : a;  // 统一取绝对值处理
    b = b < 0 ? -b : b;
    long long k = a / b;  // 整数部分
    long long r = a % b;  // 分数部分的分子（真分数）
    if (k != 0) {
        printf("%lld", k);
    }
    if (r != 0) {
        long long g = gcd(r, b);  // 对分数部分约分
        r /= g;
        b /= g;
        if (k != 0) {  // 有整数部分时整数与分数间用空格分隔
            printf(" %lld/%lld", r, b);
        } else {
            printf("%lld/%lld", r, b);
        }
    }
    if (flag) {  // 补上负数的右括号
        printf(")");
    }
}

int main() {
    long long a1, b1, a2, b2;  // 两个分数的分子、分母
    scanf("%lld/%lld %lld/%lld", &a1, &b1, &a2, &b2);
    // 加法：a1/b1 + a2/b2 = (a1*b2 + a2*b1) / (b1*b2)
    print(a1, b1); printf(" + "); print(a2, b2); printf(" = "); print(a1 * b2 + a2 * b1, b1 * b2); printf("\n");
    // 减法：a1/b1 - a2/b2 = (a1*b2 - a2*b1) / (b1*b2)
    print(a1, b1); printf(" - "); print(a2, b2); printf(" = "); print(a1 * b2 - a2 * b1, b1 * b2); printf("\n");
    // 乘法：(a1/b1) * (a2/b2) = (a1*a2) / (b1*b2)
    print(a1, b1); printf(" * "); print(a2, b2); printf(" = "); print(a1 * a2, b1 * b2); printf("\n");
    // 除法：(a1/b1) / (a2/b2) = (a1*b2) / (b1*a2)
    print(a1, b1); printf(" / "); print(a2, b2); printf(" = ");
    if (a2 == 0) {  // 除数为 0 → 输出 Inf
        printf("Inf");
    } else {
        print(a1 * b2, b1 * a2);
    }
    printf("\n");
    return 0;
}