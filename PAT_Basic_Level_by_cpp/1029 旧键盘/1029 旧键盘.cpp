#include <iostream>
#include <string>
#include <cctype>
using namespace std;
int main() {
    string expected, typed;
    if (!(cin >> expected)) return 0;
    if (!(cin >> typed)) typed = "";
    bool inTyped[256] = {false};
    for (char c : typed) {
        inTyped[(unsigned char)toupper((unsigned char)c)] = true;
        inTyped[(unsigned char)c] = true;
        // 同时标记大小写，以便大小写不敏感判断
        // 为简化：同时标记大写和小写
        inTyped[(unsigned char)tolower((unsigned char)c)] = true;
        inTyped[(unsigned char)toupper((unsigned char)c)] = true;
    }
    // 更精确：用大写统一判断
    bool inTypedUpper[256] = {false};
    for (char c : typed) inTypedUpper[(unsigned char)toupper((unsigned char)c)] = true;

    bool printed[256] = {false};
    for (char c : expected) {
        char up = toupper((unsigned char)c);
        if (!inTypedUpper[(unsigned char)up]) {
            if (!printed[(unsigned char)up]) {
                cout << up;
                printed[(unsigned char)up] = true;
            }
        }
    }
    cout << endl;
    return 0;
}
