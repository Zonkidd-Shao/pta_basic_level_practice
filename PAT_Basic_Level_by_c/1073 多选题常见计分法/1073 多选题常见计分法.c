/*
 * 题目：1073 多选题常见计分法
 * 实现原理：
 *   多选题计分规则：完全正确得满分，部分正确（只选对不选错）得一半分，选错不得分。
 *   同时统计每个选项被选错的次数，找出错误率最高的选项。
 *   算法步骤：
 *   1. 读取题目数量M和学生数量N
 *   2. 读取每道题的分数、选项数、正确选项数和正确答案
 *   3. 读取每个学生的答案，计算得分
 *   4. 统计每个选项被选错的次数
 *   5. 找出错误率最高的选项并输出
 */
#include <stdio.h>
#include <string.h>

int main() {
    int N, M;  // N: 学生数; M: 题目数
    scanf("%d %d", &N, &M);
    int score[100], opt_num[100], ans_num[100];  // 每题的分值、选项数、正确选项数
    char ans[100][6];  // ans[i][k]=1 表示第 i 题选项 k 是正确答案（用下标映射 a~e）
    int wrong[100][5] = {0};  // wrong[i][k]：第 i 题选项 k 被选错的次数
    for (int i = 0; i < M; i++) {  // 读入每道题的信息
        scanf("%d %d %d", &score[i], &opt_num[i], &ans_num[i]);
        ans[i][0] = '\0';
        for (int j = 0; j < ans_num[i]; j++) {  // 读入正确选项并标记
            char c;
            scanf(" %c", &c);
            ans[i][c - 'a'] = 1;
        }
    }
    for (int i = 0; i < N; i++) {  // 逐个学生判卷
        double total = 0;  // 当前学生总分
        getchar();  // 吃掉换行
        for (int j = 0; j < M; j++) {  // 逐题读取作答
            int cnt, flag = 0, partial = 1;  // cnt: 作答选项数; flag: 选对的个数; partial: 是否只选对没选错
            char c;
            scanf("(%d", &cnt);
            char stu_ans[6] = {0};  // 学生作答的位标记
            for (int k = 0; k < cnt; k++) {
                scanf(" %c", &c);
                stu_ans[c - 'a'] = 1;
            }
            scanf(")");
            for (int k = 0; k < opt_num[j]; k++) {  // 逐选项与标准答案比对
                if (stu_ans[k] != ans[j][k]) {  // 该选项选择状态与答案不一致：记一次错误
                    wrong[j][k]++;
                    if (stu_ans[k] && !ans[j][k]) {  // 选了错误选项：本题不得分（非部分正确）
                        partial = 0;
                    }
                } else if (ans[j][k]) {  // 正确选项中选对了：计入选对个数
                    flag++;
                }
            }
            if (flag == ans_num[j]) {  // 全选对：满分
                total += score[j];
            } else if (partial && flag > 0) {  // 只选对一部分且无选错：半分
                total += score[j] / 2.0;
            }
        }
        printf("%.1f\n", total);  // 输出学生总分
    }
    int max_wrong = 0;  // 最大错误次数
    for (int i = 0; i < M; i++) {
        for (int j = 0; j < opt_num[i]; j++) {
            if (wrong[i][j] > max_wrong) {
                max_wrong = wrong[i][j];
            }
        }
    }
    if (max_wrong == 0) {  // 所有选项都无人选错
        printf("Too simple\n");
    } else {  // 输出达到最大错误次数的所有 题号-选项
        for (int i = 0; i < M; i++) {
            for (int j = 0; j < opt_num[i]; j++) {
                if (wrong[i][j] == max_wrong) {
                    printf("%d %d-%c\n", max_wrong, i + 1, 'a' + j);
                }
            }
        }
    }
    return 0;
}