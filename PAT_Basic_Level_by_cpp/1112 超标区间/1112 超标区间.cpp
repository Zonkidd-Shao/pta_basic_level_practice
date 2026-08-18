/*
 * 1112 超标区间
 *
 * 【实现原理】
 * 题目给定一个整数序列和一个阈值 T，找出序列中所有"极大连续超标区间"——
 * 即每一段内所有元素都大于 T，且该区间不能被扩展（即左右边界外的元素 ≤ T 或越界）。
 * 按 [起始位置, 结束位置]（以 1 为起始下标）的格式输出每个区间。
 *
 * 【算法思路】
 * 1. 使用双指针法遍历序列。
 * 2. 当遇到 a[i] > T 时，从 i 开始向右扩展，找到连续大于 T 的最长区间 [i, j-1]。
 * 3. 输出区间 [i+1, j]（转换为 1-based 下标），然后将 i 跳到 j 继续搜索。
 * 4. 若 a[i] ≤ T，则 i 递增继续检查。
 *
 * 【复杂度分析】
 * - 时间复杂度：O(N)，每个元素最多被访问两次。
 * - 空间复杂度：O(N)，存储序列。
 */
#include <iostream>
#include <vector>

using namespace std;

int main() {
    int n, t;
    if (!(cin >> n >> t)) return 0;
    vector<int> a(n);
    for (int i = 0; i < n; ++i) cin >> a[i];

    int i = 0;
    while (i < n) {
        if (a[i] > t) {                          // 找到一个大于 T 的元素
            int j = i;
            // 向右扩展，找到所有连续大于 T 的元素
            while (j < n && a[j] > t) ++j;
            cout << i + 1 << " " << j << endl;   // 输出区间（1-based 下标）
            i = j;                               // 跳过已处理的区间
        } else {
            ++i;
        }
    }
    return 0;
}