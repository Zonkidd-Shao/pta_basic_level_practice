#include <iostream>
#include <string>
#include <vector>
#include <map>
#include <algorithm>
using namespace std;

struct Stu {
    string ticket;
    int score;
};

int main() {
    int n, m;
    if (!(cin >> n >> m)) return 0;
    vector<Stu> s(n);
    for (int i = 0; i < n; ++i) cin >> s[i].ticket >> s[i].score;
    for (int q = 1; q <= m; ++q) {
        int type;
        string cmd;
        cin >> type >> cmd;
        cout << "Case " << q << ": " << type << " " << cmd << "\n";
        if (type == 1) {
            vector<Stu> res;
            for (auto &st : s) if (st.ticket[0] == cmd[0]) res.push_back(st);
            if (res.empty()) { cout << "NA\n"; continue; }
            sort(res.begin(), res.end(), [](const Stu& a, const Stu& b){
                if (a.score != b.score) return a.score > b.score;
                return a.ticket < b.ticket;
            });
            for (auto &st : res) cout << st.ticket << " " << st.score << "\n";
        } else if (type == 2) {
            int cnt=0, sum=0;
            for (auto &st : s) if (st.ticket.substr(1,3)==cmd) { ++cnt; sum+=st.score; }
            if (cnt==0) cout << "NA\n";
            else cout << cnt << " " << sum << "\n";
        } else {
            map<string,int> roomCnt;
            for (auto &st : s) if (st.ticket.substr(4,6)==cmd) roomCnt[st.ticket.substr(1,3)]++;
            if (roomCnt.empty()) { cout << "NA\n"; continue; }
            vector<pair<string,int>> v(roomCnt.begin(), roomCnt.end());
            sort(v.begin(), v.end(), [](auto &a, auto &b){
                if (a.second!=b.second) return a.second>b.second;
                return a.first<b.first;
            });
            for (auto &p: v) cout << p.first << " " << p.second << "\n";
        }
    }
    return 0;
}
