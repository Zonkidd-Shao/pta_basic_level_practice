/*
 * 1106 2019数列
 * 直接复制 by_c 逻辑转为 C++
 */
#include <bits/stdc++.h>
using namespace std;
int main() {
    ios::sync_with_stdio(false);
    cin.tie(nullptr);
    int n;
    if (!(cin >> n)) return 0;
    vector<int> seq(n);
    if (n > 0) seq[0]=2;
    if (n > 1) seq[1]=0;
    if (n > 2) seq[2]=1;
    if (n > 3) seq[3]=9;
    for (int i=4;i<n;++i) seq[i]=(seq[i-1]+seq[i-2]+seq[i-3]+seq[i-4])%10;
    for (int i=0;i<n;++i) cout << seq[i];
    cout << "\n";
    return 0;
}
