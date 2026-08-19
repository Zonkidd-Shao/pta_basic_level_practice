/*
 * 1078 字符串压缩与解压
 *
 * 【实现原理】
 * 本题要求实现字符串的压缩与解压功能。
 * 压缩模式（C）：将连续出现的相同字符替换为"个数+字符"，若个数为 1 则省略数字。
 * 解压模式（D）：将压缩后的格式还原为原始字符串。
 *
 * 【算法思路】
 * 压缩（C）：
 * 1. 遍历字符串，用双指针 i 和 j 定位连续相同字符的区间 [i, j)。
 * 2. 若区间长度 > 1，则将长度转为字符串追加到结果中。
 * 3. 追加该字符本身，移动 i 到 j 继续处理。
 *
 * 解压（D）：
 * 1. 遍历字符串，若遇到数字字符，则连续读取完整数字（可能有多位）。
 * 2. 将该数字解析为重复次数 cnt，其后的一个字符为待重复的字符。
 * 3. 将该字符重复 cnt 次追加到结果中。
 * 4. 若当前字符不是数字，则直接追加到结果中（表示原串中单个字符）。
 *
 * 【复杂度分析】
 * - 时间复杂度：O(n)，每个字符仅被处理一次。
 * - 空间复杂度：O(n)，用于存储结果字符串。
 */
#include <iostream>
#include <string>
#include <cctype>

using namespace std;

int main() {
    char mode;
    if (!(cin >> mode)) return 0;          // 读取模式：C 压缩 / D 解压

    string dummy;
    getline(cin, dummy);                   // 消耗模式字符后的换行符
    string s;
    getline(cin, s);                       // 读取待处理字符串（可能含空格）

    if (mode == 'C') {                     // 压缩模式
        string res;
        for (size_t i = 0; i < s.size(); ) {
            char c = s[i];
            size_t j = i;
            while (j < s.size() && s[j] == c) ++j;  // 统计连续相同字符的个数
            int cnt = (int)(j - i);
            if (cnt > 1) res += to_string(cnt);     // 个数大于 1 时添加数字前缀
            res += c;                                // 添加字符本身
            i = j;
        }
        cout << res << endl;
    } else {                               // 解压模式（D）
        string res;
        for (size_t i = 0; i < s.size(); ) {
            if (isdigit((unsigned char)s[i])) {     // 遇到数字，表示重复次数
                size_t j = i;
                while (j < s.size() && isdigit((unsigned char)s[j])) ++j; // 完整读取数字
                int cnt = stoi(s.substr(i, j - i)); // 解析数字为重复次数
                char c = s[j];                       // 数字后面的字符
                res += string(cnt, c);               // 将字符重复 cnt 次
                i = j + 1;
            } else {
                res += s[i];                         // 单个字符直接追加
                ++i;
            }
        }
        cout << res << endl;
    }
    return 0;
}
