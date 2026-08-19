/*
 * 题目：1081 检查密码
 * 实现原理：
 *   检查密码是否符合要求，按优先级输出相应提示：
 *   1. 长度不足6位："Your password is tai duan le."
 *   2. 包含非法字符（非字母、非数字、非点号）："Your password is tai luan le."
 *   3. 缺少数字："Your password needs shu zi."
 *   4. 缺少字母："Your password needs zi mu."
 *   5. 全部符合要求："Your password is wan mei."
 *   算法步骤：
 *   1. 读取密码数量n
 *   2. 逐行读取密码，统计长度和字符类型
 *   3. 按优先级判断并输出相应提示
 */
#include <stdio.h>
#include <ctype.h>

int main() {
    int n;
    scanf("%d", &n);
    getchar();              // 吃掉第一行末尾的换行符
    for (int i = 0; i < n; i++) {
        char c;
        int len = 0, has_num = 0, has_alpha = 0, has_invalid = 0;   // 分别记录长度、有无数字/字母/非法字符
        while ((c = getchar()) != '\n') {       // 逐字符读入一行密码（密码可含空格）
            len++;
            if (isdigit(c)) {
                has_num = 1;
            } else if (isalpha(c)) {
                has_alpha = 1;
            } else if (c != '.') {              // 除字母、数字、点号外均为非法字符
                has_invalid = 1;
            }
        }
        if (len < 6) {                          // 按优先级依次判断并输出提示
            printf("Your password is tai duan le.\n");
        } else if (has_invalid) {
            printf("Your password is tai luan le.\n");
        } else if (!has_num) {
            printf("Your password needs shu zi.\n");
        } else if (!has_alpha) {
            printf("Your password needs zi mu.\n");
        } else {
            printf("Your password is wan mei.\n");
        }
    }
    return 0;
}