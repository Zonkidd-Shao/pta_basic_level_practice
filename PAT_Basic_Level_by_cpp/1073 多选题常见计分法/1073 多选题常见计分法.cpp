// 1073 多选题常见计分法
//
// 实现原理：
// 多选题批改系统（与 1058 类似但更复杂）。每道题有满分、选项个数和正确选项。
// 评分类似 1058，但错误统计更细：对每道题的每个选项，统计被"答错"的人次。
// "答错"包括：漏选正确选项（未选）和错选错误选项（多选了错误的选项）。
// 最后输出每道题中错误人次最多的选项（若有多个并列则全部输出），
// 若所有题都无人答错则输出"Too simple"。
//
// 评分规则：
//   - 全对 → 得满分
//   - 选对部分且无错选 → 得一半分（向下取整）
//   - 有错选或空选 → 得 0 分
//
// 错误统计：
//   对每题 q 的每个选项 o，检查学生的选择与正确答案是否一致。
//   若学生选择了但正确答案中没有（错选），或正确答案中有但学生未选（漏选），
//   则该选项被答错一次。
//
// 复杂度分析：
// 时间复杂度：O(N*M*5)，N 为学生数，M 为题目数，5 为最多选项数。
// 空间复杂度：O(M*5)，用于存储各题各选项的错误次数。
#include <iostream>
#include <vector>
#include <string>
#include <algorithm>

using namespace std;

int main() {
    int n, m; // n 考生，m 题
    if (!(cin >> n >> m)) return 0;

    // full[i]：第 i 题满分；correct[i]：第 i 题正确选项的位掩码
    vector<int> full(m), correct(m, 0);
    for (int i = 0; i < m; ++i) {
        int k, x;
        cin >> full[i] >> k >> x;  // 满分、选项数（无用）、正确选项个数
        for (int j = 0; j < x; ++j) {
            char c; cin >> c;
            correct[i] |= (1 << (c - 'a'));  // 位掩码存储正确选项
        }
    }

    // wrongOpt[i][o]：第 i 题第 o 个选项被答错的总人次（0=a, 1=b, ..., 4=e）
    vector<vector<int>> wrongOpt(m, vector<int>(5, 0));

    for (int stu = 0; stu < n; ++stu) {
        int total = 0;
        for (int q = 0; q < m; ++q) {
            string tok;
            cin >> tok; // 形如 (2ac) 或 (0)
            int p = 1, cnt = 0;
            // 解析选项个数
            while (tok[p] >= '0' && tok[p] <= '9') { cnt = cnt * 10 + (tok[p] - '0'); ++p; }
            int mask = 0;
            // 解析具体选项字母，构建位掩码
            while (tok[p] != ')') { mask |= (1 << (tok[p] - 'a')); ++p; }

            // 评分
            if (mask == correct[q]) {
                total += full[q];
            } else if (mask != 0 && (mask & correct[q]) == mask) {
                total += full[q] / 2;  // 部分正确，得一半分
            }

            // 统计各选项答错情况：漏选正确项或错选错误项均计一次
            for (int o = 0; o < 5; ++o) {
                bool isCorrectOpt = (correct[q] >> o) & 1;  // 该选项是否是正确答案
                bool selected = (mask >> o) & 1;            // 学生是否选了该选项
                if (isCorrectOpt != selected) ++wrongOpt[q][o]; // 漏选或错选
            }
        }
        cout << total << endl;
    }

    // 输出各题错误人次最多的选项
    vector<string> lines;
    for (int q = 0; q < m; ++q) {
        int maxWrong = 0;
        for (int o = 0; o < 5; ++o) maxWrong = max(maxWrong, wrongOpt[q][o]);
        if (maxWrong == 0) continue;  // 该题无人答错
        string line = to_string(q + 1);
        for (int o = 0; o < 5; ++o)
            if (wrongOpt[q][o] == maxWrong) line += ' ' + string(1, (char)('a' + o));
        lines.push_back(line);
    }

    if (lines.empty()) cout << "Too simple" << endl;
    else for (const string& l : lines) cout << l << endl;

    return 0;
}