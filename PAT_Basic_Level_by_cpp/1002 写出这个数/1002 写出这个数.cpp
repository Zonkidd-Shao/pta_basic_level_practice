// 1002 写出这个数
// 读入一个自然数 n（n < 10^100），计算其各位数字之和，并用汉语拼音逐位输出该和。
//
// 【实现原理】
// 算法思路：
//   1. 由于 n 最大可达 10^100，远超内置整数类型的范围，因此以字符串形式读入。
//   2. 遍历字符串，将每个字符转换为数字并累加，得到各位数字之和。
//   3. 将和转换为字符串，逐位映射到汉语拼音数组，按格式输出。
// 关键点：
//   - 数字最大长度为 100，每位最大为 9，因此和最大为 900，用 int 足够。
//   - 输出时每位之间用空格分隔，末尾无多余空格。
// 时间复杂度：O(len(n))，即 O(L)，其中 L 为数字的位数。
// 空间复杂度：O(1)，仅使用固定大小的拼音数组和几个变量。
#include <iostream>
#include <string>

using namespace std;

int main() {
    string s;
    if (!(cin >> s)) return 0;

    // 逐位累加（数字可能极大，必须以字符串读入）
    int sum = 0;
    for (char c : s) {
        sum += c - '0';
    }

    // 0~9 的汉语拼音
    const char* pinyin[10] = {
        "ling", "yi", "er", "san", "si",
        "wu", "liu", "qi", "ba", "jiu"
    };

    // 将和转为字符串以便逐位输出
    string sumStr = to_string(sum);
    for (size_t i = 0; i < sumStr.size(); ++i) {
        if (i > 0) cout << ' ';
        cout << pinyin[sumStr[i] - '0'];
    }
    cout << endl;

    return 0;
}