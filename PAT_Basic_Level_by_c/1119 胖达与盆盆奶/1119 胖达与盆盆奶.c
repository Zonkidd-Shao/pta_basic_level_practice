/*
 * 题目：1119 胖达与盆盆奶
 * 实现原理：
 *   给熊猫分配盆盆奶。规则如下：
 *   - 初始每只熊猫分配200ml奶
 *   - 如果当前熊猫体重比前一只重，分配比前一只多100ml
 *   - 如果当前熊猫体重与前一只相等，分配与前一只相同
 *   - 如果当前熊猫体重比前一只轻，重新分配为200ml，并向前检查调整之前的分配
 *   向前调整规则：
 *   - 如果前一只体重比当前重且分配相同，前一只加100ml
 *   - 如果前一只体重与当前相等且分配更少，前一只加100ml
 *   算法步骤：
 *   1. 初始化每只熊猫的奶量为200
 *   2. 从第二只开始，根据体重关系调整奶量
 *   3. 当体重下降时，向前回溯调整
 *   4. 计算总奶量并输出
 */
#include <stdio.h>

#define MAXN 10005

int main() {
    int n;
    scanf("%d", &n);        // 熊猫数量
    int weight[MAXN];
    for (int i = 0; i < n; i++) {
        scanf("%d", &weight[i]);    // 读入每只熊猫的体重
    }
    int milk[MAXN];         // 每只熊猫分配的奶量
    for (int i = 0; i < n; i++) {
        milk[i] = 200;      // 初始每只 200ml
    }
    for (int i = 1; i < n; i++) {
        if (weight[i] > weight[i-1]) {          // 比前一只重：多 100ml
            milk[i] = milk[i-1] + 100;
        } else if (weight[i] == weight[i-1]) {  // 体重相等：与前一只相同
            milk[i] = milk[i-1];
        } else {                                // 比前一只轻：重置为 200 并向前回溯调整
            milk[i] = 200;
            for (int j = i-1; j >= 0; j--) {    // 检查前一只是否也需要加奶
                if (weight[j] > weight[j+1] && milk[j] == milk[j+1]) {      // 前一只更重但奶量相同则加 100
                    milk[j] += 100;
                } else if (weight[j] == weight[j+1] && milk[j] < milk[j+1]) {  // 体重相等但奶量偏少则加 100
                    milk[j] += 100;
                } else {
                    break;                      // 无需继续调整则停止回溯
                }
            }
        }
    }
    int total = 0;
    for (int i = 0; i < n; i++) {
        total += milk[i];       // 累计总奶量
    }
    printf("%d\n", total);
    return 0;
}