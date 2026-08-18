/*
 * 题目：1064 朋友数
 * 实现原理：
 *   朋友数定义：两个数的各位数字之和相等即为朋友数。统计输入数字中的朋友数集合。
 *   算法步骤：
 *   1. 实现get_sum函数计算一个数的各位数字之和
 *   2. 使用visited数组（大小40，因为4位数字最大和为9*4=36）记录出现过的和
 *   3. 遍历输入，计算每个数字的和并标记visited
 *   4. 统计visited中非零元素个数，即为朋友数的个数
 *   5. 按升序输出所有朋友数
 */
#include <stdio.h>

int get_sum(int num) {  // 计算各位数字之和
    int sum = 0;
    while (num != 0) {
        sum += num % 10;  // 取最低位累加
        num /= 10;
    }
    return sum;
}

int main() {
    int N;
    scanf("%d", &N);
    
    int visited[40] = {0};  // 下标为各位数字之和，标记该朋友数是否出现过
    for (int i = 0; i < N; i++) {
        int num;
        scanf("%d", &num);
        int sum = get_sum(num);
        visited[sum] = 1;  // 记录出现过的朋友数
    }
    
    int count = 0;  // 不同朋友数的个数
    for (int i = 0; i < 40; i++) {
        if (visited[i]) count++;
    }
    
    printf("%d\n", count);
    int first = 1;  // 控制输出格式：第一个数字前不加空格
    for (int i = 0; i < 40; i++) {  // 按升序输出所有朋友数
        if (visited[i]) {
            if (first) {
                printf("%d", i);
                first = 0;
            } else {
                printf(" %d", i);
            }
        }
    }
    printf("\n");
    
    return 0;
}