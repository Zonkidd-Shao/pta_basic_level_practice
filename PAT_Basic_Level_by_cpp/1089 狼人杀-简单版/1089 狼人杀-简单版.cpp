#include <iostream>
#include <vector>
#include <cstdlib>

using namespace std;

int main() {
    int n;
    if (!(cin >> n)) return 0;
    vector<int> words(n + 1);
    for (int i = 1; i <= n; ++i) cin >> words[i];
    for (int i = 1; i <= n; ++i) {
        for (int j = i + 1; j <= n; ++j) {
            vector<int> a(n + 1, 1);
            a[i] = a[j] = -1;
            vector<int> lie;
            for (int k = 1; k <= n; ++k) {
                if (words[k] * a[abs(words[k])] < 0) lie.push_back(k);
            }
            if (lie.size() == 2 && a[lie[0]] + a[lie[1]] == 0) {
                cout << i << " " << j << endl;
                return 0;
            }
        }
    }
    cout << "No Solution" << endl;
    return 0;
}
