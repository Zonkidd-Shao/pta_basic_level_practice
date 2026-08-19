/*
 * 题目：1074 宇宙无敌加法器
 * 实现原理：
 *   在不同进制下进行加法运算。每一位的进制由字符串s指定。
 *   规则：s[i]表示第i位的进制，如果s[i]='0'则表示十进制。
 *   算法步骤：
 *   1. 将两个加数s1和s2补齐到与s相同长度（高位补0）
 *   2. 从右向左逐位进行加法运算
 *   3. 每一位的进位规则：sum % mod为当前位，sum / mod为进位
 *   4. 处理最后的进位和前导零
 */
#include <stdio.h>
#include <string.h>

int main() {
    char s[21], s1[21], s2[21], ans[22];  // s: 进制表; s1/s2: 两个加数; ans: 结果（数字字符）
    scanf("%s %s %s", s, s1, s2);
    int len = strlen(s);  // 进制表长度即结果的最大位数
    for (int i = strlen(s1); i < len; i++) {  // 把 s1 高位补 '0' 对齐到 len 位
        s1[i] = '0';
    }
    s1[len] = '\0';
    for (int i = strlen(s2); i < len; i++) {  // s2 同样高位补 '0'
        s2[i] = '0';
    }
    s2[len] = '\0';
    int carry = 0;  // 进位
    for (int i = len - 1; i >= 0; i--) {  // 从最低位向高位逐位相加
        int mod = s[i] == '0' ? 10 : s[i] - '0';  // 本位的进制：'0' 表示十进制
        int sum = (s1[i] - '0') + (s2[i] - '0') + carry;
        ans[i] = sum % mod + '0';  // 本位的最终数字
        carry = sum / mod;         // 向高位的进位
    }
    int start = 0;  // 输出起始下标（跳过前导 0）
    if (carry) {  // 最高位仍有进位：把进位插入结果最前面
        ans[0] = carry + '0';
        for (int i = len; i > 0; i--) {  // 原结果整体后移一位
            ans[i] = ans[i - 1];
        }
        len++;
    } else {  // 无额外进位：跳过前导 0
        while (start < len && ans[start] == '0') {
            start++;
        }
    }
    if (start == len) {  // 结果全为 0：输出单个 0
        printf("0");
    } else {
        for (int i = start; i < len; i++) {
            printf("%c", ans[i]);
        }
    }
    printf("\n");
    return 0;
}