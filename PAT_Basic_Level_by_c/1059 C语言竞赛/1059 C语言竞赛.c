/*
 * 题目：1059 C语言竞赛
 * 实现原理：
 *   根据参赛编号的排名判断获奖情况。
 *   规则：
 *   - 排名第1：Mystery Award
 *   - 排名为素数：Minion
 *   - 其他排名：Chocolate
 *   - 重复查询：Checked
 *   - 不存在的编号：Are you kidding?
 *   算法步骤：
 *   1. 使用records数组存储编号对应的排名
 *   2. 使用checked数组标记已查询的编号
 *   3. 实现is_prime函数判断素数
 *   4. 根据排名判断输出结果
 */
#include <stdio.h>
#include <math.h>

int records[10000] = {0};  // 编号 -> 排名（0 表示该编号未参赛）
int checked[10000] = {0};  // 标记编号是否已被查询过

int is_prime(int x) {  // 判断 x 是否为素数
    if (x <= 1) return 0;
    if (x == 2) return 1;
    if (x % 2 == 0) return 0;  // 排除偶数
    for (int i = 3; i <= sqrt(x); i += 2) {  // 只试除奇数到 sqrt(x)
        if (x % i == 0) return 0;
    }
    return 1;
}

int main() {
    int N, K;
    scanf("%d", &N);  // 参赛人数
    for (int i = 1; i <= N; i++) {  // 记录每个编号的排名（1 开始）
        int id;
        scanf("%d", &id);
        records[id] = i;
    }
    
    scanf("%d", &K);  // 查询次数
    for (int i = 0; i < K; i++) {
        int id;
        scanf("%d", &id);
        if (records[id] == 0) {  // 编号不在参赛名单中
            printf("%04d: Are you kidding?\n", id);
        } else if (checked[id]) {  // 已被查询过：重复查询
            printf("%04d: Checked\n", id);
        } else {
            checked[id] = 1;  // 标记为已查询
            if (records[id] == 1) {  // 冠军
                printf("%04d: Mystery Award\n", id);
            } else if (is_prime(records[id])) {  // 排名是素数
                printf("%04d: Minion\n", id);
            } else {  // 其他情况
                printf("%04d: Chocolate\n", id);
            }
        }
    }
    return 0;
}