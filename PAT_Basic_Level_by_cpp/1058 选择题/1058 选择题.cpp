// 1058 选择题
// 只有全对才得分，无半分。按 C 正确实现：位掩码全对才得分。
#include <iostream>
#include <vector>
#include <algorithm>
using namespace std;
int main() {
    int n, m;
    if (!(cin >> n >> m)) return 0;
    vector<int> full(m), correct(m, 0), wrong(m, 0);
    for (int i = 0; i < m; ++i) {
        int k, x;
        cin >> full[i] >> k >> x;
        for (int j = 0; j < x; ++j) {
            char c; cin >> c;
            correct[i] |= (1 << (c - 'a'));
        }
    }
    for (int stu = 0; stu < n; ++stu) {
        int total = 0;
        for (int q = 0; q < m; ++q) {
            char ch;
            cin >> ch; // '('
            int cnt;
            cin >> cnt;
            int mask = 0;
            for (int k = 0; k < cnt; ++k) {
                char c; cin >> c;
                mask |= (1 << (c - 'a'));
            }
            cin >> ch; // ')'
            if (mask == correct[q]) {
                total += full[q];
            } else {
                wrong[q]++;
            }
        }
        cout << total << endl;
    }
    int maxWrong = 0;
    for (int i = 0; i < m; ++i) maxWrong = max(maxWrong, wrong[i]);
    if (maxWrong == 0) {
        cout << "Too simple" << endl;
    } else {
        cout << maxWrong;
        for (int i = 0; i < m; ++i) if (wrong[i] == maxWrong) cout << ' ' << i + 1;
        cout << endl;
    }
    return 0;
}
