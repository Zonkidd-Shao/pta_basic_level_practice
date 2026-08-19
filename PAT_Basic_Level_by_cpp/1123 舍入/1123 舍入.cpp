// 1123 舍入
//
// 实现原理：
// 给定 N 个浮点数（总长度不超过 200 位）和要保留的小数位数 D，按指令符进行舍入：
//   1 表示"四舍五入"：考察第 D+1 位，不小于 5 则进位，否则舍去。
//   2 表示"截断"：不管后面是什么，直接舍去。
//   3 表示"四舍六入五成双"：第 D+1 位小于 5 舍去；大于 5 进位；等于 5 时，
//     若 5 后面还有非 0 尾数则进位，否则看第 D 位是单数进位、双数舍去。
// 由于数字可能很长，需用字符串处理。
//
// 关键步骤：
// 1. 分离整数部分和小数部分，将小数部分补齐到至少 D+1 位。
// 2. 根据指令符判断是否需要进位。
// 3. 若进位，对保留的 D 位加 1，可能进位到整数部分。
// 4. 输出整数部分 + "." + 保留的 D 位小数。
//
// 复杂度分析：
// 时间复杂度：O(N * L)，L 为单个数字长度。
// 空间复杂度：O(L)，存储数字字符串。
#include <iostream>
#include <string>

using namespace std;

// 整数部分字符串加 1（处理进位），返回新的整数部分
string addOne(string ip) {
    int i = (int)ip.size() - 1;
    while (i >= 0 && ip[i] == '9') { ip[i] = '0'; --i; }
    if (i < 0) ip = "1" + ip;
    else ip[i]++;
    return ip;
}

int main() {
    int n, d;
    if (!(cin >> n >> d)) return 0;

    while (n--) {
        int inst;
        string num;
        cin >> inst >> num;

        // 分离整数部分和小数部分
        string ip, fp;
        size_t dot = num.find('.');
        if (dot == string::npos) { ip = num; fp = ""; }
        else { ip = num.substr(0, dot); fp = num.substr(dot + 1); }

        // 补齐小数部分到至少 D+1 位
        while (fp.size() < (size_t)d + 1) fp += '0';
        string keep = fp.substr(0, d);   // 保留的 D 位
        char next = fp[d];               // 第 D+1 位
        bool restNonZero = false;
        for (size_t i = d + 1; i < fp.size(); ++i)
            if (fp[i] != '0') { restNonZero = true; break; }

        bool roundUp = false;
        if (inst == 1) {                 // 四舍五入
            if (next >= '5') roundUp = true;
        } else if (inst == 2) {          // 截断
            roundUp = false;
        } else {                         // 四舍六入五成双
            if (next > '5') roundUp = true;
            else if (next == '5') {
                if (restNonZero) roundUp = true;
                else if (keep.back() % 2 == 1) roundUp = true;  // 最后一位单数则进位
            }
        }

        if (roundUp) {
            int i = d - 1;
            while (i >= 0 && keep[i] == '9') { keep[i] = '0'; --i; }
            if (i < 0) ip = addOne(ip);   // 进位到整数部分
            else keep[i]++;
        }
        cout << ip << "." << keep << endl;
    }
    return 0;
}
