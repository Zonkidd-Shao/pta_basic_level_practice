/*
 * 1034 有理数四则运算
 *
 * 【实现原理】
 * 给定两个有理数 a/b 和 c/d，输出它们的加减乘除运算结果。
 * 每个结果必须化为最简形式，且遵循以下格式：
 * - 整数部分：若分母为 1，只输出整数
 * - 符号前置：负数显示为 (-x)，正数直接显示
 * - 除零：若除数为 0，输出 Inf
 *
 * 【算法思路】
 * 1. 使用 gcd 欧几里得算法计算最大公约数，用于约分
 * 2. simplify 函数约分：确保分母为正，分子分母同时除以 gcd
 * 3. print 函数按最简形式输出有理数：
 *    - 分子为 0 则输出 "0"
 *    - 负数用括号包裹并显示负号
 *    - 分母为 1 只输出整数，否则输出 "分子/分母"
 * 4. main 中分别计算四则运算结果并输出：
 *    - 加：a*d + b*c  /  b*d
 *    - 减：a*d - b*c  /  b*d
 *    - 乘：a*c       /  b*d
 *    - 除：a*d       /  b*c  （需判断 c 是否为 0）
 *
 * 【关键点】
 * - 使用 long long 防止分子分母乘积溢出
 * - llabs 用于处理 long long 类型的绝对值
 * - 除法前需判断除数是否为 0
 *
 * 【复杂度分析】
 * - 时间复杂度：O(log(min(a,b)))，gcd 的时间复杂度
 * - 空间复杂度：O(1)
 */

#include <iostream>
#include <cstdlib>
#include <string>

using namespace std;

// 计算最大公约数（欧几里得算法）
long long gcd(long long a, long long b) {
    a = llabs(a); b = llabs(b);
    while (b) { long long t = a % b; a = b; b = t; }
    return a;
}

// 约分：保证分母为正，分子分母同除以最大公约数
void simplify(long long& num, long long& den) {
    if (den < 0) { num = -num; den = -den; }  // 分母确保为正
    long long g = gcd(num, den);
    if (g > 0) { num /= g; den /= g; }  // 约去最大公约数
}

// 按最简形式输出一个有理数（带分数）
void print(long long num, long long den) {
    simplify(num, den);  // 先约分
    if (num == 0) { cout << "0"; return; }  // 值为 0 直接输出
    bool neg = num < 0;
    if (neg) num = -num;
    long long k = num / den;
    long long r = num % den;
    string s;
    if (k != 0 && r != 0) s = to_string(k) + " " + to_string(r) + "/" + to_string(den);
    else if (k != 0) s = to_string(k);
    else s = to_string(r) + "/" + to_string(den);
    if (neg) cout << "(-" << s << ")";
    else cout << s;
}

int main() {
    long long a, b, c, d;
    if (scanf("%lld/%lld %lld/%lld", &a, &b, &c, &d) != 4) return 0;
    simplify(a, b);  // 对输入也进行约分
    simplify(c, d);

    // 加法：a/b + c/d = (a*d + b*c) / (b*d)
    print(a, b); cout << " + "; print(c, d); cout << " = ";
    print(a * d + b * c, b * d); cout << endl;

    // 减法：a/b - c/d = (a*d - b*c) / (b*d)
    print(a, b); cout << " - "; print(c, d); cout << " = ";
    print(a * d - b * c, b * d); cout << endl;

    // 乘法：a/b * c/d = (a*c) / (b*d)
    print(a, b); cout << " * "; print(c, d); cout << " = ";
    print(a * c, b * d); cout << endl;

    // 除法：a/b ÷ c/d = (a*d) / (b*c)
    print(a, b); cout << " / "; print(c, d); cout << " = ";
    if (c == 0) cout << "Inf" << endl;  // 除数为 0 输出 Inf
    else print(a * d, b * c), cout << endl;

    return 0;
}