/*
 * 1088 三人行
 *
 * 【实现原理】
 * 给定"我"的能力值 M 以及系数 a 和 b，甲的能力值 = M × a，乙的能力值 = M × b。
 * 分别比较甲和乙的能力值与"我"的能力值 M 的大小关系：
 * - 大于 M，则称对方为"师兄"（能力更强）。
 * - 小于 M，则称对方为"师弟"（能力更弱）。
 * - 等于 M，则为"平等小伙伴"。
 *
 * 【算法思路】
 * 1. 读取 M, a, b。
 * 2. 定义 judge 函数，比较 other 与 me 的大小，输出对应的称谓。
 * 3. 分别调用 judge 判断甲和乙。
 *
 * 【复杂度分析】
 * - 时间复杂度：O(1)，仅涉及常数次比较和输出。
 * - 空间复杂度：O(1)，只使用常数额外空间。
 */
#include <iostream>

using namespace std;

// 判断并输出对方与"我"的关系
void judge(int other, int me, const string& who) {
    if (other > me) cout << who << " 是 我 的 师 兄。" << endl;
    else if (other < me) cout << who << " 是 我 的 师 弟。" << endl;
    else cout << who << " 和 我 是 平 等 小 伙 伴。" << endl;
}

int main() {
    int m, a, b;
    if (!(cin >> m >> a >> b)) return 0;
    judge(m * a, m, "甲");  // 判断甲
    judge(m * b, m, "乙");  // 判断乙
    return 0;
}
