/*
 * 1030 完美数列
 *
 * 【实现原理】
 * 给定一个正整数数列和一个正整数 p，要求从数列中选出尽可能多的数，
 * 使得这些数中的最大值 M 不超过最小值 m 的 p 倍，即 M <= m * p。
 * 这样的数列称为"完美数列"。
 *
 * 【算法思路】
 * 1. 先将数列从小到大排序（排序后，最小值 m 和最大值 M 分别对应子序列的两端）
 * 2. 使用双指针（滑动窗口）技巧：
 *    - 左指针 i 指向子序列的最小值位置
 *    - 右指针 j 指向子序列最大值位置的下一个位置（开区间）
 *    - 对于每个 i，向右移动 j 直到 a[j] > a[i] * p，此时满足条件的子序列长度为 j-i
 * 3. 记录所有满足条件的子序列的最大长度
 *
 * 【关键点】
 * - 双指针的单调性：当 i 增大时，a[i] 增大，a[i]*p 也增大，因此 j 不需要回退，
 *   只需继续向右移动即可，这保证了 O(N) 的均摊复杂度
 * - 注意使用 long long 类型，因为 a[i] * p 可能超出 int 范围
 * - 排序后，满足条件的子序列一定是连续的一段（因为排序后最大值和最小值都在两端）
 *
 * 【复杂度分析】
 * - 时间复杂度：O(N log N)，排序为 O(N log N)，双指针遍历为 O(N)
 * - 空间复杂度：O(N)，存储数列
 */

#include <iostream>
#include <vector>
#include <algorithm>

using namespace std;

int main() {
    int n;
    long long p;  // 使用 long long 防止乘法溢出
    if (!(cin >> n >> p)) return 0;

    vector<long long> a(n);
    for (int i = 0; i < n; ++i) cin >> a[i];

    // 升序排序，使数列有序化
    sort(a.begin(), a.end());

    int maxLen = 0;  // 最长完美子序列的长度
    int j = 0;       // 右指针，指向当前满足条件的最大位置的下一个

    // 左指针 i 遍历每一个位置作为最小值
    for (int i = 0; i < n; ++i) {
        if (j < i) j = i;  // 确保右指针不小于左指针
        // 向右移动右指针，直到不满足 M <= m * p 条件
        while (j < n && a[j] <= a[i] * p) ++j;
        // 更新最大长度：当前子序列为 [i, j)，长度为 j-i
        maxLen = max(maxLen, j - i);
    }

    cout << maxLen << endl;
    return 0;
}