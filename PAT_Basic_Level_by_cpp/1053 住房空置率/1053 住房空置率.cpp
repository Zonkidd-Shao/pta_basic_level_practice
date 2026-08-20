// 1053 住房空置率
//
// 实现原理：
// 本题统计 N 户居民的用电数据，判断每户是否"可能空置"或"空置"。
// 判定规则：
//   - 若某天用电量低于阈值 e，则认为当天"可能空置"
//   - 若连续"可能空置"天数达到 D 天，则判定为"空置"
//   - 否则，若"可能空置"总天数超过观察天数的一半，则判定为"可能空置"
// 最后输出两种状态的户数占总户数的百分比。
//
// 关键步骤：
// 1. 读取总户数 N、用电阈值 e、空置判定阈值 D
// 2. 对每户，读取观察天数 Di 和每天的用电量
// 3. 统计单户中用电量低于 e 的天数 low，以及最大连续低于 e 的天数 maxConsec
// 4. 若 maxConsec >= D，计为空置；否则若 low > Di/2，计为可能空置
// 5. 计算并输出百分比
//
// 复杂度分析：
// 时间复杂度：O(∑Di)，即所有住户的观察天数总和。
// 空间复杂度：O(1)，只使用常数额外空间。
#include <iostream>
#include <iomanip>

using namespace std;

int main() {
    int N, D;
    double e;
    if (!(cin >> N >> e >> D)) return 0;

    int maybe = 0, vacant = 0;
    for (int i = 0; i < N; ++i) {
        int Di;
        cin >> Di;
        int low = 0;
        for (int j = 0; j < Di; ++j) {
            double x;
            cin >> x;
            if (x < e) ++low;
        }
        // 低用电天数超过一半才进入两种空置状态；观察期超过 D 天才算空置。
        if (low > Di / 2) {
            if (Di > D) ++vacant;
            else ++maybe;
        }
    }

    // 输出百分比，保留 1 位小数
    cout << fixed << setprecision(1)
         << (maybe * 100.0 / N) << "% "
         << (vacant * 100.0 / N) << "%" << endl;
    return 0;
}
