/*
 * 题目：1046 划拳
 * 实现原理：
 *   统计甲乙两人划拳的输赢次数。
 *   规则：两人各喊一个数，同时各出一个数。
 *   - 若只有一方喊的数等于两人出拳之和，则该方赢
 *   - 否则平局
 *   算法步骤：
 *   1. 读取每次划拳的a1(甲出), a2(甲喊), b1(乙出), b2(乙喊)
 *   2. 计算sum = a1 + b1
 *   3. 判断输赢并统计
 *   4. 输出两人的赢次数
 */
#include <stdio.h>

int main() {
    int N;
    int count1 = 0, count2 = 0;  // 甲输的次数（喝酒杯数）、乙输的次数
    
    scanf("%d", &N);
    while (N--) {
        int a1, a2, b1, b2;
        scanf("%d %d %d %d", &a1, &a2, &b1, &b2);  // 甲出拳、甲喊数、乙出拳、乙喊数
        int sum = a1 + b1;  // 两人出拳之和
        
        if (a2 == sum && b2 != sum) {  // 只有甲喊中 → 甲赢，乙喝酒
            count2++;
        } else if (a2 != sum && b2 == sum) {  // 只有乙喊中 → 乙赢，甲喝酒
            count1++;
        }
    }
    
    printf("%d %d\n", count1, count2);
    
    return 0;
}