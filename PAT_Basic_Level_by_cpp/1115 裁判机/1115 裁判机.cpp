/*
 * 1115 裁判机
 *
 * 【实现原理】
 * 题目给定 N 个裁判给出的成绩。去掉一个最高分和一个最低分后，计算剩余成绩的平均值，
 * 并进行四舍五入取整，得到"裁判成绩"。然后找出与裁判成绩偏差（绝对值）最大的原始成绩，
 * 若存在多个偏差相同的，取最先出现的那个。
 *
 * 【算法思路】
 * 1. 读入 N 个成绩存储到数组 a 中。
 * 2. 复制一份 b 到数组并排序，去掉第一个（最低分）和最后一个（最高分）。
 * 3. 计算剩余成绩的平均值 avg，用 round() 四舍五入得到裁判成绩 referee。
 * 4. 遍历原始成绩数组 a，计算每个成绩与 referee 的绝对偏差，记录最大偏差及其对应的原始成绩（最先出现）。
 * 5. 输出 referee 和偏差最大的原始成绩。
 *
 * 【复杂度分析】
 * - 时间复杂度：O(N log N)，排序占主导。
 * - 空间复杂度：O(N)，存储成绩数组。
 */
#include <iostream>
#include <vector>
#include <algorithm>
#include <cmath>

using namespace std;

int main() {
    int n;
    if (!(cin >> n)) return 0;
    vector<int> a(n);
    for (int i = 0; i < n; ++i) cin >> a[i];

    vector<int> b = a;
    if (!b.empty()) {
        sort(b.begin(), b.end());                // 排序
        if (!b.empty()) b.erase(b.begin());      // 去掉最低分
        if (!b.empty()) b.pop_back();             // 去掉最高分
    }
    double avg = 0;
    for (int v : b) avg += v;
    if (!b.empty()) avg /= b.size();
    int referee = (int)round(avg);               // 四舍五入得到裁判成绩
    cout << referee << endl;

    int maxDev = -1, idx = 0;
    for (int i = 0; i < n; ++i) {
        int dev = abs(a[i] - referee);           // 计算绝对偏差
        if (dev > maxDev) { maxDev = dev; idx = i; } // 记录最大偏差（最先出现）
    }
    cout << a[idx] << endl;                      // 输出偏差最大的原始成绩
    return 0;
}