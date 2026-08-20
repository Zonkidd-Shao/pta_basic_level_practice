/*
 * 题目：1024 科学计数法
 * 实现原理：
 *   将科学计数法表示的数字转换为普通小数形式。
 *   输入格式：A[.B]E+C 或 A[.B]E-C
 *   算法步骤：
 *   1. 定位E的位置，提取符号和尾数部分
 *   2. 解析指数部分（包括符号）
 *   3. 设 digits = 去掉点的数字部分，pos = 1+exp，分三路：
 *      - pos<=0 -> "0."+(-pos)个0+digits
 *      - pos>=len(digits) -> digits+pos-len 个0
 *      - 否则 digits[:pos]+'.'+digits[pos:]
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

    // 构造 digits = 去掉点的数字部分
    char digits[10000];
    int dlen = 0;
    digits[dlen++] = s[1];              // 整数部分
    for (int i = 3; i < e_pos; i++) {   // 小数部分，跳过 s[2] 的 '.'
        digits[dlen++] = s[i];
    }
    digits[dlen] = '\0';
    int pos = 1 + exp;                  // 小数点应插入的位置

    if (sign == '-') {                  // 负数先输出负号
        printf("-");
    }
    if (pos <= 0) {
        printf("0.");
        for (int i = 0; i < -pos; i++) printf("0");
        printf("%s", digits);
    } else if (pos >= dlen) {
        printf("%s", digits);
        for (int i = 0; i < pos - dlen; i++) printf("0");
    } else {
        for (int i = 0; i < pos; i++) printf("%c", digits[i]);
        printf(".");
        for (int i = pos; i < dlen; i++) printf("%c", digits[i]);
    }
    printf("\n");
    return 0;
}
