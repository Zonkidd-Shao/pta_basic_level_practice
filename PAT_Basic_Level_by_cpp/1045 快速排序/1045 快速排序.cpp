/*
 * 1045 快速排序
 *
 * 【实现原理】
 * 给定 N 个不同正整数的排列，找出在快速排序中可以作为基准（pivot）的元素。
 * 在快速排序中，基准元素经过一轮划分后会被放到最终的正确位置上，
 * 即：基准元素左边的所有元素都小于它，右边的所有元素都大于它。
 * 等价条件：该元素在排序后的序列中位置不变，且大于左侧所有元素、小于右侧所有元素。
 * 由于元素互异，只需检查：a[i] == 排序后同位置的元素 && a[i] 大于左侧所有元素。
 *
 * 【算法思路】
 * 1. 复制数组并排序得到有序序列 b
 * 2. 一次遍历原数组 a，维护当前左侧的最大值 maxLeft
 * 3. 对每个位置 i：
 *    - 更新 maxLeft = max(maxLeft, a[i])
 *    - 若 a[i] == maxLeft（说明 a[i] 是左侧最大值）且 a[i] == b[i]（排序后位置不变），
 *      则 a[i] 是基准元素
 * 4. 按原顺序输出所有基准元素
 *
 * 【关键点】
 * - a[i] == maxLeft 保证了 a[i] 大于左侧所有元素（即它在左侧是最大值）
 * - a[i] == b[i] 保证了排序后位置不变（由于元素互异，这意味着右侧元素都大于它）
 * - 两个条件合起来等价于：a[i] 是左侧最大值且处于排序后的正确位置
 * - 若基准元素个数为 0，仍需输出一个空行（题目要求）
 *
 * 【复杂度分析】
 * - 时间复杂度：O(N log N)，排序的时间开销
 * - 空间复杂度：O(N)，需要排序后的数组用于比较
 */

#include <iostream>
#include <vector>
#include <algorithm>
#include <climits>

using namespace std;

int main() {
    int n;
    if (!(cin >> n)) return 0;

    vector<int> a(n), b(n);
    for (int i = 0; i < n; ++i) { cin >> a[i]; b[i] = a[i]; }

    // 排序得到每个位置上的最终元素
    sort(b.begin(), b.end());

    int maxLeft = INT_MIN;      // 当前遍历过的左侧部分的最大值
    vector<int> res;            // 存储所有基准元素

    for (int i = 0; i < n; ++i) {
        if (a[i] > maxLeft) maxLeft = a[i];  // 更新左侧最大值
        // 条件1: a[i] 大于左侧所有元素（它自己就是左侧最大值）
        // 条件2: a[i] 在排序后位置不变（从而右侧元素都大于它）
        if (a[i] == maxLeft && a[i] == b[i]) res.push_back(a[i]);
    }

    // 输出结果
    cout << res.size() << endl;
    for (size_t i = 0; i < res.size(); ++i) {
        if (i) cout << ' ';
        cout << res[i];
    }
    cout << endl;  // 即使个数为 0 也要输出空行
    return 0;
}