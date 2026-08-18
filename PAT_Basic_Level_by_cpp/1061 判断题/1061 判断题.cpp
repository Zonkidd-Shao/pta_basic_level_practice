// 1061 判断题
//
// 实现原理：
// 给定每道判断题的分值和标准答案（T/F 字符串），依次计算每位学生的得分。
// 每题只有对（得分）或错（不得分）两种结果，不涉及部分正确。
//
// 关键步骤：
// 1. 读取学生人数 N 和题目数量 M
// 2. 读取每道题的分值数组 score[m]
// 3. 读取标准答案字符串 ans（长度为 M，每个字符为 'T' 或 'F'）
// 4. 对每位学生，读取其作答字符串 s，逐题比较：
//    - 若 s[j] == ans[j]，则累加该题分值
// 5. 输出每位学生的总分
//
// 复杂度分析：
// 时间复杂度：O(N*M)，N 为学生数，M 为题目数。
// 空间复杂度：O(M)，用于存储分值数组。
#include <iostream>
#include <string>
#include <vector>

using namespace std;

int main() {
    int n, m;
    if (!(cin >> n >> m)) return 0;

    // 读取每道题的分值
    vector<int> score(m);
    for (int i = 0; i < m; ++i) cin >> score[i];

    // 读取标准答案字符串
    string ans;
    cin >> ans;

    // 逐位学生处理
    for (int i = 0; i < n; ++i) {
        string s;
        cin >> s;
        int total = 0;
        // 逐题比较，答对则累加对应分值
        for (int j = 0; j < m; ++j)
            if (s[j] == ans[j]) total += score[j];
        cout << total << endl;
    }
    return 0;
}