/*
 * 1087 有多少不同的值
 *
 * 【实现原理】
 * 对于自然数 i 从 1 到 N，计算函数 f(i) = i + ⌊i/2⌋ + ⌊i/3⌋ + ⌊i/5⌋
 * （其中 ⌊⌋ 表示向下取整，即整数除法），统计所有 f(i) 中不同值的个数。
 *
 * 【算法思路】
 * 1. 读取 N。
 * 2. 使用 set 容器自动去重，遍历 i 从 1 到 N。
 * 3. 计算 f(i) = i + i/2 + i/3 + i/5（C++ 整数除法自动向下取整）。
 * 4. 将 f(i) 插入 set，最后输出 set 的大小即为不同值的个数。
 *
 * 【复杂度分析】
 * - 时间复杂度：O(N log N)，set 的插入操作 O(log N)。
 * - 空间复杂度：O(N)，最坏情况下所有 f(i) 值都不同。
 */
#include <iostream>
#include <set>

using namespace std;

int main() {
    int n;
    if (!(cin >> n)) return 0;
    set<int> s;                     // 利用 set 自动去重
    for (int i = 1; i <= n; ++i)
        s.insert(i + i / 2 + i / 3 + i / 5);  // 计算 f(i) 并插入集合
    cout << s.size() << endl;       // 输出不同值的个数
    return 0;
}
