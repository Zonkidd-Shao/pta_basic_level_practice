/*
 * 题目：1054 求平均值
 * 实现原理：
 *   判断输入的数字是否合法，计算合法数字的平均值。
 *   合法条件：
 *   1. 数值范围在[-1000, 1000]
 *   2. 最多保留两位小数
 *   算法步骤：
 *   1. 使用sscanf将字符串转换为double
 *   2. 使用sprintf将double格式化保留两位小数
 *   3. 比较原字符串和格式化后的字符串是否一致
 *   4. 统计合法数字的个数和总和，计算平均值
 */
#include <stdio.h>
#include <string.h>

int main() {
    int N, cnt = 0;   // N: 输入个数; cnt: 合法数字个数
    char a[50], b[50];  // a: 原始输入串; b: 格式化后的参考串
    double temp = 0.0, sum = 0.0;  // temp: 解析出的数值; sum: 合法数字总和
    scanf("%d", &N);
    
    for (int i = 0; i < N; i++) {
        scanf("%s", a);
        sscanf(a, "%lf", &temp);      // 把字符串解析为 double
        sprintf(b, "%.2lf", temp);    // 再格式化为两位小数，作为合法性参照
        int flag = 0;  // 标记：格式是否非法
        for (int j = 0; j < strlen(a); j++) {  // 逐位比较：原串与两位小数形式不同则非法
            if (a[j] != b[j]) {
                flag = 1;
                break;
            }
        }
        if (flag || temp < -1000 || temp > 1000) {  // 格式非法或超出范围
            printf("ERROR: %s is not a legal number\n", a);
        } else {  // 合法：累加总和并计数
            sum += temp;
            cnt++;
        }
    }
    
    if (cnt == 0) {  // 按合法个数分类输出平均值
        printf("The average of 0 numbers is Undefined\n");
    } else if (cnt == 1) {
        printf("The average of 1 number is %.2lf\n", sum);
    } else {
        printf("The average of %d numbers is %.2lf\n", cnt, sum / cnt);
    }
    return 0;
}