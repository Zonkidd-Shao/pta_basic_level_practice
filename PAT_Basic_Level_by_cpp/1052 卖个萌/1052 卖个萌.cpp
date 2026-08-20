// 1052 卖个萌
//
// 实现原理：
// 本题维护一个 N×M 的表情符号网格，根据用户查询（行列号从 1 开始）返回对应位置的表情。
// 如果查询的坐标越界（行号 <1 或 >N，列号 <1 或 >M），则输出固定的调侃语句。
//
// 关键步骤：
// 1. 读取网格维度 N 和 M，建立 N×M 的字符串二维数组
// 2. 按行优先顺序读取每个表情符号
// 3. 对每个查询 (a, b)，检查是否越界
// 4. 越界则输出调侃语，否则输出 g[a-1][b-1]（转换为 0-based 索引）
//
// 复杂度分析：
// 时间复杂度：O(N*M + K)，其中 N、M 为网格维度，K 为查询次数。
// 空间复杂度：O(N*M)，用于存储表情网格。
#include <iostream>
#include <vector>
#include <string>

using namespace std;

int main() {
    vector<vector<string>> part(3);
    string line;
    for (int i = 0; i < 3; ++i) {
        if (!getline(cin, line)) return 0;
        for (size_t p = 0; p < line.size();) {
            size_t left = line.find('[', p);
            if (left == string::npos) break;
            size_t right = line.find(']', left + 1);
            if (right == string::npos) break;
            part[i].push_back(line.substr(left + 1, right - left - 1));
            p = right + 1;
        }
    }

    int k;
    if (!(cin >> k)) return 0;
    for (int i = 0; i < k; ++i) {
        int lh, le, mouth, re, rh;
        cin >> lh >> le >> mouth >> re >> rh;
        if (lh < 1 || lh > (int)part[0].size() ||
            le < 1 || le > (int)part[1].size() ||
            mouth < 1 || mouth > (int)part[2].size() ||
            re < 1 || re > (int)part[1].size() ||
            rh < 1 || rh > (int)part[0].size()) {
            cout << "Are you kidding me? @\\/@" << endl;
        } else {
            cout << part[0][lh - 1] << '(' << part[1][le - 1]
                 << part[2][mouth - 1] << part[1][re - 1] << ')'
                 << part[0][rh - 1] << endl;
        }
    }
    return 0;
}
