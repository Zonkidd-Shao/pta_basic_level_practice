/**
 * 1046 划拳
 * 
 * 题目描述：
 * 划拳是古老的中国酒游戏。两人同时喊出一个数字（叫喊）并出手指（划出数字）。
 * 规则如下：若甲喊的数字等于两人出手指数之和，而乙喊的不等于，则乙喝酒一杯；
 * 若乙喊的数字等于两人出手指数之和，而甲喊的不等于，则甲喝酒一杯；
 * 若两人都猜对或都猜错，则无人喝酒（平局）。
 * 统计 n 轮之后甲乙两人各自喝了多少杯酒。
 * 
 * 实现原理：
 * 解题思路：
 * 1. 逐轮读取甲喊(a)、甲划(b)、乙喊(c)、乙划(d)四个数字。
 * 2. 计算两人出手指数之和 sum = b + d。
 * 3. 根据划拳规则判断谁喝酒：
 *    - sum == a 且 sum != c：甲猜对、乙猜错，乙喝酒
 *    - sum == c 且 sum != a：乙猜对、甲猜错，甲喝酒
 *    - 其他情况（都猜对或都猜错）：无人喝酒
 * 4. 累加甲乙各自的喝酒杯数，最后输出。
 * 
 * 核心思想：直接模拟划拳规则，逐轮判断处理。
 * 
 * 时间复杂度：O(n)，空间复杂度：O(1)
 */
import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.io.IOException;

public class Main {
    public static void main(String[] args) throws IOException {
        BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
        int n = Integer.parseInt(br.readLine().trim());
        int aDrink = 0, bDrink = 0;
        for (int i = 0; i < n; i++) {
            String[] p = br.readLine().trim().split("\\s+");
            int a = Integer.parseInt(p[0]); // 甲喊的数字
            int b = Integer.parseInt(p[1]); // 甲出手指的数字
            int c = Integer.parseInt(p[2]); // 乙喊的数字
            int d = Integer.parseInt(p[3]); // 乙出手指的数字
            int sum = b + d;                // 出手指数之和
            // 甲猜对且乙猜错 → 乙喝酒；乙猜对且甲猜错 → 甲喝酒
            if (sum == a && sum != c) bDrink++;
            else if (sum == c && sum != a) aDrink++;
        }
        System.out.println(aDrink + " " + bDrink);
    }
}
