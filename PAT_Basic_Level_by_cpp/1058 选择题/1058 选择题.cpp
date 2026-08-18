// 1058 选择题
//
// 实现原理：
// 多选题批改系统。每道题有满分值、选项个数和正确选项。学生作答以带括号的字符串形式给出
// （如 "(2ac)" 表示选了 2 个选项 a 和 c）。
// 评分规则：
//   - 全对 → 得满分
//   - 选对部分且无错选 → 得一半分（向下取整）
//   - 有错选或空选 → 得 0 分
// 此外还需统计每道题被答错的人数，输出错误次数最多的题号。
//
// 技术细节：
// 使用位掩码（bitmask）表示选项选择情况，每个选项对应一个二进制位（a→bit0, b→bit1, ...）。
// 这样可以通过位运算快速比较：
//   - mask == correct[q] → 全对
//   - mask != 0 && (mask & correct[q]) == mask → 部分正确（所选选项都是正确的子集）
//
// 复杂度分析：
// 时间复杂度：O(N*M)，N 为学生数，M 为题目数。
// 空间复杂度：O(M)，用于存储每道题的信息和错误计数。
#include <iostream>
#include <vector>
#include <string>
#include <algorithm>

using namespace std;

int main() {
    int n, m; // n 学生，m 题目
    if (!(cin >> n >> m)) return 0;

    // full[i]：第 i 题满分；correct[i]：第 i 题正确选项的位掩码
    vector<int> full(m), correct(m, 0), wrong(m, 0);
    for (int i = 0; i < m; ++i) {
        int k, x;
        cin >> full[i] >> k >> x;  // 读入满分、选项数（无用）、正确选项个数
        for (int j = 0; j < x; ++j) {
            char c; cin >> c;
            correct[i] |= (1 << (c - 'a'));  // 用位掩码存储正确选项
        }
    }

    for (int stu = 0; stu < n; ++stu) {
        int total = 0;
        for (int q = 0; q < m; ++q) {
            string tok;
            cin >> tok; // 形如 "(2ac)" 或 "(0)"
            int p = 1, cnt = 0;
            // 解析选项个数（括号内的第一个数字）
            while (tok[p] >= '0' && tok[p] <= '9') { cnt = cnt * 10 + (tok[p] - '0'); ++p; }
            int mask = 0;
            // 解析具体选项字母，构建位掩码
            while (tok[p] != ')') { mask |= (1 << (tok[p] - 'a')); ++p; }

            // 评分逻辑
            if (mask == correct[q]) {
                total += full[q];          // 全对，得满分
            } else if (mask != 0 && (mask & correct[q]) == mask) {
                total += full[q] / 2;      // 仅部分正确且无错选，得一半分
            }
            // 只要不是全对就算答错（用于统计错误人数）
            if (mask != correct[q]) ++wrong[q];
        }
        cout << total << endl;
    }

    // 找出答错人数最多的题目
    int maxWrong = 0;
    for (int i = 0; i < m; ++i) maxWrong = max(maxWrong, wrong[i]);
    if (maxWrong == 0) {
        cout << "Too simple" << endl;  // 所有题无人答错
    } else {
        bool first = true;
        for (int i = 0; i < m; ++i) {
            if (wrong[i] == maxWrong) {
                if (!first) cout << ' ';
                cout << i + 1;  // 题号从 1 开始
                first = false;
            }
        }
        cout << endl;
    }
    return 0;
}