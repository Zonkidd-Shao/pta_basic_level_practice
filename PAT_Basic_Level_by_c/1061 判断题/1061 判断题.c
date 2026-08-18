/*
 * 题目：1061 判断题
 * 实现原理：
 *   根据判断题的正确答案和学生作答，计算每个学生的得分。
 *   算法步骤：
 *   1. 读取每题的分值和正确答案
 *   2. 读取每个学生的作答，与正确答案比较
 *   3. 答对则累加对应分值
 *   4. 输出每个学生的总分
 */
#include <stdio.h>

int main() {
    int N, M;  // N: 学生数; M: 题目数
    scanf("%d %d", &N, &M);
    
    int weight[100], answer[100];  // weight: 每题分值; answer: 每题正确答案
    for (int i = 0; i < M; i++) {  // 读入每题分值
        scanf("%d", &weight[i]);
    }
    for (int i = 0; i < M; i++) {  // 读入每题正确答案
        scanf("%d", &answer[i]);
    }
    
    for (int i = 0; i < N; i++) {  // 逐个学生判卷
        int sum = 0, a;  // sum: 当前学生总分; a: 当前题目的作答
        for (int j = 0; j < M; j++) {
            scanf("%d", &a);
            if (a == answer[j]) {  // 答对则累加该题分值
                sum += weight[j];
            }
        }
        printf("%d\n", sum);  // 输出该学生总分
    }
    
    return 0;
}