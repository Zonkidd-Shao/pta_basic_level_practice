/*
 * 题目：1062 最简分数
 * 实现原理：
 *   找出分母为k且值在两个分数之间的最简分数。
 *   算法步骤：
 *   1. 将两个分数转换为double值，确保d1 < d2
 *   2. 遍历i从1到k-1，检查i/k是否为最简分数（gcd(i,k)==1）
 *   3. 检查i/k是否在[d1, d2]区间内
 *   4. 输出满足条件的分数（用空格分隔）
 *   注意：最简分数即分子和分母的最大公约数为1。
 */
#include <stdio.h>

int gcd(int a, int b) {  // 辗转相除法求最大公约数
    return b == 0 ? a : gcd(b, a % b);
}

int main() {
    int n1, m1, n2, m2, k;  // 两个分数 n1/m1、n2/m2 及目标分母 k
    scanf("%d/%d %d/%d %d", &n1, &m1, &n2, &m2, &k);
    
    double d1 = (double)n1 / m1;  // 转成 double 便于比较大小
    double d2 = (double)n2 / m2;
    
    if (d1 > d2) {  // 保证 d1 <= d2
        double temp = d1;
        d1 = d2;
        d2 = temp;
    }
    
    int first = 1;  // 控制输出格式：第一个分数前不加空格
    for (int i = 1; i < k; i++) {  // 枚举可能的分子
        if (gcd(i, k) == 1) {  // 分子分母互质才是最简分数
            double d = (double)i / k;
            if (d > d1 && d < d2) {  // 值严格落在两个给定分数之间
                if (first) {
                    printf("%d/%d", i, k);
                    first = 0;
                } else {
                    printf(" %d/%d", i, k);
                }
            }
        }
    }
    printf("\n");
    
    return 0;
}