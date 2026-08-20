/*
 * 题目：1021 个位数统计
 * 实现原理：
 *   统计输入数字中0-9每个数字出现的次数。
 *   算法步骤：
 *   1. 将输入作为字符串读取（避免大数溢出）
 *   2. 使用count数组记录每个数字出现的次数
 *   3. 遍历字符串，将字符转换为数字后累加对应计数
 *   4. 按数字顺序输出每个非零计数
 *   注意：输入可能是0或非常大的数字，必须按字符串处理。
 */
#include <stdio.h>
#include <string.h>

int main() {
    char num[1001];                 // 数字可能很长（达 1000 位），用字符串存储
    scanf("%s", num);
    int count[10] = {0};            // count[i] 记录数字 i 出现的次数
    for (size_t i = 0; i < strlen(num); i++) {
        count[num[i] - '0']++;      // 字符数字转数值，对应计数加 1
    }
    for (int i = 0; i < 10; i++) {
        if (count[i] > 0) {         // 只输出出现过的数字
            printf("%d:%d\n", i, count[i]);
        }
    }
    return 0;
}
