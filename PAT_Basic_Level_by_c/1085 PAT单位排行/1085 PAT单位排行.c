/*
 * 题目：1085 PAT单位排行
 * 实现原理：
 *   统计各个学校的PAT考试成绩，进行排名。
 *   规则：
 *   - 准考证号首位为'A'：成绩计入scoreA
 *   - 准考证号首位为'B'：成绩计入scoreB（最终除以1.5）
 *   - 准考证号首位为'T'：成绩计入scoreT（最终乘以1.5）
 *   - 总分 = scoreB/1.5 + scoreA + scoreT*1.5
 *   排序规则：
 *   1. 总分降序
 *   2. 人数升序
 *   3. 校名升序
 *   算法步骤：
 *   1. 读取n条成绩记录
 *   2. 将校名转换为小写，合并统计各学校成绩
 *   3. 按规则排序后输出排名
 */
#include <stdio.h>
#include <string.h>
#include <stdlib.h>

typedef struct {
    char name[7];           // 校名（小写）
    int scoreA, scoreB, scoreT;     // 按考试级别分别累计的原始成绩
    int cnt;                // 参考人数
} School;

int cmp(const void *a, const void *b) {
    School *sa = (School *)a;
    School *sb = (School *)b;
    int score_a = sa->scoreB / 1.5 + sa->scoreA + sa->scoreT * 1.5;   // 加权换算总分
    int score_b = sb->scoreB / 1.5 + sb->scoreA + sb->scoreT * 1.5;
    if (score_a != score_b) {
        return score_b - score_a;       // 总分降序
    }
    if (sa->cnt != sb->cnt) {
        return sa->cnt - sb->cnt;       // 人数升序
    }
    return strcmp(sa->name, sb->name);  // 校名升序
}

int cmp_name(const void *a, const void *b) {
    return strcmp(((const School *)a)->name, ((const School *)b)->name);
}

int main() {
    int n;
    scanf("%d", &n);
    School schools[100000];
    int count = 0;          // 学校数量
    for (int i = 0; i < n; i++) {
        char id[7], name[7];
        int score;
        scanf("%s %d %s", id, &score, name);
        for (int j = 0; name[j]; j++) {      // 把校名统一转为小写
            if (name[j] >= 'A' && name[j] <= 'Z') {
                name[j] += 32;
            }
        }
        strcpy(schools[i].name, name);
        schools[i].cnt = 1;
        schools[i].scoreA = 0;
        schools[i].scoreB = 0;
        schools[i].scoreT = 0;
        if (id[0] == 'A') schools[i].scoreA = score;
        else if (id[0] == 'B') schools[i].scoreB = score;
        else schools[i].scoreT = score;
    }
    qsort(schools, (size_t)n, sizeof(schools[0]), cmp_name);
    count = 0;
    for (int i = 0; i < n; i++) {
        if (count == 0 || strcmp(schools[count - 1].name, schools[i].name) != 0) {
            if (count != i) schools[count] = schools[i];
            count++;
        } else {
            schools[count - 1].cnt += schools[i].cnt;
            schools[count - 1].scoreA += schools[i].scoreA;
            schools[count - 1].scoreB += schools[i].scoreB;
            schools[count - 1].scoreT += schools[i].scoreT;
        }
    }
    qsort(schools, count, sizeof(School), cmp);     // 按总分/人数/校名排序
    printf("%d\n", count);
    int prev_score = -1, rank = 1;
    for (int i = 0; i < count; i++) {
        int score = schools[i].scoreB / 1.5 + schools[i].scoreA + schools[i].scoreT * 1.5;
        if (score != prev_score) {      // 总分变化才更新排名，相同总分并列
            rank = i + 1;
            prev_score = score;
        }
        printf("%d %s %d %d\n", rank, schools[i].name, score, schools[i].cnt);
    }
    return 0;
}
