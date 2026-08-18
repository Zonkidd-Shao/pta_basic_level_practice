// 1008 数组元素循环右移问题
// 将长度为 N 的数组循环右移 M 位，要求不使用额外数组（原地），且移动次数尽量少。
// 利用三次反转实现原地右移：O(N) 时间，O(1) 额外空间。
//
// 【实现原理】
// 算法思路：
//   采用经典的三次反转（Three-Reversal）算法实现数组循环右移：
//   原始数组：[a0, a1, ..., a_{n-m-1}, a_{n-m}, ..., a_{n-1}]
//   步骤 1：反转前 n-m 个元素 → [a_{n-m-1}, ..., a0, a_{n-m}, ..., a_{n-1}]
//   步骤 2：反转后 m 个元素 → [a_{n-m-1}, ..., a0, a_{n-1}, ..., a_{n-m}]
//   步骤 3：反转整个数组 → [a_{n-m}, ..., a_{n-1}, a0, ..., a_{n-m-1}]
//   结果即为循环右移 m 位。
// 关键点：
//   - 先取模 M %= N，处理 M >= N 的情况，避免多余操作。
//   - 当 N = 0 或 M = 0 时跳过反转。
// 时间复杂度：O(N)，每个元素恰好被反转两次。
// 空间复杂度：O(1)，原地操作，无需额外数组。
#include <iostream>
#include <vector>
#include <algorithm>

using namespace std;

int main() {
    int n, m;
    if (!(cin >> n >> m)) return 0;

    vector<int> a(n);
    for (int i = 0; i < n; ++i) cin >> a[i];

    if (n > 0) {
        m %= n; // 处理 M >= N 的情况
        if (m != 0) {
            int split = n - m; // 后 m 个元素移到前面
            reverse(a.begin(), a.begin() + split);
            reverse(a.begin() + split, a.end());
            reverse(a.begin(), a.end());
        }
    }

    for (int i = 0; i < n; ++i) {
        if (i) cout << ' ';
        cout << a[i];
    }
    cout << endl;
    return 0;
}