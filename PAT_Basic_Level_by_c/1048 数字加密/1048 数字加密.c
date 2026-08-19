/*
 * 题目：1048 数字加密
 * 实现原理：
 *   对两个数字进行加密处理。加密规则：
 *   - 从右往左数，第1、3、5...位（奇数位）：(A[i]+B[i])%13，结果映射为0-9,J,Q,K
 *   - 第2、4、6...位（偶数位）：(B[i]-A[i])%10，若为负则+10
 *   算法步骤：
 *   1. 从右往左遍历两个字符串
 *   2. 根据位置奇偶性执行不同运算
 *   3. 将结果存入result数组（从左到右）
 *   4. 反转输出result数组
 *   注意：两个数字长度可能不同，短的高位补0。
 */
#include <stdio.h>
#include <string.h>

int main() {
    char A[101], B[101];
    scanf("%s %s", A, B);
    
    int lenA = strlen(A);
    int lenB = strlen(B);
    int max_len = lenA > lenB ? lenA : lenB;  // 以较长者为准，短的高位补 0
    
    char result[101];
    int index = 0;
    
    for (int i = 0; i < max_len; i++) {  // 从右往左逐位处理（i 为从右起的偏移）
        int a = (i < lenA) ? A[lenA - 1 - i] - '0' : 0;  // 超出长度的位按 0 处理
        int b = (i < lenB) ? B[lenB - 1 - i] - '0' : 0;
        
        if (i % 2 == 0) {  // 奇数位（第 1、3、5... 位）：(A+B)%13
            int sum = (a + b) % 13;
            if (sum == 10) result[index++] = 'J';  // 10~12 映射为 J、Q、K
            else if (sum == 11) result[index++] = 'Q';
            else if (sum == 12) result[index++] = 'K';
            else result[index++] = sum + '0';
        } else {  // 偶数位（第 2、4、6... 位）：(B-A)%10，结果为负则 +10
            int diff = b - a;
            if (diff < 0) diff += 10;
            result[index++] = diff + '0';
        }
    }
    
    for (int i = index - 1; i >= 0; i--) {  // result 是逆序存的，反转输出
        printf("%c", result[i]);
    }
    printf("\n");
    
    return 0;
}