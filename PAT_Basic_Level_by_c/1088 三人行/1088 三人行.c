/*
 * 题目：1088 三人行
 * 实现原理：
 *   根据条件找出甲、乙、丙三人的年龄。
 *   条件：
 *   - 甲年龄是两位数，乙年龄是甲年龄的逆序
 *   - |甲 - 乙| / x = 丙的年龄
 *   - 乙 = 丙 * y
 *   输出三人与自己年龄的关系：大输出"Cong"，相等输出"Ping"，小输出"Gai"
 *   算法步骤：
 *   1. 遍历甲的年龄（99到10）
 *   2. 计算乙（逆序）和丙（|甲-乙|/x）
 *   3. 判断是否满足乙 == 丙 * y
 *   4. 找到符合条件的组合，输出关系
 */
#include <stdio.h>
#include <stdlib.h>

void print_rel(int val, int m) {    // 输出val与m的大小关系描述
    if (val > m) {
        printf(" Cong");
    } else if (val == m) {
        printf(" Ping");
    } else {
        printf(" Gai");
    }
}

int main() {
    int m, x, y;        // m:自己的年龄; x、y:题目给出的除数
    scanf("%d %d %d", &m, &x, &y);
    for (int i = 99; i >= 10; i--) {    // 从大到小枚举甲的两位数年龄
        int j = i / 10 + (i % 10) * 10;     // 乙 = 甲的逆序数
        double k = abs(i - j) * 1.0 / x;    // 丙 = |甲-乙| / x
        if (j == k * y) {       // 验证条件：乙 == 丙 * y
            printf("%d", i);    // 输出甲的年龄
            print_rel(i, m);    // 依次比较甲、乙、丙与自己年龄的大小
            print_rel(j, m);
            if (k > m) {                    // k可能不是整数，单独处理比较
                printf(" Cong");
            } else if ((int)k == m) {
                printf(" Ping");
            } else {
                printf(" Gai");
            }
            printf("\n");
            return 0;
        }
    }
    printf("No Solution\n");    // 无满足条件的组合
    return 0;
}