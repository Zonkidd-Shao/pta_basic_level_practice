// 1063 计算谱半径 - 输入为直角坐标 a b，谱半径为 sqrt(a*a+b*b) 的最大值
#include <iostream>
#include <cmath>
#include <cstdio>
using namespace std;
int main() {
    int n;
    if (!(cin >> n)) return 0;
    double maxr = 0.0;
    for (int i = 0; i < n; ++i) {
        int a, b;
        cin >> a >> b;
        double r = sqrt((double)a*a + (double)b*b);
        if (r > maxr) maxr = r;
    }
    printf("%.2f\n", maxr);
    return 0;
}
