/*
 * 1101 B是A的多少倍
 * 字符串循环移位 B = A.substr(len-D)+A.substr(0,len-D)
 */
#include <bits/stdc++.h>
using namespace std;
int main() {
    string A;
    int D;
    if (!(cin >> A >> D)) return 0;
    int len = (int)A.size();
    string B;
    if (D >= len) B = A;
    else B = A.substr(len - D) + A.substr(0, len - D);
    double ans = stod(B) / stod(A);
    printf("%.2f\n", ans);
    return 0;
}
