/*
 * 题目：1100 校庆
 * 实现原理：
 *   统计校庆当天返校的校友人数，并找出最年长的校友（身份证号第7-14位为出生日期，越小越年长）。
 *   如果没有校友返校，则找出最年长的来宾。
 *   算法步骤：
 *   1. 读取n个校友身份证号，找出最年长的校友
 *   2. 对校友列表排序，使用二分查找判断来宾是否为校友
 *   3. 统计返校校友人数，找出最年长的来宾（如果没有校友返校）
 *   4. 输出结果
 */
#include <stdio.h>
#include <string.h>
#include <stdlib.h>

int cmp(const void *a, const void *b) {     // 身份证号字典序比较
    return strcmp((char *)a, (char *)b);
}

int main() {
    int n, m;
    scanf("%d", &n);
    char alumni[100005][19];        // 所有校友身份证号
    char oldest_alumni[19];         // 最年长校友（出生日期越早越年长）
    scanf("%s", alumni[0]);
    strcpy(oldest_alumni, alumni[0]);
    for (int i = 1; i < n; i++) {
        scanf("%s", alumni[i]);
        if (strcmp(alumni[i] + 6, oldest_alumni + 6) < 0) {     // 身份证7~14位是出生日期，比较谁更早
            strcpy(oldest_alumni, alumni[i]);
        }
    }
    qsort(alumni, n, sizeof(alumni[0]), cmp);   // 排序，为二分查找做准备
    scanf("%d", &m);
    char visitor[19], oldest_visitor[19];
    int count = 0;          // 返校的校友人数
    scanf("%s", visitor);
    strcpy(oldest_visitor, visitor);
    if (bsearch(visitor, alumni, n, sizeof(alumni[0]), cmp)) count++;   // 来宾是否为校友
    for (int i = 1; i < m; i++) {
        scanf("%s", visitor);
        if (bsearch(visitor, alumni, n, sizeof(alumni[0]), cmp)) count++;       // 是校友则计数
        else if (count == 0 && strcmp(visitor + 6, oldest_visitor + 6) < 0) {   // 尚无校友返校时，记录最年长来宾
            strcpy(oldest_visitor, visitor);
        }
    }
    printf("%d\n", count);
    if (count > 0) printf("%s\n", oldest_alumni);   // 有校友返校输出最年长校友
    else printf("%s\n", oldest_visitor);            // 否则输出最年长来宾
    return 0;
}