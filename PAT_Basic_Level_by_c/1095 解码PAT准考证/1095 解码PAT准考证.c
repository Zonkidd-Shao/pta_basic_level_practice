/*
 * 题目：1095 解码PAT准考证
 * 实现原理：
 *   PAT准考证格式：等级(1位) + 考场号(3位) + 日期(6位) + 考生号(3位)
 *   支持三种查询：
 *   Type1：查询指定等级的所有考生，按分数降序、准考证号升序排序
 *   Type2：查询指定考场的考生人数和总分
 *   Type3：查询指定日期各考场的考生人数，按人数降序、考场号升序排序
 *   算法步骤：
 *   1. 解析准考证号的各个字段
 *   2. 根据查询类型执行相应操作
 */
#include <stdio.h>
#include <string.h>
#include <stdlib.h>

typedef struct {
    char no[20];        // 完整准考证号
    char level;         // 等级（1位）
    char room[10];      // 考场号（3位）
    char date[10];      // 考试日期（6位）
    char id[10];        // 考生号（3位）
    int score;
} Student;

typedef struct {
    char no[20];
    int score;
} S1;                   // 类型1：按等级筛选后的记录

typedef struct {
    char room[10];
    int cnt;
} S3;                   // 类型3：考场人数统计

int cmp1(const void *a, const void *b) {    // 类型1排序：分数降序、准考证号升序
    S1 *sa = (S1 *)a;
    S1 *sb = (S1 *)b;
    if (sa->score != sb->score) return sb->score - sa->score;
    return strcmp(sa->no, sb->no);
}

int cmp3(const void *a, const void *b) {    // 类型3排序：人数降序、考场号升序
    S3 *sa = (S3 *)a;
    S3 *sb = (S3 *)b;
    if (sa->cnt != sb->cnt) return sb->cnt - sa->cnt;
    return strcmp(sa->room, sb->room);
}

int main() {
    int n, m;           // n:考生总数; m:查询次数
    scanf("%d %d", &n, &m);
    Student stu[10005];
    for (int i = 0; i < n; i++) {
        scanf("%s %d", stu[i].no, &stu[i].score);
        stu[i].level = stu[i].no[0];                    // 解析等级（第1位）
        strncpy(stu[i].room, stu[i].no + 1, 3);         // 考场号（第2~4位）
        stu[i].room[3] = '\0';
        strncpy(stu[i].date, stu[i].no + 4, 6);         // 日期（第5~10位）
        stu[i].date[6] = '\0';
        strncpy(stu[i].id, stu[i].no + 10, 3);          // 考生号（第11~13位）
        stu[i].id[3] = '\0';
    }
    for (int i = 1; i <= m; i++) {
        int type;
        char cmd[20];
        scanf("%d %s", &type, cmd);     // cmd为等级/考场号/日期参数
        printf("Case %d: %d %s\n", i, type, cmd);
        if (type == 1) {                // 类型1：按等级列考生，排序输出
            S1 s[10005];
            int cnt = 0;
            for (int j = 0; j < n; j++) {
                if (stu[j].level == cmd[0]) {       // 匹配等级
                    strcpy(s[cnt].no, stu[j].no);
                    s[cnt].score = stu[j].score;
                    cnt++;
                }
            }
            if (cnt == 0) {
                printf("NA\n");
                continue;
            }
            qsort(s, cnt, sizeof(S1), cmp1);
            for (int j = 0; j < cnt; j++) {
                printf("%s %d\n", s[j].no, s[j].score);
            }
        } else if (type == 2) {         // 类型2：统计考场人数与总分
            int num = 0, sum = 0;
            for (int j = 0; j < n; j++) {
                if (strcmp(stu[j].room, cmd) == 0) {
                    num++;
                    sum += stu[j].score;
                }
            }
            if (num == 0) printf("NA\n");
            else printf("%d %d\n", num, sum);
        } else if (type == 3) {         // 类型3：按日期统计各考场人数
            S3 s[10005];
            int cnt = 0;
            int exist[1000] = {0};      // exist[考场号]记录该考场在s中的下标(从1起)
            for (int j = 0; j < n; j++) {
                if (strcmp(stu[j].date, cmd) == 0) {
                    int room_num = atoi(stu[j].room);
                    if (!exist[room_num]) {             // 该考场首次出现
                        strcpy(s[cnt].room, stu[j].room);
                        s[cnt].cnt = 1;
                        exist[room_num] = ++cnt;
                    } else {
                        s[exist[room_num] - 1].cnt++;    // 已出现则人数+1
                    }
                }
            }
            if (cnt == 0) {
                printf("NA\n");
                continue;
            }
            qsort(s, cnt, sizeof(S3), cmp3);
            for (int j = 0; j < cnt; j++) {
                printf("%s %d\n", s[j].room, s[j].cnt);
            }
        }
    }
    return 0;
}