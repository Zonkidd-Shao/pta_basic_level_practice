// 1116 多二了一点
//
// 实现原理：
// 若一个正整数有 2n 个数位，后 n 个数位组成的数恰好比前 n 个数位组成的数多 2，
// 则称这个数字"多二了一点"。给定一个正整数 N（可达 10^1000），判断它是否多二了一点。
//
// 关键步骤：
// 1. 若 N 的位数是奇数，输出 "Error: X digit(s)"，X 为位数。
// 2. 否则将 N 从中间分成前一半 Y 和后一半 X。
// 3. 用大数减法计算 X - Y（题目保证多二了一点时 Y 的个位数不大于 7，无需借位）。
// 4. 若差为 2 输出 "Yes: X - Y = 2"，否则输出 "No: X - Y != 2"。
//
// 复杂度分析：
// 时间复杂度：O(L)，L 为 N 的位数。
// 空间复杂度：O(L)，存储字符串。
#include <iostream>
#include <string>

using namespace std;

int main() {
    string s;
    if (!(cin >> s)) return 0;

    int len = (int)s.size();
    if (len % 2 != 0) {                       // 奇数位
        cout << "Error: " << len << " digit(s)" << endl;
        return 0;
    }

    string Y = s.substr(0, len / 2);          // 前一半
    string X = s.substr(len / 2);             // 后一半

    // 只有 X >= Y 时才进行无符号大数减法；否则差值为负，不可能等于 2。
    bool xAtLeastY = (X >= Y); // 两个等长数字字符串可直接按字典序比较
    string diff;
    if (xAtLeastY) {
        int borrow = 0;
        for (int i = (int)X.size() - 1; i >= 0; --i) {
            int d = (X[i] - '0') - (Y[i] - '0') - borrow;
            if (d < 0) { d += 10; borrow = 1; } else borrow = 0;
            diff = char('0' + d) + diff;
        }
    }
    // 去掉前导零
    size_t pos = diff.find_first_not_of('0');
    string dstr = (pos == string::npos) ? "0" : diff.substr(pos);

    if (xAtLeastY && dstr == "2") cout << "Yes: " << X << " - " << Y << " = 2" << endl;
    else cout << "No: " << X << " - " << Y << " != 2" << endl;
    return 0;
}
