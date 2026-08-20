/*
 * 题目：1116 多二了一点
 * 修复：Y=s 应 strncpy(Y,s,n); Y[n]='\0' 且数值比较 abs(atoi(X)-atoi(Y))==2
 */
#include <stdio.h>
#include <string.h>
#include <stdlib.h>
int main() {
    char s[1005];
    scanf("%s", s);
    int len = strlen(s);
    if (len % 2 != 0) {
        printf("Error: %d digit(s)\n", len);
        return 0;
    }
    int n = len / 2;
    char X[1005], Y[1005];
    strncpy(Y, s, n);
    Y[n] = '\0';
    strcpy(X, s + n);
    // 数值比较
    long long xv = atoll(X);
    long long yv = atoll(Y);
    long long diff = xv - yv;
    if (diff < 0) diff = -diff;
    if (diff == 2) {
        printf("Yes: %s - %s = 2\n", X, Y);
    } else {
        printf("No: %s - %s != 2\n", X, Y);
    }
    return 0;
}
