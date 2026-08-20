#include <iostream>
#include <vector>
using namespace std;
int main() {
    int n, m;
    if (!(cin >> n >> m)) return 0;
    vector<long long> cake(n + 1, 0);
    for (int i = 0; i < m; ++i) {
        for (int j = 1; j <= n; ++j) {
            long long x; cin >> x;
            cake[j] += x;
        }
    }
    long long mx = 0;
    for (int i = 1; i <= n; ++i) mx = max(mx, cake[i]);
    cout << mx << endl;
    bool first = true;
    for (int i = 1; i <= n; ++i) if (cake[i]==mx) {
        if (!first) cout << ' ';
        cout << i;
        first=false;
    }
    cout << endl;
    return 0;
}
