/*
 * 1104 天长地久
 * 枚举个位为9的K位数判 digit_sum==m && gcd(m,n) prime>2
 */
#include <bits/stdc++.h>
using namespace std;
int digit_sum(long long x) {
    int s = 0;
    while (x) { s += x % 10; x /= 10; }
    return s;
}
int gcd_int(int a, int b) {
    while (b) { int t = a % b; a = b; b = t; }
    return a;
}
bool is_prime(int x) {
    if (x <= 2) return false;
    for (int i = 2; 1LL * i * i <= x; ++i) if (x % i == 0) return false;
    return true;
}
struct Result { int n; long long A; };
int main() {
    ios::sync_with_stdio(false);
    cin.tie(nullptr);
    int N;
    if (!(cin >> N)) return 0;
    for (int case_num = 1; case_num <= N; ++case_num) {
        int K, m;
        cin >> K >> m;
        cout << "Case " << case_num << "\n";
        vector<Result> res;
        long long start = 1;
        for (int i = 0; i < K - 1; ++i) start *= 10;
        long long end = start * 10;
        for (long long i = start + 9; i < end; i += 10) {
            if (digit_sum(i) != m) continue;
            int n = digit_sum(i + 1);
            int g = gcd_int(m, n);
            if (g > 2 && is_prime(g)) res.push_back({n, i});
        }
        if (res.empty()) {
            cout << "No Solution\n";
        } else {
            sort(res.begin(), res.end(), [](const Result& a, const Result& b){
                if (a.n != b.n) return a.n < b.n;
                return a.A < b.A;
            });
            for (auto &r : res) cout << r.n << " " << r.A << "\n";
        }
    }
    return 0;
}
