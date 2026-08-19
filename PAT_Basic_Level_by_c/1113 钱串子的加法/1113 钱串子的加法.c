/*
 * 题目：1113 钱串子的加法
 * 实现原理：
 *   在30进制下进行两个数的加法运算。数字0-9对应字符'0'-'9'，10-29对应字符'a'-'t'。
 *   算法步骤：
 *   1. char_to_val函数：将字符转换为数值（0-29）
 *   2. val_to_char函数：将数值转换为字符
 *   3. 确保a是较长的字符串，b较短则在前面补0对齐
 *   4. 从右向左逐位相加，进位规则：sum % 30为当前位，sum / 30为进位
 *   5. 处理最后的进位和前导零
 */
#include <stdio.h>
#include <string.h>

int char_to_val(char c) {       // 字符转数值：'0'-'9' 为 0-9，'a'-'t' 为 10-29
    if (c >= '0' && c <= '9') return c - '0';
    return c - 'a' + 10;
}

char val_to_char(int v) {       // 数值转字符（30 进制）
    if (v < 10) return '0' + v;
    return 'a' + v - 10;
}

int main() {
    char a[100005], b[100005], ans[100006];
    scanf("%s %s", a, b);   // 读入两个 30 进制数字串
    int len_a = strlen(a);
    int len_b = strlen(b);
    if (len_a < len_b) {    // 交换使 a 是较长的串
        char t[100005];
        strcpy(t, a); strcpy(a, b); strcpy(b, t);
        int tmp = len_a; len_a = len_b; len_b = tmp;
    }
    for (int i = len_a - len_b; i > 0; i--) {   // 短串前面补 '0' 对齐长度
        char temp[100005];
        sprintf(temp, "0%s", b);
        strcpy(b, temp);
    }
    int carry = 0, idx = 0;
    for (int i = len_a - 1; i >= 0; i--) {      // 从低位向高位逐位相加
        int num_a = char_to_val(a[i]);
        int num_b = char_to_val(b[i]);
        int now = num_a + num_b + carry;
        ans[idx++] = val_to_char(now % 30);     // 当前位取余，向高位进位
        carry = now / 30;
    }
    if (carry > 0) {        // 最高位仍有进位则再补一位
        ans[idx++] = val_to_char(carry);
    }
    int start = idx - 1;
    while (start > 0 && ans[start] == '0') start--; // 去掉结果前导零
    for (int i = start; i >= 0; i--) {      // 逆序输出结果
        printf("%c", ans[i]);
    }
    printf("\n");
    return 0;
}