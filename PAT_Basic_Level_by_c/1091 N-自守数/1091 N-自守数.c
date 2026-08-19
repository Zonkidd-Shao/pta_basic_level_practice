/*
 * 题目：1091 N-自守数
 * 实现原理：
 *   如果存在整数n使得n*k^2的末尾若干位等于k，则k是n-自守数。
 *   例如：k=25，n=7，7*25^2=4375，末尾两位是75不等于25；n=3，3*25^2=1875，末尾两位是75不等于25。
 *   算法步骤：
 *   1. 计算k的位数len，确定取模值mod=10^len
 *   2. 遍历n从1到9，计算n*k*k
 *   3. 如果(n*k*k) % mod == k，则找到解
 *   4. 特殊情况：k=0时，1*0^2=0，末尾1位是0，所以是1-自守数
 */
#include <stdio.h>
#include <math.h>

int main() {
    int m;
    scanf("%d", &m);
    for (int i = 0; i < m; i++) {
        int k, flag = 0;        // k:待检测的数; flag:是否找到解
        scanf("%d", &k);
        if (k == 0) {           // 0的特殊情况：1*0^2=0，是1-自守数
            printf("1 0\n");
            continue;
        }
        int len = 0, temp = k;
        while (temp > 0) {      // 计算k的位数
            len++;
            temp /= 10;
        }
        int mod = 1;            // mod = 10^len，用于截取末len位
        for (int j = 0; j < len; j++) mod *= 10;
        for (int n = 1; n < 10; n++) {      // 枚举n从1到9
            long long mul = (long long)n * k * k;   // 用long long防止溢出
            if (mul % mod == k) {           // 乘积末len位等于k即满足条件
                printf("%d %lld\n", n, mul);
                flag = 1;
                break;
            }
        }
        if (!flag) printf("No\n");
    }
    return 0;
}