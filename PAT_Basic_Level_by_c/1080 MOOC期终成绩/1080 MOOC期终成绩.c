/*
 * 题目：1080 MOOC期终成绩
 * 实现原理：
 *   综合计算学生的最终成绩，规则如下：
 *   1. gp为编程作业成绩，必须>=200才能参与排名
 *   2. gm为期中成绩，gf为期终成绩
 *   3. 如果gm > gf，最终成绩g = gm * 0.4 + gf * 0.6（四舍五入）
 *      否则，g = gf
 *   4. 最终成绩g >= 60的学生才输出
 *   5. 按g降序排序，如果g相同按学号升序排序
 *   算法步骤：
 *   1. 分别读取P、M、N组成绩，合并到学生结构体中
 *   2. 筛选符合条件的学生（gp>=200且g>=60）
 *   3. 排序后输出结果
 */
#include <stdio.h>
#include <string.h>

struct Student {
    char id[21];            // 学号
    int gp, gm, gf, g;      // 编程作业、期中、期终成绩及最终成绩（-1表示缺考）
};

int cmp(const void *a, const void *b) {
    struct Student *sa = (struct Student *)a;
    struct Student *sb = (struct Student *)b;
    if (sb->g != sa->g) {
        return sb->g - sa->g;           // 按最终成绩降序
    }
    return strcmp(sa->id, sb->id);      // 成绩相同按学号升序
}

int main() {
    int P, M, N;            // 分别代表编程作业、期中、期终成绩的条数
    scanf("%d %d %d", &P, &M, &N);
    struct Student students[30000];     // 存放所有出现过的学生
    int count = 0;          // 学生总数
    char id[21];            // 临时存放当前读入的学号
    int score;              // 临时存放当前读入的成绩
    for (int i = 0; i < P; i++) {       // 读入编程作业成绩
        scanf("%s %d", id, &score);
        int found = 0;
        for (int j = 0; j < count; j++) {       // 查找该学号是否已存在
            if (strcmp(students[j].id, id) == 0) {
                students[j].gp = score;         // 已存在则更新成绩
                found = 1;
                break;
            }
        }
        if (!found) {                           // 不存在则新增学生，缺考成绩置-1
            strcpy(students[count].id, id);
            students[count].gp = score;
            students[count].gm = -1;
            students[count].gf = -1;
            count++;
        }
    }
    for (int i = 0; i < M; i++) {       // 读入期中成绩，逻辑同上
        scanf("%s %d", id, &score);
        int found = 0;
        for (int j = 0; j < count; j++) {
            if (strcmp(students[j].id, id) == 0) {
                students[j].gm = score;
                found = 1;
                break;
            }
        }
        if (!found) {
            strcpy(students[count].id, id);
            students[count].gp = -1;
            students[count].gm = score;
            students[count].gf = -1;
            count++;
        }
    }
    for (int i = 0; i < N; i++) {       // 读入期终成绩，逻辑同上
        scanf("%s %d", id, &score);
        int found = 0;
        for (int j = 0; j < count; j++) {
            if (strcmp(students[j].id, id) == 0) {
                students[j].gf = score;
                found = 1;
                break;
            }
        }
        if (!found) {
            strcpy(students[count].id, id);
            students[count].gp = -1;
            students[count].gm = -1;
            students[count].gf = score;
            count++;
        }
    }
    struct Student res[30000];      // 存放符合输出条件的学生
    int res_count = 0;
    for (int i = 0; i < count; i++) {
        if (students[i].gp < 200) continue;         // 编程成绩不足200分，排除
        int gm = students[i].gm == -1 ? 0 : students[i].gm;    // 缺考按0分计算
        int gf = students[i].gf == -1 ? 0 : students[i].gf;
        int g;
        if (gm > gf) {          // 期中考得比期末高：加权计算
            g = (int)(gm * 0.4 + gf * 0.6 + 0.5);   // +0.5实现四舍五入
        } else {                // 否则直接取期末成绩
            g = gf;
        }
        if (g >= 60) {          // 只保留最终成绩达标的
            strcpy(res[res_count].id, students[i].id);
            res[res_count].gp = students[i].gp;
            res[res_count].gm = students[i].gm;
            res[res_count].gf = students[i].gf;
            res[res_count].g = g;
            res_count++;
        }
    }
    qsort(res, res_count, sizeof(struct Student), cmp);     // 按成绩降序、学号升序排序
    for (int i = 0; i < res_count; i++) {
        printf("%s %d %d %d %d\n", res[i].id, res[i].gp, res[i].gm, res[i].gf, res[i].g);
    }
    return 0;
}