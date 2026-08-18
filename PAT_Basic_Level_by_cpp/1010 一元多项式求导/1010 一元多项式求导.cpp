// 1010 一元多项式求导
// 以指数递降方式输入多项式非零项系数与指数，输出其导数多项式。
// 导数：(c*x^e)' = c*e*x^(e-1)。零多项式输出 "0 0"。
//
// 【实现原理】
// 算法思路：
//   1. 持续读取系数 c 和指数 e，直到文件末尾。
//   2. 对每一对 (c, e) 求导：
//      - 若 e == 0（常数项），导数为 0，忽略不输出。
//      - 否则，新系数 = c * e，新指数 = e - 1。
//   3. 将求导结果逐对存储到 vector 中。
//   4. 若结果为空（所有项均为常数项），输出 "0 0"。
// 关键点：
//   - 输入以 EOF 结尾，使用 while(cin >> ...) 循环读取。
//   - 注意零多项式的特判处理。
// 时间复杂度：O(K)，其中 K 为输入项数。
// 空间复杂度：O(K)，存储求导结果。
#include <iostream>
#include <vector>

using namespace std;

int main() {
    vector<int> coeff, exp;
    int c, e;
    while (cin >> c >> e) { // 读到文件尾
        coeff.push_back(c);
        exp.push_back(e);
    }

    vector<int> res; // 逐对存放 (新系数, 新指数)
    for (size_t i = 0; i < coeff.size(); ++i) {
        if (exp[i] == 0) continue;          // 常数项求导为 0，忽略
        res.push_back(coeff[i] * exp[i]);   // 新系数
        res.push_back(exp[i] - 1);          // 新指数
    }

    if (res.empty()) {
        cout << "0 0" << endl; // 零多项式特判
        return 0;
    }

    for (size_t i = 0; i < res.size(); ++i) {
        if (i) cout << ' ';
        cout << res[i];
    }
    cout << endl;
    return 0;
}