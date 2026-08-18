// 1004 成绩排名
// 读入 n 名学生的姓名、学号、成绩，输出成绩最高与最低学生的姓名和学号。
// 保证没有两个学生成绩相同。
//
// 【实现原理】
// 算法思路：
//   在线处理（Online Algorithm）：
//   逐行读取学生信息，在读取过程中动态维护当前最高分和最低分的学生信息。
//   不需要存储所有学生数据，只需记录最高分和最低分对应的姓名和学号。
// 关键步骤：
//   1. 初始化最高分（maxScore）为 -1，最低分（minScore）为 101（成绩范围 0~100）。
//   2. 每读入一条记录，与当前最值比较并更新。
//   3. 循环结束后按格式输出。
// 时间复杂度：O(n)，只需一次遍历。
// 空间复杂度：O(1)，仅使用常数个变量。
#include <iostream>
#include <string>

using namespace std;

int main() {
    int n;
    if (!(cin >> n) || n <= 0) return 0;

    string maxName, maxId, minName, minId;
    int maxScore = -1, minScore = 101; // 成绩范围 0~100

    for (int i = 0; i < n; ++i) {
        string name, id;
        int score;
        cin >> name >> id >> score;
        if (score > maxScore) {
            maxScore = score;
            maxName = name;
            maxId = id;
        }
        if (score < minScore) {
            minScore = score;
            minName = name;
            minId = id;
        }
    }

    cout << maxName << ' ' << maxId << endl;
    cout << minName << ' ' << minId << endl;
    return 0;
}