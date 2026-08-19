/*
 * 题目：1103 缘分数
 * 实现原理：
 *   找出满足条件的缘分数对(a, b)，条件为：
 *   1. a^3 - (a-1)^3 = c^2，其中c是整数且c != a
 *   2. b^2 + (b-1)^2 = c，其中b >= 2
 *   算法步骤：
 *   1. 遍历a从m到n
 *   2. 计算num = a^3 - (a-1)^3，判断是否为完全平方数且c != a
 *   3. 如果是，遍历b从2到c，检查是否满足b^2 + (b-1)^2 = c
 *   4. 找到符合条件的对(a, b)并输出
 */
#include <stdio.h>
#include <math.h>

int main() {
    int m, n;
    scanf("%d %d", &m, &n);  // 读入区间 [m, n]
    int found = 0;           // 是否找到缘分数对的标记
    for (int a = m; a <= n; a++) {  // 遍历区间内的每个 a
        long long num = (long long)a * a * a - (long long)(a - 1) * (a - 1) * (a - 1);  // 计算 a^3 - (a-1)^3
        int c = (int)sqrt(num);     // 试探开方结果
        if ((long long)c * c == num && a != c) {  // 是完全平方数且 c != a 时继续
            for (int b = 2; b <= c; b++) {  // 遍历 b 寻找满足条件的缘分数对
                if ((long long)b * b + (long long)(b - 1) * (b - 1) == c) {  // 判断 b^2 + (b-1)^2 == c
                    printf("%d %d\n", a, b);
                    found = 1;
                    break;
                }
            }
        }
    }
    if (!found) printf("No Solution\n");  // 未找到任何缘分数对
    return 0;
}