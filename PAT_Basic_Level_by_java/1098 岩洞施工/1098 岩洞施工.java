/**
 * 1098 岩洞施工
 * 
 * 题目描述：
 * 岩洞的纵切面由一条上轮廓线和一条下轮廓线组成，
 * 要施工的管道是圆柱形，需要在不触碰洞壁的情况下通过。
 * 判断是否可以施工，以及管道的最大直径。
 * 
 * 实现原理：
 * 解题思路：每个位置的最小可通过直径是上轮廓线高度减去下轮廓线高度，
 *   整体最小间隙就是所有位置间隙的最小值，决定了管道的最大直径。
 * 算法核心逻辑：
 *   1. 读取上轮廓线 top 和下轮廓线 bottom 的 n 个点
 *   2. 计算每个位置 i 的间隙 gap[i] = top[i] - bottom[i]
 *   3. 找出最小间隙 minGap
 *   4. 若 minGap >= 1，输出 "Yes" 和 minGap（管道最大直径）
 *      否则输出 "No" 和需要削掉的高度 (1 - minGap)
 * 时间复杂度：O(n)
 * 空间复杂度：O(n)
 */
import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;

public class Main {
    public static void main(String[] args) throws IOException {
        BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
        int n = Integer.parseInt(br.readLine());
        
        // 读取上轮廓线和下轮廓线
        String[] topStr = br.readLine().split(" ");
        String[] bottomStr = br.readLine().split(" ");
        
        int minTop = Integer.MAX_VALUE;
        int maxBottom = Integer.MIN_VALUE;

        for (int i = 0; i < n; i++) {
            minTop = Math.min(minTop, Integer.parseInt(topStr[i]));
            maxBottom = Math.max(maxBottom, Integer.parseInt(bottomStr[i]));
        }

        // 管道必须水平，因此可用空间由全洞最低的顶部和全洞最高的底部决定。
        int gap = minTop - maxBottom;
        if (gap >= 1) {
            System.out.println("Yes " + gap);
        } else {
            System.out.println("No " + (1 - gap));
        }
    }
}
