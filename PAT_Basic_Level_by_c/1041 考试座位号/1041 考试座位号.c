/*
 * 题目：1041 考试座位号
 * 实现原理：
 *   根据准考证号查找考试座位号。输入包含准考证号、试机座位号、考试座位号。
 *   算法步骤：
 *   1. 使用数组存储信息，试机座位号作为数组下标
 *   2. 将准考证号和考试座位号存储到对应位置
 *   3. 根据试机座位号查询对应的准考证号和考试座位号
 *   注意：试机座位号范围为1-1000，数组大小需足够。
 */
#include <stdio.h>

int main() {
    int N, M;
    char id[1001][17];  // 以试机座位号为下标，存对应考生的准考证号
    int exam[1001];     // 以试机座位号为下标，存对应考生的考试座位号
    
    scanf("%d", &N);
    for (int i = 0; i < N; i++) {
        int test;
        scanf("%s %d %d", id[i], &test, &exam[i]);
        int len = 0;
        while (id[i][len] != '\0') len++;  // 计算准考证号长度
        for (int j = 0; j < len; j++) {    // 把准考证号搬到“试机座位号”对应的位置
            id[test][j] = id[i][j];
        }
        id[test][len] = '\0';
        exam[test] = exam[i];
    }
    
    scanf("%d", &M);
    for (int i = 0; i < M; i++) {  // 逐个查询试机座位号并输出
        int t;
        scanf("%d", &t);
        printf("%s %d\n", id[t], exam[t]);
    }
    
    return 0;
}