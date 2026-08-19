// 1119 胖达与盆盆奶
//
// 实现原理：
// 一排胖达按体重排队，每只胖达每次最少吃 200 毫升奶；当另一份奶多出至少 100 毫升时，
// 胖达才能感觉到"更多"。公平分配要求：更胖的胖达吃到更多的奶，等胖的胖达吃到一样多的奶。
// 求在保持队形的前提下，至少需要准备多少毫升奶。
//
// 关键步骤：
// 1. 每只胖达的基础奶量为 200 毫升。
// 2. 从左到右扫描：若当前胖达比左边胖，则其奶量至少比左边多 100。
// 3. 从右到左扫描：若当前胖达比右边胖，则其奶量至少比右边多 100。
// 4. 每只胖达取两次扫描结果的最大值，累加即为最少总奶量。
//
// 复杂度分析：
// 时间复杂度：O(N)，两次线性扫描。
// 空间复杂度：O(N)，存储左右扫描结果。
#include <iostream>
#include <vector>
#include <algorithm>

using namespace std;

int main() {
    int n;
    if (!(cin >> n)) return 0;
    vector<int> w(n);
    for (int i = 0; i < n; ++i) cin >> w[i];

    vector<int> left(n, 200), right(n, 200);  // 左右扫描的奶量
    for (int i = 1; i < n; ++i)               // 从左到右
        if (w[i] > w[i - 1]) left[i] = left[i - 1] + 100;
    for (int i = n - 2; i >= 0; --i)          // 从右到左
        if (w[i] > w[i + 1]) right[i] = right[i + 1] + 100;

    long long total = 0;
    for (int i = 0; i < n; ++i) total += max(left[i], right[i]);  // 取较大值并累加
    cout << total << endl;
    return 0;
}
