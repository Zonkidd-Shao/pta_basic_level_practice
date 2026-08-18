/*
 * 1050 螺旋矩阵
 *
 * 【实现原理】
 * 给定 N 个正整数，按非递增顺序填入一个螺旋矩阵中。
 * 矩阵行数 m 和列数 n 满足：
 * - m >= n，且 m * n = N
 * - m - n 尽可能小（即 m 和 n 尽可能接近）
 * 填充方式：顺时针螺旋填充，从左上角 (0,0) 开始。
 *
 * 【算法思路】
 * 1. 确定矩阵尺寸：
 *    - n 从 sqrt(N) 向下枚举，找到第一个能整除 N 的 n
 *    - m = N / n，此时 m >= n 且差值最小
 * 2. 将数组从大到小排序
 * 3. 使用四个边界变量（top, bottom, left, right）模拟螺旋填充：
 *    - 从左到右填充上边界 top
 *    - 从上到下填充右边界 right
 *    - 从右到左填充下边界 bottom
 *    - 从下到上填充左边界 left
 *    - 每填充完一个边界后，对应边界向内收缩
 * 4. 输出矩阵
 *
 * 【关键点】
 * - 确定 n 的方法：从 sqrt(N) 向下找第一个 N 的因数
 * - 螺旋填充：用四个指针维护当前未填充区域的边界
 * - 排序后从大到小依次填入矩阵
 * - 每个方向填充后需检查 total < N 防止越界
 *
 * 【复杂度分析】
 * - 时间复杂度：O(N log N)，排序为主要开销，填充为 O(N)
 * - 空间复杂度：O(N)，存储矩阵
 */

#include <iostream>
#include <vector>
#include <algorithm>
#include <cmath>

using namespace std;

int main() {
    int N;
    if (!(cin >> N)) return 0;
    vector<int> a(N);
    for (int i = 0; i < N; ++i) cin >> a[i];

    // 确定列数 n：从 sqrt(N) 向下枚举，找到第一个能整除 N 的值
    int n = (int)sqrt(N);
    while (N % n != 0) --n;
    int m = N / n;  // 行数

    // 从大到小排序
    sort(a.begin(), a.end(), greater<int>());

    // 初始化矩阵为全 0
    vector<vector<int>> mat(m, vector<int>(n, 0));

    // 四个边界指针
    int top = 0, bottom = m - 1, left = 0, right = n - 1;
    int total = 0;  // 已填充元素计数

    // 顺时针螺旋填充
    while (total < N) {
        // 从左到右填充上边
        for (int j = left; j <= right && total < N; ++j) mat[top][j] = a[total++];
        ++top;  // 上边界下移

        // 从上到下填充右边
        for (int i = top; i <= bottom && total < N; ++i) mat[i][right] = a[total++];
        --right;  // 右边界左移

        // 从右到左填充下边
        for (int j = right; j >= left && total < N; --j) mat[bottom][j] = a[total++];
        --bottom;  // 下边界上移

        // 从下到上填充左边
        for (int i = bottom; i >= top && total < N; --i) mat[i][left] = a[total++];
        ++left;  // 左边界右移
    }

    // 输出矩阵
    for (int i = 0; i < m; ++i) {
        for (int j = 0; j < n; ++j) {
            if (j) cout << ' ';
            cout << mat[i][j];
        }
        cout << endl;
    }
    return 0;
}