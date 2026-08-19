/*
 * 1098 岩洞施工
 *
 * 【实现原理】
 * 在岩洞中要挖一条水平隧道，岩洞的横截面由 N 根柱子支撑，
 * 每根柱子的高度表示从地面到洞顶的距离。
 * 水平隧道的最大高度 H 必须 ≤ 每根柱子的高度，否则会凿穿洞顶。
 * 因此 H 的最大值就是所有柱子高度的最小值。
 *
 * 【算法思路】
 * 1. 读取柱子数量 N。
 * 2. 读取每根柱子的高度，同时维护最小值 minH。
 * 3. 输出 minH 即为可挖掘的最大隧道高度。
 *
 * 【复杂度分析】
 * - 时间复杂度：O(N)，只需一次遍历找出最小值。
 * - 空间复杂度：O(1)，只使用常数额外空间。
 */
#include <iostream>
#include <algorithm>

using namespace std;

int main() {
    int n;
    if (!(cin >> n)) return 0;
    int minH = 1 << 30;      // 初始化为较大的值
    for (int i = 0; i < n; ++i) {
        int h;
        cin >> h;
        minH = min(minH, h); // 维护最小值
    }
    cout << minH << endl;    // 最大隧道高度 = 所有柱子高度的最小值
    return 0;
}
