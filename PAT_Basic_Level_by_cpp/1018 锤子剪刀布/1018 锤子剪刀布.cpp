// 1018 锤子剪刀布
// 统计甲乙交锋的胜、平、负次数，并输出各自获胜次数最多的手势（并列时取字母序最小者）。
// 胜负：布(B) > 锤(C) > 剪(J) > 布(B)
//
// 【实现原理】
// 算法思路：
//   1. 对于每轮出拳，判断胜负平，更新对应计数器。
//   2. 同时记录甲和乙各自以每种手势获胜的次数。
//   3. 胜负判定规则：B > C > J > B（循环克制关系）。
//   4. 最后找出各自获胜次数最多的手势：
//      - 使用 lambda 表达式遍历手势计数数组，找最大值索引。
//      - 由于数组下标 0=B, 1=C, 2=J 已按字母序排列，更新条件用严格大于，
//        当出现并列时，靠前的（字母序小的）会被保留。
// 关键点：
//   - 手势映射为下标时按字母序 B < C < J 排列，便于处理并列情况。
// 时间复杂度：O(N)，一次遍历即可。
// 空间复杂度：O(1)。
#include <iostream>

using namespace std;

// 手势映射到下标：0=B, 1=C, 2=J（正好与字母序 B<C<J 一致，便于并列取最小）
int idx(char c) {
    if (c == 'B') return 0;
    if (c == 'C') return 1;
    return 2;
}

int main() {
    int n;
    if (!(cin >> n)) return 0;

    int aWin = 0, aDraw = 0, aLose = 0;
    int aG[3] = {0}, bG[3] = {0}; // 各自以各手势获胜的次数

    for (int i = 0; i < n; ++i) {
        char a, b;
        cin >> a >> b;
        if (a == b) {
            ++aDraw;
        } else if ((a == 'B' && b == 'C') ||
                   (a == 'C' && b == 'J') ||
                   (a == 'J' && b == 'B')) {
            ++aWin;
            ++aG[idx(a)];
        } else {
            ++aLose;
            ++bG[idx(b)];
        }
    }

    const char order[3] = {'B', 'C', 'J'};
    auto best = [&](const int cnt[3]) {
        int k = 0;
        for (int i = 1; i < 3; ++i) if (cnt[i] > cnt[k]) k = i; // 严格大于才更新，保持字母序最小
        return order[k];
    };

    cout << aWin << ' ' << aDraw << ' ' << aLose << endl;
    cout << aLose << ' ' << aDraw << ' ' << aWin << endl;
    cout << best(aG) << ' ' << best(bG) << endl;
    return 0;
}