/*
 * 题目：1115 裁判机
 * 实现原理：
 *   模拟一个数字游戏的裁判过程。初始数字a和b是安全的，之后每个玩家每轮说出一个数字。
 *   如果数字已经存在，或者不能表示为两个已有数字的差，则该玩家出局。
 *   算法步骤：
 *   1. 初始化exist数组标记已有的数字，record数组记录所有已出现的数字
 *   2. 每轮遍历所有存活的玩家，检查其说出的数字是否合法
 *   3. 非法则标记出局，合法则加入exist和record
 *   4. 对出局玩家按编号排序后输出
 *   5. 所有轮次结束后，输出获胜者
 */
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#define MAX_VAL 200001

int main() {
    int a, b;
    scanf("%d %d", &a, &b);     // 两个初始安全数字
    int N, M;
    scanf("%d %d", &N, &M);     // 玩家数 N，轮数 M
    int players[N][M];
    for (int i = 0; i < N; i++) {       // 读入每位玩家每轮说出的数字
        for (int j = 0; j < M; j++) {
            scanf("%d", &players[i][j]);
        }
    }
    int exist[MAX_VAL] = {0};   // 标记数字是否已出现过
    int record[10005] = {0};     // 最多 N*M+2 个不同数字
    int rcnt = 0;               // 已出现数字的个数
    exist[a] = 1;
    exist[b] = 1;
    record[rcnt++] = a;
    record[rcnt++] = b;
    int alive[N];
    for (int i = 0; i < N; i++) alive[i] = 1;   // 初始所有玩家存活
    for (int round = 0; round < M; round++) {
        int out[N];             // 本轮出局的玩家编号
        int out_cnt = 0;
        for (int i = 0; i < N; i++) {
            if (!alive[i]) continue;    // 已出局玩家不再检查
            int num = players[i][round];
            if (num < 0 || num >= MAX_VAL || exist[num]) { // 越界或重复：出局
                out[out_cnt++] = i;
                continue;
            }
            int valid = 0;
            for (int j = 0; j < rcnt; j++) {    // 检查能否由两个已有数字相减得到
                if (record[j] > num && exist[record[j] - num]) {
                    valid = 1;
                    break;
                }
            }
            if (!valid) {               // 无法表示为已有数字之差：出局
                out[out_cnt++] = i;
            } else {                    // 合法：将该数字加入已出现集合
                exist[num] = 1;
                record[rcnt++] = num;
            }
        }
        for (int i = 0; i < out_cnt; i++) {     // 对出局玩家编号升序排序（冒泡）
            for (int j = i + 1; j < out_cnt; j++) {
                if (out[i] > out[j]) {
                    int t = out[i]; out[i] = out[j]; out[j] = t;
                }
            }
        }
        for (int i = 0; i < out_cnt; i++) {     // 标记出局并输出（编号从 1 开始）
            alive[out[i]] = 0;
            printf("Round #%d: %d is out.\n", round + 1, out[i] + 1);
        }
    }
    int winner[N];
    int wcnt = 0;
    for (int i = 0; i < N; i++) {       // 收集仍存活的玩家
        if (alive[i]) winner[wcnt++] = i + 1;
    }
    if (wcnt == 0) {
        printf("No winner.\n");
    } else {
        printf("Winner(s):");
        for (int i = 0; i < wcnt; i++) {
            printf(" %d", winner[i]);
        }
        printf("\n");
    }
    return 0;
}
