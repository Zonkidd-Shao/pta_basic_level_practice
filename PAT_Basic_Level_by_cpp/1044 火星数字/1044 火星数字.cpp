/*
 * 1044 火星数字
 *
 * 【实现原理】
 * 地球数字（0~168）与火星数字之间的互译。
 * 火星数字采用 13 进制计数法：
 * - 低位（个位，0~12）：tret, jan, feb, mar, apr, may, jun, jly, aug, sep, oct, nov, dec
 * - 高位（十位，代表13的倍数，13~156）：tam, hel, maa, hou, tou, kes, coa, pel, vil, wis, sly
 * - 当数值恰好是13的倍数时，只输出高位（不输出 tret）
 *
 * 【算法思路】
 * 1. 地球 -> 火星：将整数按 13 进制拆分，查表输出
 *    - 0 特殊处理输出 "tret"
 *    - num % 13 == 0 只输出高位
 *    - 否则输出 "高位 低位"
 * 2. 火星 -> 地球：用字符串流解析火星文
 *    - 一个词可能是低位或高位
 *    - 两个词则是 "高位 低位"
 *    - 分别查 low 和 high 表得到数值，组合为 val = h * 13 + l
 *
 * 【关键点】
 * - 火星数字到地球数字的转换需要处理三种情况：
 *   1. 单个词 -> 可能是低位（0~12）也可能是高位（13的倍数）
 *   2. 两个词 -> 高位 + 低位
 * - 使用 istringstream 解析一行中的多个单词
 *
 * 【复杂度分析】
 * - 时间复杂度：O(N)，每个查询需要常数级查表操作
 * - 空间复杂度：O(1)，固定大小的查找表
 */

#include <iostream>
#include <string>
#include <sstream>

using namespace std;

// 火星数字低位表（个位）：对应地球数字 0~12
string low[13]  = {"tret", "jan", "feb", "mar", "apr", "may", "jun",
                   "jly", "aug", "sep", "oct", "nov", "dec"};
// 火星数字高位表（十位）：对应 13 的倍数 13~156，高位无 0（即 0 用 tret 表示）
string high[13] = {"", "tam", "hel", "maa", "hou", "tou", "kes",
                   "coa", "pel", "vil", "wis", "sly"};

int main() {
    int n;
    if (!(cin >> n)) return 0;
    string dummy;
    getline(cin, dummy);  // 消耗掉输入 n 后的换行符

    for (int i = 0; i < n; ++i) {
        string line;
        getline(cin, line);

        if (line[0] >= '0' && line[0] <= '9') {
            // ---- 地球数字 -> 火星数字 ----
            int num = stoi(line);
            if (num == 0) {
                cout << "tret" << endl;  // 0 特殊处理
            } else if (num % 13 == 0) {
                // 13 的倍数只输出高位（火星中不输出 tret）
                cout << high[num / 13] << endl;
            } else {
                // 一般情况：输出 "高位 低位"
                cout << high[num / 13] << " " << low[num % 13] << endl;
            }
        } else {
            // ---- 火星数字 -> 地球数字 ----
            string w1, w2;
            istringstream iss(line);
            iss >> w1;
            bool has2 = (bool)(iss >> w2);  // 尝试读取第二个词

            int val = 0;
            if (!has2) {
                // 只有一个词：可能是低位或高位
                for (int k = 0; k < 13; ++k) if (low[k] == w1) { val = k; break; }
                for (int k = 1; k < 13; ++k) if (high[k] == w1) { val = k * 13; break; }
            } else {
                // 两个词：高位 + 低位
                int h = 0, l = 0;
                for (int k = 1; k < 13; ++k) if (high[k] == w1) { h = k; break; }
                for (int k = 0; k < 13; ++k) if (low[k] == w2) { l = k; break; }
                val = h * 13 + l;
            }
            cout << val << endl;
        }
    }
    return 0;
}