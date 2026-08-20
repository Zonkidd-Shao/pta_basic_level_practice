/*
 * 1107 老鼠爱大米
 * 直接复制 by_c 逻辑转为 C++
 */
#include <bits/stdc++.h>
using namespace std;
int main() {
    ios::sync_with_stdio(false);
    cin.tie(nullptr);
    int N, M;
    if (!(cin >> N >> M)) return 0;
    vector<int> champions(N);
    int max_champion = -1;
    for (int i=0;i<N;++i){
        int max_weight=-1;
        for (int j=0;j<M;++j){ int w; cin>>w; max_weight=max(max_weight,w); }
        champions[i]=max_weight;
        max_champion=max(max_champion,max_weight);
    }
    for (int i=0;i<N;++i){
        if (i) cout << ' ';
        cout << champions[i];
    }
    cout << "\n" << max_champion << "\n";
    return 0;
}
