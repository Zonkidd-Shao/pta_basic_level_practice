/*
 * 1097 矩阵行平移
 *
 * 【实现原理】
 * 给定一个 N×N 矩阵，对矩阵的行进行循环平移操作：
 * - 奇数行（行号从 1 开始，即 i 为偶数时）向右循环平移 M 位。
 * - 偶数行（行号从 1 开始，即 i 为奇数时）向左循环平移 M 位。
 * M 可能大于 N，需要先对 N 取模（M %= N）。
 *
 * 【算法思路】
 * 1. 读取 N, M 和矩阵元素。
 * 2. M %= N 简化处理（循环平移 N 位等于不变）。
 * 3. 对每一行 i：
 *    - 若 i 为偶数（奇数行，从 1 起），向右平移：row[(j + m) % n] = a[i][j]。
 *    - 若 i 为奇数（偶数行，从 1 起），向左平移：row[(j - m + n) % n] = a[i][j]。
 * 4. 将平移后的行写回矩阵，最后输出结果。
 *
 * 【复杂度分析】
 * - 时间复杂度：O(N²)，需遍历整个矩阵一次。
 * - 空间复杂度：O(N)，仅需一行额外空间用于平移。
 */
#include <iostream>
#include <vector>

using namespace std;

int main() {
    int n, m;
    if (!(cin >> n >> m)) return 0;
    vector<vector<int>> a(n, vector<int>(n));
    for (int i = 0; i < n; ++i)
        for (int j = 0; j < n; ++j) cin >> a[i][j];

    m %= n;  // 循环平移 N 位等价于不变，取模简化
    for (int i = 0; i < n; ++i) {
        vector<int> row(n);
        for (int j = 0; j < n; ++j) {
            if (i % 2 == 0) row[(j + m) % n] = a[i][j];  // 奇数行（第 1,3,5,...行）右移
            else row[(j - m + n) % n] = a[i][j];          // 偶数行（第 2,4,6,...行）左移
        }
        a[i] = row;  // 写回平移后的行
    }

    // 输出结果矩阵
    for (int i = 0; i < n; ++i) {
        for (int j = 0; j < n; ++j) {
            if (j) cout << ' ';
            cout << a[i][j];
        }
        cout << endl;
    }
    return 0;
}
