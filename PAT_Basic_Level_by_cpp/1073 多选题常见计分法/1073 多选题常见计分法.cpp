// 1073 多选题常见计分法 - 满分/半分/0分，统计各选项错误次数，输出全局最错
#include <iostream>
#include <vector>
#include <cstdio>
#include <algorithm>
using namespace std;
int main() {
    int N, M;
    if (!(cin >> N >> M)) return 0;
    vector<int> score(M), opt_num(M);
    vector<vector<int>> ans(M, vector<int>(5, 0));
    vector<int> ansCnt(M, 0);
    for (int i = 0; i < M; ++i) {
        int cntAns;
        cin >> score[i] >> opt_num[i] >> cntAns;
        ansCnt[i] = cntAns;
        for (int j = 0; j < cntAns; ++j) {
            char c; cin >> c;
            ans[i][c - 'a'] = 1;
        }
    }
    vector<vector<int>> wrong(M, vector<int>(5, 0));
    for (int i = 0; i < N; ++i) {
        double total = 0;
        for (int q = 0; q < M; ++q) {
            char ch;
            cin >> ch; // '('
            int cnt; cin >> cnt;
            vector<int> stu(5, 0);
            for (int k = 0; k < cnt; ++k) {
                char c; cin >> c;
                stu[c - 'a'] = 1;
            }
            cin >> ch; // ')'
            int flag = 0, partial = 1;
            for (int k = 0; k < opt_num[q]; ++k) {
                if (stu[k] != ans[q][k]) {
                    wrong[q][k]++;
                    if (stu[k] && !ans[q][k]) partial = 0;
                } else if (ans[q][k]) {
                    flag++;
                }
            }
            if (flag == ansCnt[q]) total += score[q];
            else if (partial && flag > 0) total += score[q] / 2.0;
        }
        // 输出保留一位小数
        printf("%.1f\n", total);
    }
    int maxWrong = 0;
    for (int i = 0; i < M; ++i) for (int j = 0; j < opt_num[i]; ++j) maxWrong = max(maxWrong, wrong[i][j]);
    if (maxWrong == 0) {
        cout << "Too simple" << endl;
    } else {
        for (int i = 0; i < M; ++i) for (int j = 0; j < opt_num[i]; ++j) if (wrong[i][j] == maxWrong) {
            printf("%d %d-%c\n", maxWrong, i+1, 'a'+j);
        }
    }
    return 0;
}
