// 1067 试密码 - 达到 N 次错误输出 Account locked 并结束，处理 # 结束符
#include <iostream>
#include <string>
using namespace std;
int main() {
    string pwd;
    int n;
    if (!(cin >> pwd >> n)) return 0;
    string dummy;
    getline(cin, dummy); // 消耗行尾换行
    int cnt = 0;
    string line;
    while (getline(cin, line)) {
        if (line == "#") break;
        cnt++;
        if (line == pwd) {
            cout << "Welcome in" << endl;
            break;
        } else {
            cout << "Wrong password: " << line << endl;
            if (cnt >= n) {
                cout << "Account locked" << endl;
                break;
            }
        }
    }
    return 0;
}
