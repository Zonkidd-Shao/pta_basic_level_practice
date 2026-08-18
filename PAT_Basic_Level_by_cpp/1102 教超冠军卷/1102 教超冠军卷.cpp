/*
 * 1102 教超冠军卷
 *
 * 【实现原理】
 * 本题模拟超市商品销售管理。首先录入 N 种商品信息（编号、单价（单位为角）、库存量），
 * 然后处理多条购物记录（商品编号 + 数量，以编号 "0" 结束）。对于每条记录：
 * - 若库存充足则扣减库存、增加销量、累加营业额（以角为单位累计避免浮点误差）；
 * - 若库存不足则输出提示信息。
 * 最后输出总营业额（元，保留 1 位小数）以及销量最高的商品编号（销量并列时取编号较小的）。
 *
 * 【算法思路】
 * 1. 使用 map<string, Item> 存储商品信息，Item 结构体包含单价、库存、销量。
 * 2. 顺序读入购物记录，判断库存是否充足，执行相应操作。
 * 3. 遍历 map 找出销量最高的商品（销量相同取编号字典序最小的）。
 * 4. 营业额以角（jiao）为累加单位，输出时除以 10.0 转换为元。
 *
 * 【复杂度分析】
 * - 时间复杂度：O(N + M)，其中 N 为商品种类数，M 为购物记录条数。
 * - 空间复杂度：O(N)，用于存储商品信息。
 */
#include <iostream>
#include <string>
#include <map>
#include <cstdio>

using namespace std;

struct Item {
    int priceJiao;  // 单价，以角为单位
    int stock;      // 当前库存量
    int sold;       // 已售出数量
};

int main() {
    int n;
    if (!(cin >> n)) return 0;
    map<string, Item> items;                     // 商品编号 -> 商品信息
    for (int i = 0; i < n; ++i) {
        string code;
        int p, s;
        cin >> code >> p >> s;                   // 读取编号、单价（角）、库存
        items[code] = {p, s, 0};                 // 初始化销量为 0
    }

    long long revenueJiao = 0;                   // 总营业额，以角为单位累计
    while (true) {
        string code;
        if (!(cin >> code)) break;               // 读入商品编号，若输入结束则退出
        if (code == "0") break;                  // 编号 "0" 表示结束
        int qty;
        cin >> qty;                              // 购买数量
        auto it = items.find(code);
        if (it == items.end() || it->second.stock < qty) {
            cout << code << ": 库存不足" << endl; // 商品不存在或库存不足
        } else {
            it->second.stock -= qty;             // 扣减库存
            it->second.sold += qty;              // 增加销量
            revenueJiao += (long long)it->second.priceJiao * qty; // 累加营业额（角）
        }
    }

    printf("%.1f\n", revenueJiao / 10.0);         // 输出总营业额，单位为元
    int bestSold = -1;
    string bestCode = "";
    for (auto& kv : items) {
        // 比较销量，销量相同时取编号字典序较小的
        if (kv.second.sold > bestSold || (kv.second.sold == bestSold && kv.first < bestCode)) {
            bestSold = kv.second.sold;
            bestCode = kv.first;
        }
    }
    if (bestSold > 0) cout << bestCode << endl;   // 输出销量最高的商品编号
    return 0;
}