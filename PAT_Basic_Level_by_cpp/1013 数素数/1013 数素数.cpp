// 1013 数素数
// 输出第 M 个到第 N 个素数（M <= N <= 10^4），每 10 个一行，空格分隔，行末无多余空格。
//
// 【实现原理】
// 算法思路：
//   1. 从小到大遍历自然数，用试除法判断素数，将素数依次存入 vector。
//   2. 当素数个数达到 N 时停止。
//   3. 取第 M 到第 N 个素数（注意从 1 开始计数），按格式输出：
//      - 每输出 10 个数字换行，最后一行不足 10 个也换行。
// 关键点：
//   - 第 10^4 个素数约为 104729，试除法在此范围内足够快。
//   - 输出时用 cnt 计数器控制换行。
// 时间复杂度：O(K * sqrt(K))，其中 K 为第 N 个素数的值，N <= 10^4 时 K ≈ 1.05e5。
// 空间复杂度：O(N)，存储 N 个素数。
#include <iostream>
#include <vector>

using namespace std;

bool isPrime(int x) {
    if (x < 2) return false;
    for (int i = 2; i * i <= x; ++i) {
        if (x % i == 0) return false;
    }
    return true;
}

int main() {
    int m, n;
    if (!(cin >> m >> n)) return 0;

    vector<int> primes;
    for (int i = 2; (int)primes.size() < n; ++i) {
        if (isPrime(i)) primes.push_back(i);
    }

    int cnt = 0;
    for (int i = m - 1; i < n; ++i) {
        ++cnt;
        cout << primes[i];
        if (cnt % 10 == 0 || i == n - 1) cout << endl; // 满 10 个或到最后换行
        else cout << ' ';
    }
    return 0;
}