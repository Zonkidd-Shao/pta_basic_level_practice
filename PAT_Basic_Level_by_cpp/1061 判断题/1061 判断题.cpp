// 1061 判断题 - 先读分值再读答案
#include <iostream>
#include <vector>
using namespace std;
int main() {
    int n, m;
    if (!(cin >> n >> m)) return 0;
    vector<int> score(m), ans(m);
    for (int i = 0; i < m; ++i) cin >> score[i];
    for (int i = 0; i < m; ++i) cin >> ans[i];
    for (int i = 0; i < n; ++i) {
        int total = 0;
        for (int j = 0; j < m; ++j) {
            int x; cin >> x;
            if (x == ans[j]) total += score[j];
        }
        cout << total << endl;
    }
    return 0;
}
