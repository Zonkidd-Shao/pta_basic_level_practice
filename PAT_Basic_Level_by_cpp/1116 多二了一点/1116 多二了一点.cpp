/*
 * 1116 多二了一点
 *
 * 【实现原理】
 * 题目给定 N 个整数，计算它们的平均值，然后统计序列中有多少个元素严格大于这个平均值，
 * 输出统计结果。
 *
 * 【算法思路】
 * 1. 读入 N 个整数，同时累加所有数值的和。
 * 2. 计算平均值 avg = sum / N（使用浮点数）。
 * 3. 遍历数组，统计大于 avg 的元素个数。
 * 4. 输出计数结果。
 *
 * 【复杂度分析】
 * - 时间复杂度：O(N)，一次遍历求和，一次遍历统计。
 * - 空间复杂度：O(N)，存储整数数组。
 */
#include <iostream>
#include <vector>

using namespace std;

int main() {
    int n;
    if (!(cin >> n)) return 0;
    vector<int> a(n);
    long long sum = 0;
    for (int i = 0; i < n; ++i) { cin >> a[i]; sum += a[i]; } // 读入并累加
    double avg = (double)sum / n;                // 计算平均值
    int cnt = 0;
    for (int v : a) if (v > avg) ++cnt;          // 统计大于平均值的元素个数
    cout << cnt << endl;
    return 0;
}