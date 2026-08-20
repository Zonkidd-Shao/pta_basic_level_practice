#include <iostream>
#include <string>
#include <cctype>

using namespace std;

int main() {
    int n;
    if (!(cin >> n)) return 0;
    string dummy;
    getline(cin, dummy); // 消耗换行
    for (int i = 0; i < n; ++i) {
        string pwd;
        getline(cin, pwd);
        bool illegal = false, hasDigit = false, hasAlpha = false;
        for (char c : pwd) {
            if (isalnum((unsigned char)c)) {
                if (isdigit((unsigned char)c)) hasDigit = true;
                else hasAlpha = true;
            } else if (c == '.') {
                // 合法字符 小数点，不计入字母数字
            } else {
                illegal = true;
            }
        }
        if ((int)pwd.size() < 6) cout << "Your password is tai duan le." << endl;
        else if (illegal) cout << "Your password is tai luan le." << endl;
        else if (!hasDigit) cout << "Your password needs shu zi." << endl;
        else if (!hasAlpha) cout << "Your password needs zi mu." << endl;
        else cout << "Your password is wan mei." << endl;
    }
    return 0;
}
