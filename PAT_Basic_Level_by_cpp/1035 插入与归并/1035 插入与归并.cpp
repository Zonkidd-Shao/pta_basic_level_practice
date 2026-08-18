/*
 * 1035 插入与归并
 *
 * 【实现原理】
 * 给定原始序列和经过某排序算法若干次迭代后的中间序列，判断是插入排序还是归并排序，
 * 并输出下一步迭代的结果。
 *
 * 插入排序特征：前若干位已有序且与原始序列前若干位相同，后面位置与原始序列相同。
 * 归并排序特征：每 2^k 个元素组成的子段内有序，段边界与原始序列不同。
 *
 * 【算法思路】
 * 1. 先试探插入排序：从原始序列开始模拟插入排序每一步，
 *    每一步结束后与给定序列比较。若匹配，则再做一步插入排序后输出结果。
 * 2. 若不是插入排序，则一定是归并排序：
 *    从原始序列开始模拟自底向上的归并排序（步长 2, 4, 8, ...），
 *    每步对每段进行排序，与给定序列比较。匹配后再做一趟归并后输出。
 *
 * 【关键点】
 * - 判断排序类型时，必须从原始序列开始模拟，而非直接检查特征
 * - 插入排序匹配后需再做一步，即再插入下一个元素
 * - 归并排序是自底向上（非递归）的方式，步长每次翻倍
 * - same 函数用于比较两个 vector 是否相等
 *
 * 【复杂度分析】
 * - 时间复杂度：O(N^2 log N)，插入排序每步 O(N)，归并排序每趟 O(N log N)
 * - 空间复杂度：O(N)，需要复制原始序列进行模拟
 */

#include <iostream>
#include <vector>
#include <algorithm>

using namespace std;

// 判断两个 vector 是否完全相同
bool same(const vector<int>& a, const vector<int>& b) {
    for (size_t i = 0; i < a.size(); ++i)
        if (a[i] != b[i]) return false;
    return true;
}

int main() {
    int n;
    if (!(cin >> n)) return 0;
    vector<int> orig(n), given(n);
    for (int i = 0; i < n; ++i) cin >> orig[i];
    for (int i = 0; i < n; ++i) cin >> given[i];

    // ---------- 试探插入排序 ----------
    vector<int> t = orig;
    bool isInsert = false;
    for (int i = 1; i < n; ++i) {  // 依次插入第 i 个元素
        int x = t[i], j = i - 1;
        // 将 x 插入到已排序区间 [0, i-1] 的正确位置
        while (j >= 0 && t[j] > x) { t[j + 1] = t[j]; --j; }
        t[j + 1] = x;

        if (same(t, given)) {  // 与给定序列匹配
            isInsert = true;
            // 再做一步插入排序（插入下一个元素）
            if (i + 1 < n) {
                int x2 = t[i + 1], j2 = i;
                while (j2 >= 0 && t[j2] > x2) { t[j2 + 1] = t[j2]; --j2; }
                t[j2 + 1] = x2;
            }
            break;
        }
    }

    if (isInsert) {
        cout << "Insertion Sort" << endl;
        for (int i = 0; i < n; ++i) { if (i) cout << ' '; cout << t[i]; }
        cout << endl;
        return 0;
    }

    // ---------- 归并排序（自底向上） ----------
    t = orig;
    // step 为归并子段长度，从 2 开始，每次翻倍
    for (int step = 2; step / 2 <= n; step *= 2) {
        // 对每个长度为 step 的子段分别排序
        for (int i = 0; i < n; i += step) {
            int r = min(i + step, n);  // 子段右边界（开区间）
            sort(t.begin() + i, t.begin() + r);
        }
        if (same(t, given)) {  // 与给定序列匹配
            // 再做一趟归并
            step *= 2;
            for (int i = 0; i < n; i += step) {
                int r = min(i + step, n);
                sort(t.begin() + i, t.begin() + r);
            }
            break;
        }
    }

    cout << "Merge Sort" << endl;
    for (int i = 0; i < n; ++i) { if (i) cout << ' '; cout << t[i]; }
    cout << endl;
    return 0;
}