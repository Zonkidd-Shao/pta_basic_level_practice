/*
 * 题目：1052 卖个萌
 * 实现原理：
 *   根据输入的序号组合，输出对应的表情。
 *   输入包含三行：手势、眼睛、嘴巴，每行包含若干选项（用[]包裹）
 *   输出格式：手势(左眼嘴巴右眼)手势
 *   算法步骤：
 *   1. 使用get_items函数解析每行的选项，存入对应数组
 *   2. 读取K个查询，每个查询包含5个序号
 *   3. 验证序号是否在有效范围内
 *   4. 有效则输出表情，否则输出错误信息
 *   注意：序号从1开始，数组下标从0开始。
 */
#include <stdio.h>
#include <string.h>

#define MAX 15
#define LEN 10

char hand[MAX][LEN];   // 手势选项数组
char eye[MAX][LEN];    // 眼睛选项数组
char mouth[MAX][LEN];  // 嘴巴选项数组

int get_items(char items[MAX][LEN]) {  // 从一行中解析出所有 [..] 包裹的选项
    int count = 0;
    char c;
    while ((c = getchar()) != '\n') {  // 逐字符读直到行尾
        if (c == '[') {
            scanf("%[^]]", items[count++]);  // 读到 ']' 为止，存为一个选项
        }
    }
    return count;  // 返回选项个数
}

int main() {
    int h_count = get_items(hand);   // 读入手势、眼睛、嘴巴三行选项
    int e_count = get_items(eye);
    int m_count = get_items(mouth);
    
    int K;
    scanf("%d", &K);  // 查询次数
    for (int i = 0; i < K; i++) {  // 依次处理每个查询
        int a, b, c, d, e;  // 5 个序号：手-眼-嘴-眼-手
        scanf("%d %d %d %d %d", &a, &b, &c, &d, &e);
        if (a < 1 || a > h_count || e < 1 || e > h_count ||  // 序号越界则无效
            b < 1 || b > e_count || d < 1 || d > e_count ||
            c < 1 || c > m_count) {
            printf("Are you kidding me? @\\/@\n");
        } else {  // 有效：按 手(左眼嘴巴右眼)手 拼接输出
            printf("%s(%s%s%s)%s\n", hand[a-1], eye[b-1], mouth[c-1], eye[d-1], hand[e-1]);
        }
    }
    return 0;
}