/**
 * 1062 最简分数
 * 
 * 题目描述：
 * 给定两个正分数 N1/M1 和 N2/M2，以及一个正整数 K，
 * 要求找出所有分母为 K 且值在 (N1/M1, N2/M2) 区间内的最简分数。
 * 最简分数是指分子和分母互质（最大公约数为 1）的分数。
 * 输出按分子从小到大排序。
 * 
 * 实现原理：
 * 解题思路：
 * 1. 先将两个分数统一为分母 K 的形式：比较 N1/M1 和 N2/M2 的大小，确保区间起始小于结束。
 * 2. 计算起始分子 start = N1 * K / M1 + 1（取上整），结束分子 end = N2 * K / M2（若整除则减一取下整）。
 * 3. 遍历 [start, end] 范围内的每个分子 i，用辗转相除法判断 i 与 K 是否互质（gcd(i, K) == 1）。
 * 4. 将所有满足条件的分子按分母 K 格式化为分数并输出。
 * 
 * 算法核心逻辑：通分确定分子范围 → 遍历判断互质 → 输出最简分数。
 * 
 * 时间复杂度：O(K log K)，空间复杂度：O(K)。
 */
import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

public class Main {
    public static void main(String[] args) throws IOException {
        BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
        String[] parts = br.readLine().trim().split("\\s+");

        // 解析第一个分数 N1/M1
        String[] frac1 = parts[0].split("/");
        int n1 = Integer.parseInt(frac1[0]);
        int m1 = Integer.parseInt(frac1[1]);

        // 解析第二个分数 N2/M2
        String[] frac2 = parts[1].split("/");
        int n2 = Integer.parseInt(frac2[0]);
        int m2 = Integer.parseInt(frac2[1]);

        int K = Integer.parseInt(parts[2]); // 指定的分母

        // 确保第一个分数小于第二个分数，否则交换
        if (n1 * m2 > n2 * m1) {
            int tempN = n1, tempM = m1;
            n1 = n2;
            m1 = m2;
            n2 = tempN;
            m2 = tempM;
        }

        List<Integer> result = new ArrayList<>();

        // 计算起始分子：大于 N1/M1 的最小整数（向上取整）
        int start = n1 * K / m1 + 1;
        if (n1 * K % m1 == 0) {
            start = n1 * K / m1 + 1; // 恰好整除时，取下一个整数
        }

        // 计算结束分子：小于 N2/M2 的最大整数（向下取整）
        int end = n2 * K / m2;
        if (n2 * K % m2 == 0) {
            end--; // 恰好整除时，要严格小于 N2/M2
        }

        // 遍历所有候选分子，检查是否与 K 互质
        for (int i = start; i <= end; i++) {
            if (gcd(i, K) == 1) {
                result.add(i);
            }
        }

        // 格式化输出
        StringBuilder sb = new StringBuilder();
        for (int i = 0; i < result.size(); i++) {
            if (i > 0) {
                sb.append(" ");
            }
            sb.append(result.get(i)).append("/").append(K);
        }
        System.out.println(sb.toString());
    }

    // 辗转相除法求最大公约数
    private static int gcd(int a, int b) {
        while (b != 0) {
            int temp = b;
            b = a % b;
            a = temp;
        }
        return a;
    }
}