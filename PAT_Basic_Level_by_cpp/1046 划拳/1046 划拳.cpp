/*
 * 1046 划拳
 *
 * 【实现原理】
 * 两人划拳，每轮各自喊一个数（0~100）并出手指（0~100）。
 * 如果某人喊的数等于两人出手指数之和，则对方喝一杯；
 * 如果两人都猜中或都没猜中，则都不喝。
 * 统计最后两人各喝了多少杯。
 *
 * 【算法思路】
 * 1. 每轮输入：甲喊、甲出、乙喊、乙出
 * 2. 计算出手指数之和 sum = aHand + bHand
 * 3. 判断胜负：
 *    - 甲猜中且乙没猜中 -> 乙喝（bDrink++）
 *    - 乙猜中且甲没猜中 -> 甲喝（aDrink++）
 *    - 同时猜中或同时没猜中 -> 都不喝
 * 4. 输出两人喝酒杯数
 *
 * 【复杂度分析】
 * - 时间复杂度：O(N)，N 为划拳轮数
 * - 空间复杂度：O(1)
 */

#include <iostream>

using namespace std;

int main() {
    int n;
    if (!(cin >> n)) return 0;

    int aDrink = 0, bDrink = 0;  // 甲乙两人喝的杯数
    for (int i = 0; i < n; ++i) {
        int aShout, aHand, bShout, bHand;
        cin >> aShout >> aHand >> bShout >> bHand;
        int sum = aHand + bHand;  // 两人出手指数之和
        // 甲猜中且乙没猜中 -> 乙喝
        if (sum == aShout && sum != bShout) ++bDrink;
        // 乙猜中且甲没猜中 -> 甲喝
        else if (sum == bShout && sum != aShout) ++aDrink;
        // 同时猜中或同时未中：都不喝
    }
    cout << aDrink << ' ' << bDrink << endl;
    return 0;
}