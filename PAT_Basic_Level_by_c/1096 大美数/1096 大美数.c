/*
 * 题目：1096 大美数
 * 实现原理：
 *   一个数是大美数当且仅当它有4个不同的正整数因子，且这4个因子的和能被该数整除。
 *   算法步骤：
 *   1. 找出num的所有因子（不超过sqrt(num)）
 *   2. 如果因子个数少于4个，直接输出"No"
 *   3. 使用四重循环找出4个不同因子，检查它们的和是否能被num整除
 *   4. 如果找到符合条件的组合，输出"Yes"，否则输出"No"
 */
#include <stdio.h>

int main() {
    int k;
    scanf("%d", &k);
    for (int i = 0; i < k; i++) {
        int num;
        scanf("%d", &num);
        int factors[1000], cnt = 0;
        for (int j = 1; j * j <= num; j++) {        // 枚举到sqrt(num)找出全部因子
            if (num % j == 0) {
                factors[cnt++] = j;
                if (j != num / j) factors[cnt++] = num / j;     // 成对的另一个因子
            }
        }
        if (cnt < 4) {          // 因子不足4个，必然不是大美数
            printf("No\n");
            continue;
        }
        int flag = 0;
        for (int a = 0; a < cnt && !flag; a++) {    // 四重循环枚举4个不同因子
            for (int b = a + 1; b < cnt && !flag; b++) {
                for (int c = b + 1; c < cnt && !flag; c++) {
                    for (int d = c + 1; d < cnt && !flag; d++) {
                        int sum = factors[a] + factors[b] + factors[c] + factors[d];
                        if (sum % num == 0) {       // 因子和能被num整除则满足条件
                            flag = 1;
                        }
                    }
                }
            }
        }
        printf("%s\n", flag ? "Yes" : "No");
    }
    return 0;
}