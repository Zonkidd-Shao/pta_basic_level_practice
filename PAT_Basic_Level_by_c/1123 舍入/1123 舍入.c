/*
 * 题目：1123 舍入
 * 实现原理：
 *   对数字进行指定方式的舍入处理，保留D位小数。支持三种舍入方式：
 *   方式1（四舍五入）：第D+1位>=5则进位
 *   方式2（截尾法）：直接截断，不进位
 *   方式3（银行家舍入）：第D+1位<5不进位，>5进位，=5时看第D位奇偶性（奇数进位，偶数不进位），如果后面还有非零数字则进位
 *   算法步骤：
 *   1. 读取操作类型op和数字字符串num
 *   2. 分离整数部分和小数部分
 *   3. 根据op判断是否需要进位
 *   4. 如果需要进位，调用carry函数进行进位处理
 *   5. 输出结果
 */
#include <stdio.h>
#include <string.h>

void carry(char *s) {       // 对十进制数字串整体加 1（跳过小数点），处理连续进位
    int len = strlen(s);
    int i = len - 1;
    int carry = 1;
    while (i >= 0 && carry) {   // 从末位向前逐位进位
        if (s[i] == '.') {      // 小数点不参与进位
            i--;
            continue;
        }
        int t = s[i] - '0' + carry;
        if (t >= 10) {          // 本位产生进位，继续向前
            s[i] = t - 10 + '0';
            carry = 1;
        } else {
            s[i] = t + '0';
            carry = 0;
        }
        i--;
    }
    if (carry) {                // 最高位仍有进位：整体右移并在开头插入 '1'
        memmove(s + 1, s, len + 1);
        s[0] = '1';
    }
}

int main() {
    int N, D;
    scanf("%d %d", &N, &D);     // 测试用例数 N，保留小数位数 D
    while (N--) {
        int op;
        char num[205];
        scanf("%d %s", &op, num);   // 读入舍入方式 op 和数字串
        char res[205] = {0};
        char *dot = strchr(num, '.');
        if (dot == NULL) {          // 无小数部分：直接补 D 个 0
            strcpy(res, num);
            strcat(res, ".");
            for (int i = 0; i < D; i++) {
                strcat(res, "0");
            }
            printf("%s\n", res);
            continue;
        }
        char integer[205] = {0}, decimal[205] = {0};     // 分离整数部分和小数部分
        int int_len = dot - num;
        int dec_len = strlen(num) - int_len - 1;
        strncpy(integer, num, int_len);
        strncpy(decimal, dot + 1, dec_len);
        size_t decimal_len = strlen(decimal);
        while (decimal_len < (size_t)D + 1) {   // 小数部分补 0 到 D+1 位，便于判断舍入
            strcat(decimal, "0");
            decimal_len++;
        }
        char L = decimal[D - 1];    // 保留的最后一位（第 D 位）
        char H = decimal[D];        // 被舍去部分的最高位（第 D+1 位）
        int need_round = 0;         // 是否需要进位
        if (op == 1) {              // 四舍五入：第 D+1 位 >= 5 则进位
            if (H >= '5') need_round = 1;
        } else if (op == 2) {       // 截尾法：直接截断
            need_round = 0;
        } else if (op == 3) {       // 银行家舍入
            if (H < '5') need_round = 0;
            else if (H > '5') need_round = 1;
            else {                  // 恰为 5：看第 D 位奇偶及后面是否有非零数字
                int has_nonzero = 0;
                for (size_t i = (size_t)D + 1; i < decimal_len; i++) {     // 检查 5 之后是否还有非零位
                    if (decimal[i] != '0') {
                        has_nonzero = 1;
                        break;
                    }
                }
                if (has_nonzero) need_round = 1;
                else if ((L - '0') % 2 == 1) need_round = 1;    // 第 D 位为奇数则进位
                else need_round = 0;
            }
        }
        decimal[D] = '\0';      // 截断小数到 D 位
        sprintf(res, "%s.%s", integer, decimal);
        if (need_round) {       // 需要进位时对整体加 1
            carry(res);
        }
        if (res[0] == '-') {    // 处理 -0.xxx 的情况：结果全为零时去掉负号
            int all_zero = 1;
            for (size_t i = 1; i < strlen(res); i++) {
                if (res[i] != '.' && res[i] != '0') {
                    all_zero = 0;
                    break;
                }
            }
            if (all_zero) {
                memmove(res, res + 1, strlen(res));
            }
        }
        printf("%s\n", res);
    }
    return 0;
}
