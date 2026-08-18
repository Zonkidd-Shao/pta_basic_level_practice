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
    int n, m;
    if (!(cin >> n >> m)) return 0;
    // 创建 N×M 的二维字符串网格
    vector<vector<string>> g(n, vector<string>(m));
    for (int i = 0; i < n; ++i)
        for (int j = 0; j < m; ++j)
            cin >> g[i][j];  // 读取每个位置的表情符号

    int k;
    cin >> k;
    for (int i = 0; i < k; ++i) {
        int a, b;
        cin >> a >> b;
        // 检查坐标是否越界（题目中行列从 1 开始计数）
        if (a < 1 || a > n || b < 1 || b > m)
            cout << "Are you kidding me? @\\/@" << endl;  // 越界输出调侃语
        else
            cout << g[a - 1][b - 1] << endl;  // 转换为 0-based 索引输出
    }
    return 0;
}