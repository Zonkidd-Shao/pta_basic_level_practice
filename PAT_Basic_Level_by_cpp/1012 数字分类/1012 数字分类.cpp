// 1012 数字分类
// 对给定正整数按模 5 的余数分类计算：
//   A1: 被 5 整除的偶数之和
//   A2: 被 5 除余 1 的数字交错求和 (n1 - n2 + n3 - ...)
//   A3: 被 5 除余 2 的数字个数
//   A4: 被 5 除余 3 的数字平均数（保留 1 位小数）
//   A5: 被 5 除余 4 的数字中最大值
// 若某类没有数字，输出 N。
//
// 【实现原理】
// 算法思路：
//   遍历所有输入数字，根据 x % 5 的结果进行 switch 分支处理：
//   - 余 0：若为偶数则累加到 A1
//   - 余 1：使用 sign 变量实现交错求和（交替加减），用 hasA2 标记是否存在该类数字
//   - 余 2：计数器 A3 加 1
//   - 余 3：累加和到 sumA4，计数 cntA4 加 1，最后计算平均值
//   - 余 4：更新最大值 A5，用 hasA5 标记是否存在
// 关键点：
//   - A2 可能存在求和结果为 0 的情况，不能用 sum == 0 判断是否存在，需要用单独的布尔标记。
//   - A4 输出保留 1 位小数，使用 fixed << setprecision(1)。
// 时间复杂度：O(N)，一次遍历即可完成所有分类。
// 空间复杂度：O(1)。
#include <iostream>
#include <iomanip>

using namespace std;

int main() {
    int n;
    if (!(cin >> n)) return 0;

    long long a1 = 0;
    int a2 = 0;
    bool hasA2 = false;
    int a3 = 0;
    double sumA4 = 0;
    int cntA4 = 0;
    int a5 = 0;
    bool hasA5 = false;
    int sign = 1;

    for (int i = 0; i < n; ++i) {
        int x;
        cin >> x;
        int r = x % 5;
        switch (r) {
            case 0:
                if (x % 2 == 0) a1 += x;
                break;
            case 1:
                a2 += sign * x;
                sign = -sign;
                hasA2 = true;
                break;
            case 2:
                ++a3;
                break;
            case 3:
                sumA4 += x;
                ++cntA4;
                break;
            case 4:
                if (x > a5) { a5 = x; hasA5 = true; }
                break;
        }
    }

    // 输出各项，缺失项用 N 表示
    if (a1 == 0) cout << "N"; else cout << a1;
    cout << ' ';
    if (!hasA2) cout << "N"; else cout << a2;
    cout << ' ';
    if (a3 == 0) cout << "N"; else cout << a3;
    cout << ' ';
    if (cntA4 == 0) cout << "N"; else cout << fixed << setprecision(1) << (sumA4 / cntA4);
    cout << ' ';
    if (!hasA5) cout << "N"; else cout << a5;
    cout << endl;

    return 0;
}