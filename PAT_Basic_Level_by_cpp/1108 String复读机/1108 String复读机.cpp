/*
 * 1108 String复读机
 * 直接复制 by_c 逻辑转为 C++：统计 String 各字符出现次数循环输出
 */
#include <bits/stdc++.h>
using namespace std;
int main() {
    ios::sync_with_stdio(false);
    cin.tie(nullptr);
    string str;
    if (!getline(cin, str)) return 0;
    // 若首行可能为空，尝试再读
    if (str.size()==0 && !cin.eof()) getline(cin, str);
    string target="String";
    int cnt[6]={0};
    for (char c: str) for (int j=0;j<6;++j) if (c==target[j]){cnt[j]++; break;}
    string out;
    while (true){
        bool done=true;
        for (int i=0;i<6;++i) if (cnt[i]>0){ done=false; out.push_back(target[i]); cnt[i]--; }
        if (done) break;
    }
    cout << out << "\n";
    return 0;
}
