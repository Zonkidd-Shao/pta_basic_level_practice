/*
 * 题目：1079 延迟的回文数
 * 实现原理：
 *   对一个非回文数进行变换：将其与自身的逆序相加，重复此过程直到得到回文数。
 *   如果10次迭代后仍未得到回文数，则输出"Not found in 10 iterations."
 *   算法步骤：
 *   1. is_palindrome函数：判断字符串是否为回文
 *   2. reverse函数：将字符串逆序
 *   3. add函数：实现两个大整数相加（以字符串形式）
 *   4. 主循环：最多迭代10次，每次输出变换过程
 */
#include <stdio.h>
#include <string.h>

int is_palindrome(char *s) {
    int len = strlen(s);
    for (int i = 0; i < len / 2; i++) {     // 只比较前半部分与对称位置
        if (s[i] != s[len - 1 - i]) {
            return 0;                       // 发现不对称即非回文
        }
    }
    return 1;
}

void reverse(char *s, char *r) {
    int len = strlen(s);
    for (int i = 0; i < len; i++) {
        r[i] = s[len - 1 - i];              // 逆序拷贝到r
    }
    r[len] = '\0';
}

void add(char *a, char *b, char *c) {
    int len = strlen(a);
    int carry = 0, idx = 0;
    for (int i = len - 1; i >= 0; i--) {    // 从低位到高位逐位相加
        int sum = (a[i] - '0') + (b[i] - '0') + carry;
        c[idx++] = sum % 10 + '0';
        carry = sum / 10;                   // 进位
    }
    if (carry) {                            // 最高位仍有进位则追加
        c[idx++] = carry + '0';
    }
    c[idx] = '\0';
    int i = 0, j = idx - 1;
    while (i < j) {                         // 结果是逆序存储的，翻转回正序
        char t = c[i];
        c[i] = c[j];
        c[j] = t;
        i++;
        j--;
    }
}

int main() {
    char s[2001], r[2001], c[2001];     // s:当前数; r:s的逆序; c:相加结果
    scanf("%s", s);
    if (is_palindrome(s)) {             // 输入本身已是回文数，直接输出
        printf("%s is a palindromic number.\n", s);
        return 0;
    }
    for (int i = 0; i < 10; i++) {      // 最多进行10次迭代
        reverse(s, r);
        printf("%s + %s = ", s, r);
        add(s, r, c);
        printf("%s\n", c);
        strcpy(s, c);                   // 用相加结果替换当前数
        if (is_palindrome(s)) {
            printf("%s is a palindromic number.\n", s);
            return 0;
        }
    }
    printf("Not found in 10 iterations.\n");    // 10次内未得到回文数
    return 0;
}