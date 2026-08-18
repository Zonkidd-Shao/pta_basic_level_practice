/*
 * 题目：1028 人口普查
 * 实现原理：
 *   统计在1814/09/06到2014/09/06之间出生的人，找出最年长和最年轻的人。
 *   算法步骤：
 *   1. 使用字符串比较日期（格式YYYY/MM/DD，字典序与时间顺序一致）
 *   2. 遍历每个人，筛选出在有效日期范围内的人
 *   3. 维护最年长（最小日期）和最年轻（最大日期）的人
 *   4. 输出有效人数及最年长和最年轻的姓名
 *   特殊处理：若没有有效人员，只输出0。
 */
#include <stdio.h>
#include <string.h>

int main() {
    int n;
    scanf("%d", &n);
    char name[100], max_name[100], min_name[100];  // 当前姓名、最年轻者姓名、最年长者姓名
    char birthday[10], max_birth[10] = "1814/09/06", min_birth[10] = "2014/09/06";
    // 注意：max_birth 存最大的生日（最年轻者），min_birth 存最小的生日（最年长者）；
    // 初始值分别设为有效范围的下限和上限，方便后续比较更新
    int count = 0;  // 生日有效的人数
    for (int i = 0; i < n; i++) {
        scanf("%s %s", name, birthday);
        if (strcmp(birthday, "1814/09/06") >= 0 && strcmp(birthday, "2014/09/06") <= 0) {  // 生日在有效范围内（字符串字典序与时间顺序一致）
            count++;
            if (strcmp(birthday, max_birth) > 0) {  // 生日更大 → 更年轻，更新最年轻者
                strcpy(max_birth, birthday);
                strcpy(max_name, name);
            }
            if (strcmp(birthday, min_birth) < 0) {  // 生日更小 → 更年长，更新最年长者
                strcpy(min_birth, birthday);
                strcpy(min_name, name);
            }
        }
    }
    printf("%d", count);
    if (count > 0) {
        printf(" %s %s\n", min_name, max_name);  // 先输出最年长者，再输出最年轻者
    } else {
        printf("\n");
    }
    return 0;
}