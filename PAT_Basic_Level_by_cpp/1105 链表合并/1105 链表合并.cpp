/*
 * 1105 链表合并
 * 解析 h1 h2 N 链表，按短链逆序间隔插入长链
 */
#include <bits/stdc++.h>
using namespace std;
struct Node { int addr, data, next; };
int main() {
    ios::sync_with_stdio(false);
    cin.tie(nullptr);
    string hs1, hs2;
    int N;
    if (!(cin >> hs1 >> hs2 >> N)) return 0;
    vector<Node> nodes(100000, {-1,-1,-1});
    vector<int> exists(100000, 0);
    for (int i = 0; i < N; ++i) {
        string a, ne; int d;
        cin >> a >> d >> ne;
        int ai = (a == "-1" ? -1 : stoi(a));
        int nei = (ne == "-1" ? -1 : stoi(ne));
        if (ai != -1) { nodes[ai] = {ai, d, nei}; exists[ai]=1; }
    }
    auto build = [&](string head)->vector<int>{
        vector<int> order;
        int p = (head=="-1"?-1:stoi(head));
        while (p != -1) { order.push_back(p); p = nodes[p].next; }
        return order;
    };
    vector<int> o1 = build(hs1);
    vector<int> o2 = build(hs2);
    vector<int> *long_list, *short_list;
    if (o1.size() >= o2.size()) { long_list=&o1; short_list=&o2; }
    else { long_list=&o2; short_list=&o1; }
    reverse(short_list->begin(), short_list->end());
    vector<int> merged;
    merged.reserve(long_list->size()+short_list->size());
    size_t q=0;
    for (size_t i=0;i<long_list->size();++i){
        merged.push_back((*long_list)[i]);
        if ((i+1)%2==0 && q < short_list->size()) merged.push_back((*short_list)[q++]);
    }
    // 按合并后顺序输出
    for (size_t i=0;i<merged.size();++i){
        int addr = merged[i];
        int nextAddr = (i+1<merged.size()? merged[i+1] : -1);
        if (nextAddr==-1) printf("%05d %d -1\n", addr, nodes[addr].data);
        else printf("%05d %d %05d\n", addr, nodes[addr].data, nextAddr);
    }
    return 0;
}
