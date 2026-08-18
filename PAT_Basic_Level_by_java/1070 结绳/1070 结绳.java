import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.io.IOException;
import java.util.Arrays;

/**
 * 1070 结绳
 *
 * 题目描述：
 * 给定N段绳子的长度，每次可以将两段绳子串连成一段，串连后新绳子的长度为
 * 两段绳子长度之和的一半。要求将N段绳子全部串连成一条绳子，求最终绳子的
 * 最大可能长度（向下取整）。
 *
 * 实现原理：
 * 解题思路：
 * 1. 每次串连操作都会使两段绳子长度之和减半，因此越早参与串连的绳子
 *    被折减的次数越多，最终贡献越小
 * 2. 采用贪心策略：将绳子按长度从小到大排序，短的绳子先串连（被多折减），
 *    长的绳子后串连（被少折减），从而最大化最终长度
 * 3. 数学上，排序后从小到大依次串连得到的最终长度是最大的
 *
 * 算法核心逻辑：
 * - 先对绳子长度数组进行升序排序
 * - 初始化result为最短绳子长度
 * - 从第二短到最长，依次执行 result = (result + ropes[i]) / 2.0
 * - 最终结果向下取整输出
 *
 * 时间复杂度：O(N log N)，排序为瓶颈
 * 空间复杂度：O(N)，存储绳子长度数组
 */
public class Main {
    public static void main(String[] args) throws IOException {
        BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
        int N = Integer.parseInt(br.readLine().trim());
        String[] parts = br.readLine().trim().split("\\s+");
        int[] ropes = new int[N];
        for (int i = 0; i < N; i++) {
            ropes[i] = Integer.parseInt(parts[i]);
        }

        Arrays.sort(ropes);  // 升序排序，短的绳子先串连

        // 贪心策略：从最短的绳子开始，依次串连
        double result = ropes[0];  // 从第一段最短绳子开始
        for (int i = 1; i < N; i++) {
            // 每次串连，新长度 = (当前长度 + 下一段绳子长度) / 2
            result = (result + ropes[i]) / 2.0;
        }

        System.out.println((int) Math.floor(result));  // 向下取整输出
    }
}
