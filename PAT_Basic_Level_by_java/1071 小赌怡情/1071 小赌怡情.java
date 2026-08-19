import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.io.IOException;

/**
 * 1071 小赌怡情
 *
 * 题目描述：
 * 模拟一个简单的赌博游戏。系统给出两个数字n1和n2，玩家需要下注赌n2比n1小还是大。
 * 每次游戏输入格式：n1 b t n2，其中b=0表示赌小（n2 < n1），b=1表示赌大（n2 > n1），
 * t为下注筹码数。若赌对则赢得t筹码，赌错则扣除t筹码。当筹码输光时游戏结束。
 *
 * 实现原理：
 * 解题思路：
 * 1. 读取初始筹码T和游戏轮数K
 * 2. 对每轮游戏，读取n1、b、t、n2四个参数
 * 3. 先检查下注t是否超过当前持有筹码，若超过则输出提示信息
 * 4. 根据b值判断玩家猜测方向：b=0赌n2<n1，b=1赌n2>n1
 * 5. 根据猜对/猜错更新筹码数
 * 6. 若筹码变为0，输出"Game Over."并结束游戏
 *
 * 算法核心逻辑：
 * - 使用boolean变量win记录猜测结果，统一后续的输赢处理逻辑
 * - 先校验筹码充足性，再处理游戏逻辑，避免无效操作
 *
 * 时间复杂度：O(K)，处理K轮游戏
 * 空间复杂度：O(1)，仅使用常数额外空间
 */
public class Main {
    public static void main(String[] args) throws IOException {
        BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
        String[] firstLine = br.readLine().trim().split(" ");
        int T = Integer.parseInt(firstLine[0]);
        int K = Integer.parseInt(firstLine[1]);
        
        for (int i = 0; i < K; i++) {
            String[] parts = br.readLine().trim().split(" ");
            int n1 = Integer.parseInt(parts[0]);  // 第一个数
            int b = Integer.parseInt(parts[1]);   // 玩家赌的方向：0赌小，1赌大
            int t = Integer.parseInt(parts[2]);   // 下注筹码数
            int n2 = Integer.parseInt(parts[3]);  // 第二个数

            // 检查筹码是否足够
            if (t > T) {
                System.out.printf("Not enough tokens.  Total = %d.\n", T);
            } else {
                // 判断玩家是否猜对
                boolean win = false;
                if (b == 0) {  // 赌小：n2 < n1
                    win = n2 < n1;
                } else {  // 赌大：n2 > n1
                    win = n2 > n1;
                }
                if (win) {
                    T += t;  // 赢得筹码
                    System.out.printf("Win %d!  Total = %d.\n", t, T);
                } else {
                    T -= t;  // 输掉筹码
                    System.out.printf("Lose %d.  Total = %d.\n", t, T);
                    if (T == 0) {  // 筹码输光，游戏结束
                        System.out.println("Game Over.");
                        break;
                    }
                }
            }
        }
    }
}
