/*
 * 题目：1068 万绿丛中一点红
 * 实现原理：
 *   在图像中找出唯一的特殊颜色点。特殊点定义：
 *   1. 该颜色在图像中只出现一次
 *   2. 与周围8个像素的颜色差绝对值都大于TOL
 *   算法步骤：
 *   1. 使用count_color数组统计每种颜色出现的次数
 *   2. 遍历图像，找到颜色出现次数为1的像素
 *   3. 检查该像素与周围8个像素的颜色差是否都大于TOL
 *   4. 根据结果输出：不存在/唯一位置/不唯一
 *   注意：图像索引从1开始，便于边界处理。
 */
#include <stdio.h>
#include <stdlib.h>
#include <math.h>

int arr[1002][1002] = {0};  // 图像像素值，四周留一圈 0 便于统一处理边界
long long count_color[17000000] = {0};  // 每种颜色值出现的次数（颜色可能为负数，故用下标）

int main() {
    int M, N, TOL;  // 宽 M、高 N，颜色差阈值 TOL
    scanf("%d %d %d", &M, &N, &TOL);
    
    for (int i = 1; i <= N; i++) {  // 读入图像并统计每种颜色出现次数
        for (int j = 1; j <= M; j++) {
            scanf("%d", &arr[i][j]);
            count_color[arr[i][j]]++;
        }
    }
    
    int x = 0, y = 0, cnt = 0;  // 特殊点坐标 (x, y) 及找到的个数
    for (int i = 1; i <= N; i++) {
        for (int j = 1; j <= M; j++) {
            if (count_color[arr[i][j]] == 1) {  // 只检查出现一次的颜色
                int flag = 1;  // 标记是否满足与 8 邻域差值都大于 TOL
                for (int dx = -1; dx <= 1 && flag; dx++) {
                    for (int dy = -1; dy <= 1 && flag; dy++) {
                        if (dx == 0 && dy == 0) continue;  // 跳过自身
                        if (abs(arr[i][j] - arr[i+dx][j+dy]) <= TOL) {  // 差值不够大则不满足
                            flag = 0;
                        }
                    }
                }
                if (flag) {  // 满足条件：记录坐标并计数
                    x = j;
                    y = i;
                    cnt++;
                    if (cnt > 1) break;  // 已多于一个，无需继续找
                }
            }
        }
        if (cnt > 1) break;
    }
    
    if (cnt == 0) {  // 没有符合条件的点
        printf("Not Exist\n");
    } else if (cnt == 1) {  // 唯一：输出坐标和颜色值
        printf("(%d, %d): %d\n", x, y, arr[y][x]);
    } else {  // 多个符合条件的点
        printf("Not Unique\n");
    }
    
    return 0;
}