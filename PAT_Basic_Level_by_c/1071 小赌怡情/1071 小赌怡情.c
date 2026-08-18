/*
 * 题目：1071 小赌怡情
 * 实现原理：
 *   简单的数字比较赌博游戏。
 *   规则：
 *   - b=0表示押小（n1 > n2），b=1表示押大（n1 < n2）
 *   - t是下注筹码数
 *   - 赢了获得t筹码，输了失去t筹码
 *   - 筹码为0时游戏结束
 *   算法步骤：
 *   1. 读取初始筹码T和游戏次数K
 *   2. 逐次读取每局游戏的n1, b, t, n2
 *   3. 根据规则判断输赢并更新筹码
 *   4. 筹码为0时立即结束游戏
 */
#include <stdio.h>

int main() {
    int T, K;  // T: 初始筹码; K: 游戏次数
    scanf("%d %d", &T, &K);
    for (int i = 0; i < K; i++) {
        int n1, b, t, n2;  // 两个数字 n1、n2，押注方向 b，筹码 t
        scanf("%d %d %d %d", &n1, &b, &t, &n2);
        if (T == 0) {  // 筹码为 0：游戏结束
            printf("Game Over.\n");
            break;
        }
        if (t > T) {  // 下注超过当前筹码：提示不足并跳过本局
            printf("Not enough tokens. Total = %d.\n", T);
            continue;
        }
        if ((n1 > n2 && b == 0) || (n1 < n2 && b == 1)) {  // 押小(b=0)且 n1>n2 或押大(b=1)且 n1<n2：赢
            T += t;
            printf("Win %d! Total = %d.\n", t, T);
        } else {  // 猜错：扣除筹码
            T -= t;
            printf("Lose %d. Total = %d.\n", t, T);
            if (T == 0) {  // 输光筹码：游戏结束
                printf("Game Over.\n");
                break;
            }
        }
    }
    return 0;
}