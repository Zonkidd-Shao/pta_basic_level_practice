/*
 * 1084 外观数列
 *
 * 【实现原理】
 * 外观数列（Look-and-say sequence）的定义：
 * 第 1 项为单个数字 D。
 * 第 n 项是对第 n-1 项的描述：将连续相同数字按"个数+数字"的格式拼接。
 * 例如 D=1 时：1, 11, 21, 1211, 111221, ...
 *
 * 【算法思路】
 * 1. 读取起始数字 D 和项数 N。
 * 2. 初始化字符串 s 为 D 本身（第 1 项）。
 * 3. 循环 N-1 次，每次调用 nextSeq 生成下一项：
 *    a. 遍历字符串，用双指针 i 和 j 定位连续相同数字的区间 [i, j)。
 *    b. 将区间长度 (j-i) 转为字符追加到结果。
 *    c. 追加该数字字符本身。
 *    d. 移动 i 到 j 继续处理。
 * 4. 输出第 N 项。
 *
 * 【复杂度分析】
 * - 时间复杂度：O(L) 每轮，其中 L 为当前项长度。由于外观数列长度指数增长，
 *   总体复杂度为 O(2^N) 级别（N 一般较小）。
 * - 空间复杂度：O(L)，用于存储当前项字符串。
 */
#include <iostream>
#include <string>

using namespace std;

/*
 * 生成外观数列的下一项
 * 遍历当前字符串，将连续相同字符按"个数+字符"格式拼接
 */
string nextSeq(const string& s) {
    string res;
    for (size_t i = 0; i < s.size(); ) {
        char c = s[i];
        size_t j = i;
        while (j < s.size() && s[j] == c) ++j;   // 统计连续相同字符的数量
        res += (char)('0' + (j - i));             // 添加个数（注意：个数 ≤ 9 时有效）
        res += c;                                  // 添加该数字字符本身
        i = j;
    }
    return res;
}

int main() {
    char d;   // 起始数字
    int n;    // 项数
    if (!(cin >> d >> n)) return 0;
    string s(1, d);               // 第 1 项
    for (int i = 1; i < n; ++i) s = nextSeq(s);  // 依次生成第 2 项到第 N 项
    cout << s << endl;
    return 0;
}
