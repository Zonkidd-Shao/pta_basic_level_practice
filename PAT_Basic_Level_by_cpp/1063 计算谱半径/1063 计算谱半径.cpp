// 1063 计算谱半径
//
// 实现原理：
// 谱半径是指一组复数模长中的最大值。对于以极坐标形式给出的复数 (r, p)，
// 其模长就是 r（因为极坐标中 r 就是到原点的距离）。
// 因此本题实际上就是求所有输入 r 的最大值，完全不需要考虑角度 p。
//
// 关键步骤：
// 1. 读取 N 对 (r, p)
// 2. 遍历所有 r，记录最大值
// 3. 保留两位小数输出
//
// 复杂度分析：
// 时间复杂度：O(N)，遍历一次即可。
// 空间复杂度：O(1)，只使用常数额外空间。
#include <iostream>
#include <cmath>
#include <cstdio>

using namespace std;

int main() {
    int n;
    if (!(cin >> n)) return 0;
    double maxr = 0.0;
    for (int i = 0; i < n; ++i) {
        double r, p;
        cin >> r >> p;
        // 极坐标下模长即为 r，直接取最大值
        if (r > maxr) maxr = r;
    }
    printf("%.2f\n", maxr);
    return 0;
}