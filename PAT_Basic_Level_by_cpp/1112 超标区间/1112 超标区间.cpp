/*
 * 1112 超标区间
 * 直接复制 by_c 逻辑转为 C++：连续超标区间 [A, B] 否则最大值
 */
#include <bits/stdc++.h>
using namespace std;
int main(){
    ios::sync_with_stdio(false);
    cin.tie(nullptr);
    int N, T;
    if(!(cin>>N>>T)) return 0;
    int max_val=-1;
    bool in_interval=false;
    int start=0;
    bool has_output=false;
    for(int i=0;i<N;++i){
        int a; cin>>a;
        max_val=max(max_val,a);
        if(a>T && !in_interval){ in_interval=true; start=i; cout<<"["<<i<<", "; has_output=true; }
        if(a<=T && in_interval){ in_interval=false; cout<<i-1<<"]\n"; }
    }
    if(!in_interval && max_val<=T) cout<<max_val<<"\n";
    else if(in_interval) cout<<N-1<<"]\n";
    return 0;
}
