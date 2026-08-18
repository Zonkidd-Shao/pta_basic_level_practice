// 1055 集体照
//
// 实现原理：
// 将 N 个人分成 K 排拍照，要求：
//   1. 后排最高，且后排人数最多（把多余的人放到最后一排）
//   2. 每排中，最高的人站在中间（即 m/2 位置，0-based 索引）
//   3. 其余人按身高从高到矮，交替站在最高者的左侧和右侧（身高相同按姓名字典序升序）
//
// 算法步骤：
// 1. 将所有学生按身高降序排序，同身高按姓名字典序升序
// 2. 计算每排人数：每排基础人数 = N/K，最后一排（最高）额外多出 N - (K-1)*(N/K) 人
// 3. 对每一排，使用一个顺序数组 order 模拟站队过程：
//    - 最高者（当前排第一个）放中间位置 order[mid] = 0
//    - 从 k=1 开始，奇数步站左边 (order[l--] = kk)，偶数步站右边 (order[r++] = kk)
//    - 最后按 order 数组的顺序输出对应学生的名字
//
// 复杂度分析：
// 时间复杂度：O(NlogN)，主要开销在排序。
// 空间复杂度：O(N)，用于存储学生信息。
#include <iostream>
#include <vector>
#include <algorithm>
#include <string>

using namespace std;

struct Stu {
    string name;
    int h;
};

int main() {
    int n, k;
    if (!(cin >> n >> k)) return 0;

    vector<Stu> s(n);
    for (int i = 0; i < n; ++i) cin >> s[i].name >> s[i].h;

    // 先按身高降序排列，同身高按名字升序
    sort(s.begin(), s.end(), [](const Stu& a, const Stu& b) {
        if (a.h != b.h) return a.h > b.h;     // 身高降序
        return a.name < b.name;               // 同身高名字升序
    });

    int perRow = n / k;
    int extra = n - perRow * (k - 1); // 后排（最高一排）的人数，即多出的人

    int base = 0;
    for (int row = 0; row < k; ++row) {
        int m = (row == 0) ? extra : perRow; // 第 0 排为后排（最高），人数最多
        vector<int> order(m);                 // 存储该排的站队顺序（索引映射）
        int mid = m / 2;
        order[mid] = 0;                       // 最高者（当前排第一个人）站中间
        int l = mid - 1, r = mid + 1;
        // 交替站队：先左后右（奇数步左，偶数步右），保持左右平衡
        for (int kk = 1; kk < m; ++kk) {
            if (kk % 2 == 1) order[l--] = kk;  // 站左边
            else order[r++] = kk;                // 站右边
        }
        // 按 order 顺序输出该排学生姓名
        for (int j = 0; j < m; ++j) {
            if (j) cout << ' ';
            cout << s[base + order[j]].name;
        }
        cout << endl;
        base += m;  // 移动到下一批学生
    }
    return 0;
}