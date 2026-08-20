/*
 * 1102 教超冠军卷
 * 按 ID 单价 人次 统计销量冠军及销售额冠军，两行输出
 */
#include <bits/stdc++.h>
using namespace std;
int main() {
    ios::sync_with_stdio(false);
    cin.tie(nullptr);
    int N;
    if (!(cin >> N)) return 0;
    string sale_id, money_id;
    int max_sale = -1, max_money = -1;
    for (int i = 0; i < N; ++i) {
        string id; int price, cnt;
        cin >> id >> price >> cnt;
        if (cnt > max_sale) { max_sale = cnt; sale_id = id; }
        int money = price * cnt;
        if (money > max_money) { max_money = money; money_id = id; }
    }
    cout << sale_id << " " << max_sale << "\n";
    cout << money_id << " " << max_money << "\n";
    return 0;
}
