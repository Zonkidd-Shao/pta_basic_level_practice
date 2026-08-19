/*
 * 题目：1118 如需挪车请致电
 * 实现原理：
 *   将11个字符（可能是数字、拼音、数学表达式）转换为数字，组成电话号码。
 *   规则：
 *   - 单个字符直接输出
 *   - 形如"sqrt(x)"的表达式计算平方根
 *   - 中文拼音（ling-jiu）转换为对应数字（0-9）
 *   - 数学表达式（a+b, a-b, a*b, a/b, a%b, a^b）计算结果
 *   算法步骤：
 *   1. 读取11个输入字符串
 *   2. 根据字符串类型进行相应转换
 *   3. 输出转换后的电话号码
 */
#include <stdio.h>
#include <string.h>
#include <math.h>

int main() {
    char s[20];
    for (int i = 0; i < 11; i++) {      // 依次处理组成电话号码的 11 个字符
        scanf("%s", s);
        int len = strlen(s);
        if (len == 1) {                 // 单个字符直接输出
            printf("%c", s[0]);
        } else if (s[0] == 's' && s[1] == 'q') {    // sqrt(x) 形式：求平方根
            int num = 0;
            for (int j = 4; j < len; j++) {     // 解析括号内的数字
                num = num * 10 + (s[j] - '0');
            }
            printf("%d", (int)sqrt(num));
        } else {
            int is_pinyin = 1;
            for (int j = 0; j < len; j++) {     // 判断是否全为小写字母（拼音）
                if (!((s[j] >= 'a' && s[j] <= 'z'))) {
                    is_pinyin = 0;
                    break;
                }
            }
            if (is_pinyin) {    // 中文数字拼音转对应数字
                if (strcmp(s, "ling") == 0) printf("0");
                else if (strcmp(s, "yi") == 0) printf("1");
                else if (strcmp(s, "er") == 0) printf("2");
                else if (strcmp(s, "san") == 0) printf("3");
                else if (strcmp(s, "si") == 0) printf("4");
                else if (strcmp(s, "wu") == 0) printf("5");
                else if (strcmp(s, "liu") == 0) printf("6");
                else if (strcmp(s, "qi") == 0) printf("7");
                else if (strcmp(s, "ba") == 0) printf("8");
                else if (strcmp(s, "jiu") == 0) printf("9");
            } else {    // 数学表达式 a op b：先解析两个操作数和运算符
                int a = 0, b = 0, j = 0;
                while (j < len && s[j] >= '0' && s[j] <= '9') {     // 解析第一个操作数
                    a = a * 10 + (s[j] - '0');
                    j++;
                }
                char op = s[j];
                j++;
                while (j < len) {       // 解析第二个操作数
                    b = b * 10 + (s[j] - '0');
                    j++;
                }
                if (op == '+') printf("%d", a + b);         // 按运算符计算结果
                else if (op == '-') printf("%d", a - b);
                else if (op == '*') printf("%d", a * b);
                else if (op == '/') printf("%d", a / b);
                else if (op == '%') printf("%d", a % b);
                else if (op == '^') printf("%d", (int)pow(a, b));
            }
        }
    }
    printf("\n");
    return 0;
}