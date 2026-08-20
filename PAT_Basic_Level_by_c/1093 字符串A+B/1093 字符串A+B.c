/*
 * 题目：1093 字符串A+B
 * 实现原理：
 *   将两个字符串A和B合并，去掉重复字符，保持字符首次出现的顺序。
 *   算法步骤：
 *   1. 使用com数组标记字符是否已输出
 *   2. 遍历字符串A，输出未标记的字符并标记
 *   3. 遍历字符串B，输出未标记的字符并标记
 *   注意：使用unsigned char处理字符，防止索引越界
 */
#include <stdio.h>
#include <string.h>

int main() {
    char A[1000002], B[1000002];
    fgets(A, sizeof(A), stdin);
    fgets(B, sizeof(B), stdin);
    A[strcspn(A, "\n")] = '\0';
    B[strcspn(B, "\n")] = '\0';
    int com[129] = {0};     // com[c]标记ASCII码c的字符是否已输出
    int lenA = strlen(A), lenB = strlen(B);
    for (int i = 0; i < lenA; i++) {    // 先输出A中首次出现的字符
        char temp = A[i];
        if (com[(unsigned char)temp] == 0) {    // 强制转unsigned防止负ASCII码越界
            printf("%c", temp);
            com[(unsigned char)temp] = 1;       // 标记为已输出
        }
    }
    for (int i = 0; i < lenB; i++) {    // 再处理B，与A共用一个去重标记
        char temp = B[i];
        if (com[(unsigned char)temp] == 0) {
            printf("%c", temp);
            com[(unsigned char)temp] = 1;
        }
    }
    printf("\n");
    return 0;
}
