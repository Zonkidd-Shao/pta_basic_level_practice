/*
 * 题目：1058 选择题
 * 实现原理：
 *   读取选择题答案和学生作答，计算每个学生的得分和每道题的错误次数。
 *   算法步骤：
 *   1. 使用位掩码存储正确答案（每个选项用一位表示）
 *   2. 读取每个学生的作答，同样用位掩码表示
 *   3. 比较学生答案和正确答案：
 *      - 相等则加分
 *      - 不等则记录该题错误次数+1
 *   4. 输出每个学生的得分
 *   5. 找出错误次数最多的题目，输出错误次数和题号
 *   注意：若所有题目都没有错误，输出"Too simple"
 */
#include <stdio.h>
#include <stdlib.h>

typedef struct {
    int score;    // 题目分值
    int answer;   // 正确答案（位掩码，每位对应一个选项）
    int wrong;    // 该题答错的人数
} Problem;

int read_answer() {  // 读入一组选项，返回位掩码
    int cnt, ans = 0;
    char c;
    scanf("%d", &cnt);  // 选项个数
    for (int i = 0; i < cnt; i++) {
        while ((c = getchar()) == ' ');  // 跳过选项前的空格
        ans |= 1 << (c - 'a');           // 把选项字母对应的位设为 1
    }
    return ans;
}

int main() {
    int N, M;  // N: 学生数; M: 题目数
    scanf("%d %d", &N, &M);
    Problem pro[100];
    for (int i = 0; i < M; i++) {  // 读入每道题的信息
        int useless;  // 选项个数，此处不需要
        scanf("%d %d", &pro[i].score, &useless);
        pro[i].answer = read_answer();  // 读正确答案位掩码
        pro[i].wrong = 0;
    }
    
    for (int i = 0; i < N; i++) {  // 逐个学生判卷
        int score = 0;  // 当前学生总分
        char c;
        for (int j = 0; j < M; j++) {  // 逐题读取作答
            while ((c = getchar()) != '(');  // 定位到 '(' 开始的作答括号
            int cnt, ans = 0;
            scanf("%d", &cnt);
            for (int k = 0; k < cnt; k++) {  // 读选项并转为位掩码
                while ((c = getchar()) == ' ');
                ans |= 1 << (c - 'a');
            }
            while ((c = getchar()) != ')');  // 跳过 ')' 及后面的空格
            if (ans == pro[j].answer) {  // 作答与正确答案完全一致才得分
                score += pro[j].score;
            } else {  // 答错：该题错误次数加一
                pro[j].wrong++;
            }
        }
        printf("%d\n", score);  // 输出学生得分
    }
    
    int max_wrong = 0;  // 最大的错误次数
    for (int i = 0; i < M; i++) {
        if (pro[i].wrong > max_wrong) {
            max_wrong = pro[i].wrong;
        }
    }
    
    if (max_wrong == 0) {  // 没有任何题目出错
        printf("Too simple\n");
    } else {  // 输出错误次数及所有达到该次数的题号
        printf("%d", max_wrong);
        for (int i = 0; i < M; i++) {
            if (pro[i].wrong == max_wrong) {
                printf(" %d", i + 1);
            }
        }
        printf("\n");
    }
    return 0;
}