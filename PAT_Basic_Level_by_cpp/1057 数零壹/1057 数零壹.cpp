// 1057 数零壹
//
// 实现原理：
// 给定一个字符串，求其中所有英文字母（不区分大小写）的序号之和（a=1, b=2, ..., z=26），
// 然后将该和转换为二进制表示，统计其中 0 和 1 的个数。
//
// 关键步骤：
// 1. 使用 getline 读取整行字符串（可能包含空格）
// 2. 遍历字符串，对每个英文字母，转换为小写后计算序号：tolower(c) - 'a' + 1
// 3. 累加所有字母序号得到 sum
// 4. 将 sum 不断除以 2，统计余数为 0（零）和余数为 1（壹）的次数
//
// 复杂度分析：
// 时间复杂度：O(L + logS)，L 为字符串长度，S 为字母序号之和。
// 空间复杂度：O(1)，只使用常数额外空间。
#include <iostream>
#include <string>
#include <cctype>

using namespace std;

int main() {
    string s;
    if (!getline(cin, s)) return 0;

    int sum = 0;
    for (char c : s) {
        // 只处理英文字母，不区分大小写
        if (isalpha((unsigned char)c))
            sum += tolower((unsigned char)c) - 'a' + 1;  // a~z 映射为 1~26
    }

    // 统计二进制中 0 和 1 的个数
    int zeros = 0, ones = 0;
    while (sum > 0) {
        if (sum % 2 == 0) ++zeros;
        else ++ones;
        sum /= 2;  // 右移一位
    }
    cout << zeros << ' ' << ones << endl;
    return 0;
}