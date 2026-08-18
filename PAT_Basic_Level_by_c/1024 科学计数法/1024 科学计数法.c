/*
 * 题目：1024 科学计数法
 * 实现原理：
 *   将科学计数法表示的数字转换为普通小数形式。
 *   输入格式：A[.B]E+C 或 A[.B]E-C
 *   算法步骤：
 *   1. 定位E的位置，提取符号和尾数部分
 *   2. 解析指数部分（包括符号）
 *   3. 根据指数符号处理：
 *      - 指数为负：输出0.，然后输出|exp|-1个0，再输出所有数字
 *      - 指数为正：先输出整数部分，再输出小数部分，根据指数大小决定是否补0或加小数点
 *   注意：输入格式保证只有一个小数点和一个E。
 */
#include <stdio.h>
#include <string.h>

int main() {
    char s[10000];
    scanf("%s", s);
    int len = strlen(s);
    int e_pos = 0;
    while (s[e_pos] != 'E') e_pos++;    // 定位 E 的位置，E 之前为尾数部分
    char sign = s[0];                   // 整个数的正负号
    int exp = 0;
    int exp_sign = s[e_pos + 1] == '-' ? -1 : 1;   // 指数的正负号
    for (int i = e_pos + 2; i < len; i++) {        // 解析指数的绝对值
        exp = exp * 10 + (s[i] - '0');
    }
    exp *= exp_sign;                    // 得到带符号的指数值
    if (sign == '-') {                  // 负数先输出负号
        printf("-");
    }
    if (exp < 0) {                      // 指数为负：小数点左移，结果为 0.0...xxx
        printf("0.");
        for (int i = 0; i < -exp - 1; i++) {   // 先补足 |exp|-1 个 0
            printf("0");
        }
        printf("%c", s[1]);             // 输出整数部分数字
        for (int i = 3; i < e_pos; i++) {      // 输出全部小数位（跳过 s[2] 的小数点）
            printf("%c", s[i]);
        }
    } else {                            // 指数非负：小数点右移
        printf("%c", s[1]);             // 先输出整数部分
        int cnt = 0;                    // 小数位个数
        for (int i = 3; i < e_pos; i++) {
            printf("%c", s[i]);
            cnt++;
        }
        for (int i = 0; i < exp - cnt; i++) {   // 指数比小数位数大时，末尾补 0
            printf("0");
        }
        if (exp < cnt) {                // 指数小于小数位数时，中间补小数点
            printf(".");
            for (int i = exp + 3; i < e_pos; i++) {   // 输出小数点后剩余的小数位
                printf("%c", s[i]);
            }
        }
    }
    printf("\n");
    return 0;
}