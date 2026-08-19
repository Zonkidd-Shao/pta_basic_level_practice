/*
 * 题目：1089 狼人杀-简单版
 * 实现原理：
 *   狼人杀游戏逻辑：有n个人，其中2个狼人，其余是好人。
 *   每个人说"x是好人(+)或坏人(-)"，已知恰好有2人说谎，其中一个是狼人。
 *   算法步骤：
 *   1. 读取每个人的发言（words[k]表示第k个人说的话）
 *   2. 暴力枚举所有可能的狼人组合（i和j）
 *   3. 假设i和j是狼人，其他人是好人（a[i]=a[j]=-1，其余为1）
 *   4. 检查每个人的发言是否与假设矛盾（即说谎）
 *   5. 如果恰好有2人说谎，且一个是狼人一个是好人，则找到解
 */
#include <stdio.h>
#include <stdlib.h>

int main() {
    int n;
    scanf("%d", &n);
    int words[101];     // words[k]为第k个人的发言：正数说"好人"，负数说"狼人"
    for (int i = 1; i <= n; i++) {
        scanf("%d", &words[i]);
    }
    for (int i = 1; i <= n; i++) {          // 暴力枚举两个狼人的编号组合
        for (int j = i + 1; j <= n; j++) {
            int a[101];
            for (int k = 1; k <= n; k++) {
                a[k] = 1;                   // 先假设所有人都是好人
            }
            a[i] = a[j] = -1;               // 将i、j标记为狼人
            int lie[101], lie_cnt = 0;
            for (int k = 1; k <= n; k++) {  // 逐人核对发言与真实身份是否矛盾
                if (words[k] * a[abs(words[k])] < 0) {  // 乘积为负说明发言与身份相反，即在说谎
                    lie[lie_cnt++] = k;     // 记录说谎者
                }
            }
            if (lie_cnt == 2 && a[lie[0]] + a[lie[1]] == 0) {   // 恰好2人说谎且一狼一人：条件满足
                printf("%d %d\n", i, j);
                return 0;
            }
        }
    }
    printf("No Solution\n");
    return 0;
}