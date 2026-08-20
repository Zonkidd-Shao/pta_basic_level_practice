/*
 * 1103 缘分数
 * num = a^3-(a-1)^3 判完全平方且 b^2+(b-1)^2 == c
 */
#include <bits/stdc++.h>
using namespace std;
int main() {
    ios::sync_with_stdio(false);
    cin.tie(nullptr);
    int m, n;
    if (!(cin >> m >> n)) return 0;
    bool found = false;
    for (int a = m; a <= n; ++a) {
        long long num = 1LL * a * a * a - 1LL * (a - 1) * (a - 1) * (a - 1);
        long long c = (long long) sqrt((double) num);
        while ((c + 1) * (c + 1) <= num) ++c;
        while (c * c > num) --c;
        if (c * c == num && a != c) {
            for (int b = 2; b <= c; ++b) {
                if (1LL * b * b + 1LL * (b - 1) * (b - 1) == c) {
                    cout << a << " " << b << "\n";
                    found = true;
                    break;
                }
            }
        }
    }
    if (!found) cout << "No Solution\n";
    return 0;
}
