// 1064 朋友数
//
// 实现原理：
// 如果两个数的各位数字之和相等，则称它们为"朋友数"，这个和称为"朋友证号"。
// 给定 N 个正整数，统计其中不同的朋友证号，并升序输出。
//
// 关键步骤：
// 1. 定义 digitSum 函数计算一个整数的各位数字之和
// 2. 使用 set 容器自动去重并排序
// 3. 对每个输入数字，计算其各位数字之和并插入 set
// 4. 输出 set 的大小（不同朋友证号的个数）和内容
//
// 复杂度分析：
// 时间复杂度：O(N logN + N * log10(x))，N 为数字个数，x 为数字大小。
// 空间复杂度：O(N)，用于存储朋友证号集合。
#include <iostream>
#include <vector>
#include <set>

using namespace std;

// 计算整数的各位数字之和
int digitSum(int x) {
    int s = 0;
    while (x) { s += x % 10; x /= 10; }
    return s;
}

int main() {
    int n;
    if (!(cin >> n)) return 0;
    set<int> friends;  // set 自动升序排序且去重
    for (int i = 0; i < n; ++i) {
        int x;
        cin >> x;
        friends.insert(digitSum(x));  // 计算各位和并插入集合
    }
    cout << friends.size() << endl;  // 输出不同的朋友证号个数
    bool first = true;
    for (int v : friends) {
        if (!first) cout << ' ';
        cout << v;
        first = false;
    }
    cout << endl;
    return 0;
}