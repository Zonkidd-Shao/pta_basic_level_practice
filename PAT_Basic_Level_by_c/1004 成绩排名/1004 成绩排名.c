/*
 * 题目：1004 成绩排名
 * 实现原理：
 *   输入n个学生的姓名、学号和成绩，找出成绩最高和最低的学生。
 *   采用一次遍历的方式，在输入每个学生信息时，分别与当前最高成绩和最低成绩比较：
 *   - 如果当前学生成绩高于最高成绩，则更新最高成绩及对应学生信息
 *   - 如果当前学生成绩低于最低成绩，则更新最低成绩及对应学生信息
 *   初始时最高成绩设为-1，最低成绩设为101，确保第一次输入的学生信息能正确更新。
 */
#include <stdio.h>
#include <string.h>

int main() {
    int n;
    scanf("%d", &n);
    char max_name[11], max_id[11], min_name[11], min_id[11];  // 保存最高分、最低分学生的姓名与学号
    int max_score = -1, min_score = 101;                     // 初始值保证第一条记录必然更新两者
    for (int i = 0; i < n; i++) {
        char name[11], id[11];
        int score;
        scanf("%s %s %d", name, id, &score);                 // 读入姓名、学号和成绩
        if (score > max_score) {                             // 成绩比当前最高分还高则更新
            max_score = score;
            strcpy(max_name, name);
            strcpy(max_id, id);
        }
        if (score < min_score) {                             // 成绩比当前最低分还低则更新
            min_score = score;
            strcpy(min_name, name);
            strcpy(min_id, id);
        }
    }
    printf("%s %s\n", max_name, max_id);                     // 输出最高分学生
    printf("%s %s\n", min_name, min_id);                     // 输出最低分学生
    return 0;
}