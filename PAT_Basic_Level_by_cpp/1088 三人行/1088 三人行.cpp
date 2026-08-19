// 1088 三人行
//
// 实现原理：
// 甲的能力值是 2 位正整数；把甲的 2 个数字调换位置得到乙的能力值；
// 甲乙两人能力差是丙的能力值的 X 倍；乙的能力值是丙的 Y 倍。
// 即：乙 = 甲的数字调换，丙 = 乙 / Y，且 |甲 - 乙| = 丙 * X。
// 若解不唯一，取甲的最大解；若解不存在，输出 "No Solution"。
//
// 关键步骤：
// 1. 从大到小遍历所有 2 位正整数作为甲（保证取最大解）。
// 2. 计算乙 = 甲的数字调换；若乙能被 Y 整除，则丙 = 乙 / Y。
// 3. 检查 |甲 - 乙| == 丙 * X 是否成立，成立则找到解。
// 4. 输出甲的能力值，以及甲、乙、丙三人与"我"（M）的关系：
//    比 M 强输出 Cong，相等输出 Ping，比 M 弱输出 Gai。
//
// 复杂度分析：
// 时间复杂度：O(1)，最多遍历 90 个 2 位数。
// 空间复杂度：O(1)，仅使用常数个变量。
#include <iostream>
#include <cmath>

using namespace std;

int main() {
    int m, x, y;
    if (!(cin >> m >> x >> y)) return 0;

    int jia = 0, yi = 0, bing = 0;
    bool found = false;
    for (int a = 99; a >= 10; --a) {          // 从大到小遍历，保证取甲的最大解
        int b = (a % 10) * 10 + a / 10;       // 乙 = 甲的数字调换
        if (b % y != 0) continue;             // 乙必须是 Y 的整数倍
        int c = b / y;                        // 丙 = 乙 / Y
        if (abs(a - b) == c * x) {            // 甲乙差 = 丙 * X
            jia = a; yi = b; bing = c;
            found = true;
            break;
        }
    }

    if (!found) { cout << "No Solution" << endl; return 0; }

    cout << jia;
    int vals[3] = {jia, yi, bing};
    for (int i = 0; i < 3; ++i) {
        cout << ' ';
        if (vals[i] > m) cout << "Cong";
        else if (vals[i] == m) cout << "Ping";
        else cout << "Gai";
    }
    cout << endl;
    return 0;
}
