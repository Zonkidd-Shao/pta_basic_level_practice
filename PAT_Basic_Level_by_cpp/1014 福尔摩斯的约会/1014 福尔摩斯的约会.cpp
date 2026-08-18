// 1014 福尔摩斯的约会
// 根据两对字符串解码约会时间：
//   第 1 对相同的大写字母(A~G) -> 星期；
//   第 2 对相同的字符(0~9 或 A~N) -> 小时(0~23)；
//   第 3、4 字符串第 1 对相同的英文字母的位置(0 起) -> 分钟。
//
// 【实现原理】
// 算法思路：
//   本题要求从 4 个字符串中按规则提取约会时间信息。
//   - 星期：在 s1 和 s2 中找到第一个相同位置且字符为 A~G 的大写字母。
//     A 对应星期一（MON），B 对应星期二（TUE），...，G 对应星期日（SUN）。
//   - 小时：在星期位置之后，继续在 s1 和 s2 中找第一个相同位置的字符，
//     该字符需为 '0'~'9'（对应 0~9 点）或 'A'~'N'（对应 10~23 点）。
//   - 分钟：在 s3 和 s4 中找到第一个相同位置且均为英文字母的字符，
//     该位置（从 0 开始计数）即为分钟。
// 关键点：
//   - 星期和小时的查找是连续的：找到星期后从下一个位置开始找小时。
//   - 输出格式：星期为大写字母缩写，小时和分钟均为两位数字（不足补前导 0）。
// 时间复杂度：O(L1 + L2)，其中 L1、L2 分别为两对字符串的长度。
// 空间复杂度：O(1)。
#include <iostream>
#include <string>
#include <cctype>
#include <cstdio>

using namespace std;

int main() {
    string s1, s2, s3, s4;
    cin >> s1 >> s2 >> s3 >> s4;

    const string days[7] = {"MON", "TUE", "WED", "THU", "FRI", "SAT", "SUN"};

    // 1) 星期：第一个相同的大写字母 A~G
    int i = 0;
    for (; i < (int)s1.size() && i < (int)s2.size(); ++i) {
        if (s1[i] == s2[i] && s1[i] >= 'A' && s1[i] <= 'G') {
            cout << days[s1[i] - 'A'] << ' ';
            break;
        }
    }

    // 2) 小时：接着找第一个相同的 '0'~'9' 或 'A'~'N'
    for (++i; i < (int)s1.size() && i < (int)s2.size(); ++i) {
        if (s1[i] == s2[i]) {
            char c = s1[i];
            if (c >= '0' && c <= '9') { printf("%02d:", c - '0'); break; }
            if (c >= 'A' && c <= 'N') { printf("%02d:", 10 + (c - 'A')); break; }
        }
    }

    // 3) 分钟：第 3、4 串第一个相同的英文字母的位置（0 起）
    for (int k = 0; k < (int)s3.size() && k < (int)s4.size(); ++k) {
        if (s3[k] == s4[k] && isalpha((unsigned char)s3[k])) {
            printf("%02d\n", k);
            break;
        }
    }

    return 0;
}