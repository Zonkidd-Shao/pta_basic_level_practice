// 1071 小赌怡情
//
// 实现原理：
// 模拟赌博游戏。玩家持有 T 个筹码，进行 K 局游戏。每局：
//   1. 玩家下注 bet 并猜一个数字 guess（1~9）
//   2. 电脑开出一个数字 comp（1~9）
//   3. 判定规则：
//      - 猜中 → 赢得下注，筹码增加 bet（即赢回下注额）
//      - 未猜中但奇偶性相同 → 不输不赢（按题目规约输出固定提示）
//      - 否则 → 输掉下注，筹码减少 bet
//   4. 下注非法（>手中筹码 或 ≤0）→ 跳过本局（输出 Not enough tokens）
//   5. 筹码 ≤ 0 → Game Over 并结束
//
// 关键步骤：
// 1. 读取初始筹码 T 和游戏局数 K
// 2. 逐局读取 bet、guess、comp
// 3. 先判断 Game Over 条件，再判断下注合法性
// 4. 根据猜中、奇偶相同、猜错三种情况处理
//
// 复杂度分析：
// 时间复杂度：O(K)，K 为游戏局数。
// 空间复杂度：O(1)，只使用常数额外空间。
#include <iostream>

using namespace std;

int main() {
    int T, K;
    if (!(cin >> T >> K)) return 0;

    for (int i = 0; i < K; ++i) {
        int bet, guess, comp;
        cin >> bet >> guess >> comp;

        if (T <= 0) { cout << "Game Over." << endl; break; }

        // 下注非法：超过手中筹码或非正数
        if (bet > T || bet <= 0) {
            cout << "Not enough tokens. Total = " << T << "." << endl;
            continue;
        }

        if (guess == comp) {
            T += bet;  // 猜中，赢得下注
            cout << "Win and have " << T << " tokens." << endl;
        } else if ((guess % 2) == (comp % 2)) {
            // 奇偶性相同但未猜中：不输不赢（按题目规约输出如下提示）
            cout << "Not enough tokens. Total = " << T << "." << endl;
        } else {
            T -= bet;  // 猜错且奇偶不同，输掉下注
            cout << "Lose and have " << T << " tokens." << endl;
        }

        if (T <= 0) { cout << "Game Over." << endl; break; }
    }
    return 0;
}