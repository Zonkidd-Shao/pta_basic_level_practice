// 1005 继续(3n+1)猜想
// 给定 K 个待验证的正整数（1 < n <= 100），找出其中不能被其他数字"覆盖"的关键数，
// 并按从大到小输出。覆盖：在卡拉兹递推过程中出现的每一个数。
//
// 【实现原理】
// 算法思路：
//   1. 对每个输入数字执行卡拉兹递推，记录递推过程中出现的所有数字（仅关心 <= 100 的数）。
//   2. 使用布尔数组 covered[] 标记被覆盖的数字。
//   3. 遍历输入数组，若某个数字未被标记为"被覆盖"，则它是关键数。
//   4. 将关键数按从大到小排序后输出。
// 关键点：
//   - 递推过程中数字可能超过 100，但题目只关心输入范围内的覆盖关系，因此只标记 <= 100 的数。
//   - 注意：输入数字本身也可能被其他数字的递推过程覆盖。
// 时间复杂度：O(K * H)，其中 H 为递推步数（常数级别），排序 O(K log K)。
// 空间复杂度：O(101) ≈ O(1)，布尔数组大小固定。
#include <iostream>
#include <vector>
#include <algorithm>

using namespace std;

int main() {
    int k;
    if (!(cin >> k)) return 0;

    vector<int> a(k);
    for (int i = 0; i < k; ++i) cin >> a[i];

    // covered[x] 表示数字 x 是否被某数的递推过程覆盖（x <= 100）
    vector<bool> covered(101, false);

    for (int x : a) {
        int n = x;
        while (n != 1) {
            if (n % 2 == 0) n /= 2;
            else n = (3 * n + 1) / 2;
            if (n <= 100) covered[n] = true; // 仅标记落在输入范围内的数
        }
    }

    vector<int> res;
    for (int x : a) {
        if (!covered[x]) res.push_back(x); // 未被任何其他数覆盖 -> 关键数
    }

    sort(res.rbegin(), res.rend()); // 从大到小

    for (size_t i = 0; i < res.size(); ++i) {
        if (i) cout << ' ';
        cout << res[i];
    }
    cout << endl;
    return 0;
}