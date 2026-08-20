/*
 * 1073 多选题常见计分法 - 满分/半分/0分，统计各选项错误次数
 */
#include <stdio.h>
#include <string.h>

int main() {
    int N, M;
    scanf("%d %d", &N, &M);
    int score[100], opt_num[100], ans_num[100];
    int ans[100][5] = {0};
    int wrong[100][5] = {0};
    for (int i = 0; i < M; i++) {
        scanf("%d %d %d", &score[i], &opt_num[i], &ans_num[i]);
        for (int j = 0; j < ans_num[i]; j++) {
            char c;
            scanf(" %c", &c);
            ans[i][c - 'a'] = 1;
        }
    }
    for (int i = 0; i < N; i++) {
        double total = 0;
        for (int j = 0; j < M; j++) {
            int cnt, flag = 0, partial = 1;
            char c;
            scanf(" (%d", &cnt);
            int stu_ans[5] = {0};
            for (int k = 0; k < cnt; k++) {
                scanf(" %c", &c);
                stu_ans[c - 'a'] = 1;
            }
            scanf(" )");
            // trick to consume ')': scanf(")") won't skip spaces before ')', so use " %c" or " )"
            // 已经读了 cnt 个选项，接下来字符是 ')'，上面 scanf(" )") 会跳过空格读到 ')'
            // 但为兼容旧格式，若上面未正确读到，可用 getchar 方式
            for (int k = 0; k < opt_num[j]; k++) {
                if (stu_ans[k] != ans[j][k]) {
                    wrong[j][k]++;
                    if (stu_ans[k] && !ans[j][k]) partial = 0;
                } else if (ans[j][k]) {
                    flag++;
                }
            }
            if (flag == ans_num[j]) total += score[j];
            else if (partial && flag > 0) total += score[j] / 2.0;
        }
        printf("%.1f\n", total);
    }
    int max_wrong = 0;
    for (int i = 0; i < M; i++) for (int j = 0; j < opt_num[i]; j++) if (wrong[i][j] > max_wrong) max_wrong = wrong[i][j];
    if (max_wrong == 0) {
        printf("Too simple\n");
    } else {
        for (int i = 0; i < M; i++) for (int j = 0; j < opt_num[i]; j++) if (wrong[i][j] == max_wrong) {
            printf("%d %d-%c\n", max_wrong, i+1, 'a'+j);
        }
    }
    return 0;
}
