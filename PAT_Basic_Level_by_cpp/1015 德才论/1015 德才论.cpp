// 1015 德才论
// 按司马光"德才论"对考生分类排序录取：
//   第一类：德、才均 >= H（才德全尽）
//   第二类：德 >= H，才 < H 但 >= L（德胜才）
//   第三类：德、才均 < H，但德 >= 才，且均 >= L（尚德胜才）
//   第四类：其余德、才均 >= L 者
// 排序：类号升序；同类按总分降序；总分同按德分降序；再同按准考证号升序。
//
// 【实现原理】
// 算法思路：
//   1. 读入所有考生信息，过滤掉德分或才分低于录取线 L 的考生。
//   2. 根据德分和才分与 H 的比较结果，将考生分为 4 类（cat=1~4）。
//   3. 使用标准库 sort 函数，按照题目的排序规则进行排序：
//      - 第一关键字：类别升序
//      - 第二关键字：总分（德+才）降序
//      - 第三关键字：德分降序
//      - 第四关键字：准考证号升序
//   4. 输出录取人数和所有录取考生的详细信息。
// 关键点：
//   - 第三类的判定条件"德 >= 才"需要仔细理解：德才均 < H 且德 >= 才。
//   - 使用 vector 的 reserve 预分配空间可以减少多次扩容的开销。
// 时间复杂度：O(N log N)，排序为主要开销。
// 空间复杂度：O(N)，存储所有录取考生信息。
#include <iostream>
#include <vector>
#include <algorithm>

using namespace std;

struct Student {
    int id;     // 准考证号
    int de;     // 德分
    int cai;    // 才分
    int total;  // 总分
    int cat;    // 类别 1~4
};

int main() {
    int n, L, H;
    if (!(cin >> n >> L >> H)) return 0;

    vector<Student> stu;
    stu.reserve(n);
    for (int i = 0; i < n; ++i) {
        int id, de, cai;
        cin >> id >> de >> cai;
        if (de < L || cai < L) continue; // 不及格，不录取

        Student s;
        s.id = id;
        s.de = de;
        s.cai = cai;
        s.total = de + cai;
        if (de >= H && cai >= H) s.cat = 1;
        else if (de >= H) s.cat = 2;
        else if (de >= cai) s.cat = 3;
        else s.cat = 4;
        stu.push_back(s);
    }

    sort(stu.begin(), stu.end(), [](const Student& a, const Student& b) {
        if (a.cat != b.cat) return a.cat < b.cat;
        if (a.total != b.total) return a.total > b.total;
        if (a.de != b.de) return a.de > b.de;
        return a.id < b.id;
    });

    cout << stu.size() << endl;
    for (const auto& s : stu) {
        cout << s.id << ' ' << s.de << ' ' << s.cai << endl;
    }
    return 0;
}