/*
 * 题目：1072 开学寄语
 * 实现原理：
 *   检查学生携带的物品中是否有违禁物品，并统计相关信息。
 *   算法步骤：
 *   1. 读取学生人数n和违禁物品种类数m
 *   2. 使用banned数组标记违禁物品编号
 *   3. 遍历每个学生，检查其携带的物品
 *   4. 如果发现违禁物品，输出学生姓名和违禁物品列表
 *   5. 统计携带违禁物品的学生人数和违禁物品总数
 */
#include <stdio.h>

int main() {
    int n, m;  // n: 学生数; m: 违禁物品类别数
    int banned[10000] = {0};  // 标记编号是否为违禁物品
    scanf("%d %d", &n, &m);
    for (int i = 0; i < m; i++) {  // 读入违禁物品编号
        int id;
        scanf("%d", &id);
        banned[id] = 1;
    }
    int student_count = 0, goods_count = 0;  // 违规学生数、违禁物品总数
    for (int i = 0; i < n; i++) {  // 逐个检查学生
        char name[10];
        int k;  // 该学生携带的物品件数
        scanf("%s %d", name, &k);
        int first = 1;      // 控制姓名只输出一次
        int has_banned = 0; // 该学生是否有违禁物品
        for (int j = 0; j < k; j++) {
            int item;
            scanf("%d", &item);
            if (banned[item]) {  // 是违禁物品
                if (first) {  // 第一次发现违禁物品时先输出姓名
                    printf("%s:", name);
                    first = 0;
                    has_banned = 1;
                    student_count++;
                }
                printf(" %04d", item);  // 输出 4 位编号
                goods_count++;
            }
        }
        if (has_banned) {  // 该学生有违禁物品则换行
            printf("\n");
        }
    }
    printf("%d %d\n", student_count, goods_count);  // 汇总输出
    return 0;
}