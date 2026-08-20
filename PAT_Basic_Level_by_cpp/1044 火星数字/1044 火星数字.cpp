#include <iostream>
#include <string>
#include <sstream>
using namespace std;
string low[13]  = {"tret", "jan", "feb", "mar", "apr", "may", "jun",
                   "jly", "aug", "sep", "oct", "nov", "dec"};
string high[13] = {"", "tam", "hel", "maa", "huh", "tou", "kes",
                   "hei", "elo", "syy", "lok", "mer", "jou"};

int main() {
    int n;
    if (!(cin >> n)) return 0;
    string dummy;
    getline(cin, dummy);
    for (int i = 0; i < n; ++i) {
        string line;
        getline(cin, line);
        if (line[0] >= '0' && line[0] <= '9') {
            int num = stoi(line);
            if (num < 13) {
                cout << low[num] << endl;
            } else {
                if (num % 13 == 0) cout << high[num / 13] << endl;
                else cout << high[num / 13] << " " << low[num % 13] << endl;
            }
        } else {
            string w1, w2;
            istringstream iss(line);
            iss >> w1;
            bool has2 = (bool)(iss >> w2);
            int val = 0;
            if (!has2) {
                for (int k = 0; k < 13; ++k) if (low[k] == w1) { val = k; break; }
                for (int k = 1; k < 13; ++k) if (high[k] == w1) { val = k * 13; break; }
            } else {
                int h = 0, l = 0;
                for (int k = 1; k < 13; ++k) if (high[k] == w1) { h = k; break; }
                for (int k = 0; k < 13; ++k) if (low[k] == w2) { l = k; break; }
                val = h * 13 + l;
            }
            cout << val << endl;
        }
    }
    return 0;
}
