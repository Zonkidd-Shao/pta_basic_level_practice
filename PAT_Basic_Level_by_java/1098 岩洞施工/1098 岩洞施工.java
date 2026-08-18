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
        
        int[] top = new int[n];
        int[] bottom = new int[n];
        
        for (int i = 0; i < n; i++) {
            top[i] = Integer.parseInt(topStr[i]);
            bottom[i] = Integer.parseInt(bottomStr[i]);
        }
        
        // 计算每个位置的间隙 top[i] - bottom[i]，找出最小间隙
        int minGap = Integer.MAX_VALUE;
        for (int i = 0; i < n; i++) {
            int gap = top[i] - bottom[i];
            if (gap < minGap) {
                minGap = gap;
            }
        }
        
        // 如果最小间隙 >= 1，可以施工，最大直径就是最小间隙
        if (minGap >= 1) {
            System.out.println("Yes " + minGap);
        } else {
            // 否则需要削掉 1 - minGap 的高度
            System.out.println("No " + (1 - minGap));
        }
    }
}