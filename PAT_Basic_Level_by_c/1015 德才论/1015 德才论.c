/*
 * 题目：1015 德才论
 * 实现原理：
 *   根据考生的德分和才分进行分类排序。分类规则：
 *   1. 第一类：德分>=h且才分>=h（德才兼备）
 *   2. 第二类：德分>=h且才分<h（德胜才）
 *   3. 第三类：德分<h且才分<h且德分>=才分（才德兼亡但德胜才）
 *   4. 第四类：其他（均不满足且德分<才分）
 *   排序规则：
 *   - 先按类别排序（1>2>3>4）
 *   - 同类按总分降序
 *   - 总分相同按德分降序
 *   - 德分相同按准考证号升序
 *   使用qsort函数进行快速排序，自定义比较函数cmp。
 */
#include <stdio.h>
#include <stdlib.h>

typedef struct {
    int id;      // 准考证号
    int de;      // 德分
    int cai;     // 才分
    int total;   // 总分（德分 + 才分）
    int rank;    // 类别 1~4
} Student;

int cmp(const void *a, const void *b) {
    Student *s1 = (Student *)a;
    Student *s2 = (Student *)b;
    if (s1->rank != s2->rank) {         // 先按类别升序（1 > 2 > 3 > 4）
        return s1->rank - s2->rank;
    }
    if (s1->total != s2->total) {       // 同类按总分降序
        return s2->total - s1->total;
    }
    if (s1->de != s2->de) {             // 总分相同按德分降序
        return s2->de - s1->de;
    }
    return s1->id - s2->id;             // 德分相同按准考证号升序
}

int main() {
    int n, l, h;                        // 考生数、最低录取线 l、优秀线 h
    scanf("%d %d %d", &n, &l, &h);
    Student stu[100000];                // 最多 10 万个考生
    int m = 0;                          // 达到最低线、被纳入排序的考生数
    for (int i = 0; i < n; i++) {
        int id, de, cai;
        scanf("%d %d %d", &id, &de, &cai);
        if (de < l || cai < l) continue;    // 德才任一低于最低线则直接淘汰
        stu[m].id = id;
        stu[m].de = de;
        stu[m].cai = cai;
        stu[m].total = de + cai;
        if (de >= h && cai >= h) {          // 德才兼备：第一类
            stu[m].rank = 1;
        } else if (de >= h && cai < h) {    // 德胜才：第二类
            stu[m].rank = 2;
        } else if (de < h && cai < h && de >= cai) {   // 才德兼亡但德胜才：第三类
            stu[m].rank = 3;
        } else {                            // 其余及格考生：第四类
            stu[m].rank = 4;
        }
        m++;
    }
    qsort(stu, m, sizeof(Student), cmp);    // 按类别及分数规则排序
    printf("%d\n", m);
    for (int i = 0; i < m; i++) {
        printf("%d %d %d\n", stu[i].id, stu[i].de, stu[i].cai);   // 输出准考证号、德分、才分
    }
    return 0;
}