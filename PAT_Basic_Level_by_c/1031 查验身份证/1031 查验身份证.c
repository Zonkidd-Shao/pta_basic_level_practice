/*
 * 题目：1031 查验身份证
 * 实现原理：
 *   根据身份证号码校验规则验证身份证的有效性。
 *   校验规则：
 *   1. 前17位必须为数字
 *   2. 计算校验码：
 *      - sum = sum(id[j] * weight[j]) for j=0..16
 *      - z = sum % 11
 *      - 校验码应为check[z]（第18位）
 *   算法步骤：
 *   1. 定义weight数组和check数组
 *   2. 对每个身份证号码，检查前17位是否为数字
 *   3. 计算校验码并与第18位比较
 *   4. 输出所有无效的身份证号码，若全部有效则输出"All passed"
 */
#include <stdio.h>
#include <string.h>

int main() {
    int n;
    scanf("%d", &n);
    int weight[17] = {7, 9, 10, 5, 8, 4, 2, 1, 6, 3, 7, 9, 10, 5, 8, 4, 2};  // 前17位加权因子
    char check[11] = {'1', '0', 'X', '9', '8', '7', '6', '5', '4', '3', '2'};  // 加权和%11后对应的校验码
    int all_passed = 1;  // 是否全部通过
    for (int i = 0; i < n; i++) {
        char id[19];
        scanf("%s", id);
        int flag = 1;  // 当前身份证是否有效
        int sum = 0;   // 前17位加权和
        for (int j = 0; j < 17; j++) {
            if (id[j] < '0' || id[j] > '9') {  // 前17位必须都是数字
                flag = 0;
                break;
            }
            sum += (id[j] - '0') * weight[j];
        }
        if (flag) {
            int z = sum % 11;
            if (check[z] != id[17]) {  // 第18位与计算出的校验码不符
                flag = 0;
            }
        }
        if (!flag) {  // 无效身份证：输出并记录
            printf("%s\n", id);
            all_passed = 0;
        }
    }
    if (all_passed) {
        printf("All passed\n");
    }
    return 0;
}