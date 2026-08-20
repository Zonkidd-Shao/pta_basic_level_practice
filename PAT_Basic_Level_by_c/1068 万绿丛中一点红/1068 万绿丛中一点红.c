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

int arr[1002][1002] = {0};  // 图像像素值，四周留一圈 0 便于统一处理边界
static int cmp_int(const void *a, const void *b)
{
    int x = *(const int *)a;
    int y = *(const int *)b;
    return (x > y) - (x < y);
}

static int lower_bound_int(const int *a, int n, int value)
{
    int left = 0, right = n;
    while (left < right) {
        int middle = left + (right - left) / 2;
        if (a[middle] < value) left = middle + 1;
        else right = middle;
    }
    return left;
}

static int upper_bound_int(const int *a, int n, int value)
{
    int left = 0, right = n;
    while (left < right) {
        int middle = left + (right - left) / 2;
        if (a[middle] <= value) left = middle + 1;
        else right = middle;
    }
    return left;
}

int main() {
    int M, N, TOL;  // 宽 M、高 N，颜色差阈值 TOL
    scanf("%d %d %d", &M, &N, &TOL);
    int total = M * N;
    int *colors = malloc((size_t)total * sizeof(*colors));
    if (colors == NULL) return 1;
    
    for (int i = 1; i <= N; i++) {  // 读入图像并统计每种颜色出现次数
        for (int j = 1; j <= M; j++) {
            scanf("%d", &arr[i][j]);
            colors[(i - 1) * M + (j - 1)] = arr[i][j];
        }
    }
    qsort(colors, (size_t)total, sizeof(*colors), cmp_int);
    
    int x = 0, y = 0, cnt = 0;  // 特殊点坐标 (x, y) 及找到的个数
    for (int i = 1; i <= N; i++) {
        for (int j = 1; j <= M; j++) {
            int first = lower_bound_int(colors, total, arr[i][j]);
            int last = upper_bound_int(colors, total, arr[i][j]);
            if (last - first == 1) {  // 只检查出现一次的颜色
                int flag = 1;  // 标记是否满足与 8 邻域差值都大于 TOL
                for (int dx = -1; dx <= 1 && flag; dx++) {
                    for (int dy = -1; dy <= 1 && flag; dy++) {
                        if (dx == 0 && dy == 0) continue;  // 跳过自身
                        int ni = i + dx, nj = j + dy;
                        if (ni < 1 || ni > N || nj < 1 || nj > M) continue; // 越界跳过，外圈0不参与判断
                        if (abs(arr[i][j] - arr[ni][nj]) <= TOL) {  // 差值不够大则不满足
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
    
    free(colors);
    return 0;
}
