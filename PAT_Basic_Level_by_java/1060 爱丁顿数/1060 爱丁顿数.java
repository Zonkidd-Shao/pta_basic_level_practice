/**
 * 1060 爱丁顿数
 * 
 * 题目描述：
 * 爱丁顿数 E 是满足"有 E 天骑车距离超过 E 英里"的最大整数 E。
 * 给定 N 天的骑车距离，计算对应的爱丁顿数。
 * 
 * 实现原理：
 * 解题思路：将骑车距离按升序排序后从大到小遍历。
 * 对于第 i 天（从大到小排序后索引为 i），已有 days = N - i 天的距离不小于当前距离。
 * 若当前距离 distances[i] > days，说明至少有 days 天的距离大于 days，则更新 E = days。
 * 继续遍历直到条件不满足为止，最终得到的 E 即为最大爱丁顿数。
 * 
 * 算法核心逻辑：数组降序思维（通过升序后反向遍历）→ 找最大的 E 使 distances[N-E] > E。
 * 
 * 时间复杂度：O(N log N)（排序耗时），空间复杂度：O(N)。
 */
import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.io.IOException;
import java.util.Arrays;

public class Main {
    public static void main(String[] args) throws IOException {
        BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
        int N = Integer.parseInt(br.readLine().trim());
        String[] parts = br.readLine().trim().split("\\s+");
        int[] distances = new int[N];
        for (int i = 0; i < N; i++) {
            distances[i] = Integer.parseInt(parts[i]);
        }

        // 升序排序
        Arrays.sort(distances);

        int E = 0;
        // 从大到小遍历排序后的数组
        for (int i = N - 1; i >= 0; i--) {
            int days = N - i; // 当前及之后共有 days 天（即最大的 days 天）
            if (distances[i] > days) {
                E = days; // 满足条件，更新 E
            } else {
                break; // 一旦不满足，后续更小的距离更不可能满足
            }
        }

        System.out.println(E);
    }
}