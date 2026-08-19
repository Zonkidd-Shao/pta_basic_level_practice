/*
 * 题目：1005 继续(3n+1)猜想
 * 实现原理：
 *   输入k个待验证的数字，找出其中的"关键数"——即不会被其他数字的验证过程覆盖的数。
 *   算法步骤：
 *   1. 使用visited数组记录所有被覆盖的数字（初始化为0）
 *   2. 对每个输入的数字，模拟(3n+1)猜想的迭代过程，将所有经过的数字标记为已访问
 *   3. 对输入的数字进行降序排序
 *   4. 遍历排序后的数字，输出所有未被标记为已访问的数字（关键数）
 */
#include <stdio.h>

int main() {
    int k;
    scanf("%d", &k);
    int num[100], visited[10000] = {0};   // num 存 k 个输入数，visited 标记被覆盖过的数字
    for (int i = 0; i < k; i++) {
        scanf("%d", &num[i]);
        int n = num[i];
        while (n != 1) {                  // 模拟 (3n+1) 猜想的迭代过程
            if (n % 2 == 0) {
                n /= 2;
            } else {
                n = (3 * n + 1) / 2;
            }
            visited[n] = 1;               // 标记该中间结果为"被覆盖"
        }
    }
    int first = 1;                        // 控制输出格式：第一个数前不输出空格
    for (int i = 0; i < k; i++) {         // 冒泡排序，将输入数字降序排列
        for (int j = i + 1; j < k; j++) {
            if (num[i] < num[j]) {
                int temp = num[i];
                num[i] = num[j];
                num[j] = temp;
            }
        }
    }
    for (int i = 0; i < k; i++) {
        if (!visited[num[i]]) {           // 未被任何数字覆盖的即为关键数
            if (!first) {
                printf(" ");              // 数字之间以空格分隔
            }
            printf("%d", num[i]);
            first = 0;
        }
    }
    printf("\n");
    return 0;
}