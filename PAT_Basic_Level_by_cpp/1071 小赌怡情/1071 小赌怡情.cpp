// 1071 小赌怡情 - 修正为双空格
#include <iostream>
using namespace std;
int main() {
    int T, K;
    if (!(cin >> T >> K)) return 0;
    for (int i = 0; i < K; ++i) {
        int n1, b, t, n2;
        cin >> n1 >> b >> t >> n2;
        if (T == 0) {
            cout << "Game Over." << endl;
            break;
        }
        if (t > T) {
            cout << "Not enough tokens.  Total = " << T << "." << endl;
            continue;
        }
        if ((n1 > n2 && b == 0) || (n1 < n2 && b == 1)) {
            T += t;
            cout << "Win " << t << "!  Total = " << T << "." << endl;
        } else {
            T -= t;
            cout << "Lose " << t << ".  Total = " << T << "." << endl;
            if (T == 0) {
                cout << "Game Over." << endl;
                break;
            }
        }
    }
    return 0;
}
