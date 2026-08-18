/*
 * 1043 输出PATest
 *
 * 【实现原理】
 * 给定一个由英文字母组成的字符串，按照 "PATest" 这六个字符的顺序循环输出，
 * 每次从字符串中各取出一个对应字符（若还有剩余），直到所有这六个字符都被取完。
 * 字符串中不属于这六个字符的字母忽略。
 *
 * 【算法思路】
 * 1. 统计字符串中 'P'、'A'、'T'、'e'、's'、't' 各字符的出现次数
 * 2. 循环遍历这六个字符的顺序，每次输出一个还有剩余的字符，并减一
 * 3. 直到所有字符的计数都为 0 时结束
 *
 * 【关键点】
 * - 使用 do-while 循环：每次完整遍历六个字符，只要有任意字符还有剩余就继续
 * - 字符顺序固定为 P A T e s t
 * - 不在这六个字符中的字符直接忽略
 *
 * 【复杂度分析】
 * - 时间复杂度：O(N + 6*K)，N 为字符串长度，K 为最大字符计数（最多输出 6*K 个字符）
 * - 空间复杂度：O(1)，固定 6 大小的数组
 */

#include <iostream>
#include <string>

using namespace std;

int main() {
    string s;
    if (!(cin >> s)) return 0;

    // 顺序：P(0) A(1) T(2) e(3) s(4) t(5)
    int cnt[6] = {0};
    for (char c : s) {
        switch (c) {
            case 'P': ++cnt[0]; break;
            case 'A': ++cnt[1]; break;
            case 'T': ++cnt[2]; break;
            case 'e': ++cnt[3]; break;
            case 's': ++cnt[4]; break;
            case 't': ++cnt[5]; break;
            // 其他字符忽略
        }
    }

    const char order[6] = {'P', 'A', 'T', 'e', 's', 't'};
    bool any;
    do {
        any = false;  // 标记本轮是否输出了至少一个字符
        // 按 P A T e s t 固定顺序循环输出
        for (int i = 0; i < 6; ++i) {
            if (cnt[i] > 0) {
                cout << order[i];
                --cnt[i];    // 消耗一个字符
                any = true;  // 还有字符未输出完
            }
        }
    } while (any);  // 只要还有字符剩余就继续循环

    cout << endl;
    return 0;
}