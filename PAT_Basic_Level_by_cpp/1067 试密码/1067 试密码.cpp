// 1067 试密码
//
// 实现原理：
// 给定正确密码和最大尝试次数 N，系统依次接受 N 行尝试输入。
// 若尝试与正确密码相同，则输出"Welcome in"并立即结束；
// 若错误，则输出"Wrong password: 尝试内容"；
// 若 N 次全部错误，则输出"Account locked!"。
//
// 关键步骤：
// 1. 使用 getline 读取正确密码（可能包含空格，不能用 cin>>）
// 2. 读取最大尝试次数 N
// 3. 使用 getline 消耗 N 后的换行符
// 4. 逐行读取尝试密码（最多 N 次），与正确密码比较
// 5. 匹配则输出 Welcome in 并结束程序
// 6. 否则输出错误信息，若已达到 N 次则锁定账户
//
// 复杂度分析：
// 时间复杂度：O(N*L)，N 为尝试次数，L 为密码平均长度。
// 空间复杂度：O(L)，用于存储密码字符串。
#include <iostream>
#include <string>

using namespace std;

int main() {
    string pwd;
    if (!getline(cin, pwd)) return 0; // 正确密码（可能含空格）

    int n;
    cin >> n;
    string dummy;
    getline(cin, dummy); // 消耗 n 后的换行符

    int tries = 0;
    for (int i = 0; i < n; ++i) {
        string attempt;
        getline(cin, attempt);  // 读取一行尝试密码（可能含空格）
        if (attempt == pwd) {
            cout << "Welcome in" << endl;
            return 0;  // 密码正确，结束程序
        }
        cout << "Wrong password: " << attempt << endl;
        if (++tries >= n) {
            cout << "Account locked!" << endl;  // 达到最大次数，锁定
            return 0;
        }
    }
    return 0;
}