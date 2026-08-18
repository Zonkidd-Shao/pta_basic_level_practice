/*
 * 题目：1069 微博转发抽奖
 * 实现原理：
 *   在微博转发列表中按规则抽取获奖者。
 *   规则：从第S个人开始，每隔N个人抽取一位获奖者。
 *   如果遇到重复获奖者，则跳过继续寻找下一个。
 *   算法步骤：
 *   1. 读取总人数M、间隔N、起始位置S
 *   2. 如果起始位置超出范围，输出"Keep going..."
 *   3. 使用won数组记录已获奖的人
 *   4. 从起始位置开始，按间隔N遍历，跳过已获奖的人
 *   5. 如果没有任何人获奖，输出"Keep going..."
 */
#include <stdio.h>
#include <string.h>

int main() {
    int M, N, S;  // M: 转发人数; N: 中奖间隔; S: 起始位置（1 开始）
    scanf("%d %d %d", &M, &N, &S);
    
    char names[1000][21];  // 转发用户名单
    int won[1000] = {0};   // 标记下标对应的用户是否已中奖
    
    for (int i = 0; i < M; i++) {  // 读入所有转发用户昵称
        scanf("%s", names[i]);
    }
    
    if (S > M) {  // 起始位置超出名单范围：无人中奖
        printf("Keep going...\n");
        return 0;
    }
    
    int current = S - 1;  // 转为 0 起始的下标
    int has_won = 0;      // 是否有人中奖
    
    while (current < M) {
        if (won[current] == 0) {  // 该位置尚未中过奖：成为中奖者
            printf("%s\n", names[current]);
            won[current] = 1;
            has_won = 1;
            current += N;  // 按间隔跳到下一位候选
        } else {
            current++;  // 已中奖则顺延取下一个用户
        }
    }
    
    if (!has_won) {  // 无任何中奖者
        printf("Keep going...\n");
    }
    
    return 0;
}