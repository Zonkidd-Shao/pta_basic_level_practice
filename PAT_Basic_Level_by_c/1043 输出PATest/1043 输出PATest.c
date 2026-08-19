/*
 * 题目：1043 输出PATest
 * 实现原理：
 *   将输入字符串中的P、A、T、e、s、t字符按顺序循环输出，直到所有字符用完。
 *   算法步骤：
 *   1. 使用map数组统计每个字符的出现次数
 *   2. 循环输出"PATest"，每次输出前检查对应字符是否还有剩余
 *   3. 当所有字符都用完时停止循环
 *   输出顺序保持P->A->T->e->s->t的循环模式。
 */
#include <stdio.h>

int main() {
    int map[128] = {0};  // 按 ASCII 码统计各字符出现次数
    char c;
    
    while ((c = getchar()) != '\n') {
        map[c]++;
    }
    
    while (map['P'] > 0 || map['A'] > 0 || map['T'] > 0 ||  // 只要还有目标字符剩余就继续循环
           map['e'] > 0 || map['s'] > 0 || map['t'] > 0) {
        if (map['P']-- > 0) printf("P");  // 该字符还有剩余则输出一次并减一
        if (map['A']-- > 0) printf("A");
        if (map['T']-- > 0) printf("T");
        if (map['e']-- > 0) printf("e");
        if (map['s']-- > 0) printf("s");
        if (map['t']-- > 0) printf("t");
    }
    printf("\n");
    
    return 0;
}