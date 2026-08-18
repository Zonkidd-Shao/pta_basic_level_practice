/**
 * 1056 组合数的和
 * 
 * 题目描述：
 * 给定 N 个非 0 的个位数字，用其中任意 2 个数字都可以组合成 1 个 2 位数。
 * 要求所有可能组合出来的 2 位数的和。
 * 
 * 实现原理：
 * 解题思路：每个数字在十位出现 (N-1) 次，在个位也出现 (N-1) 次。
 * 例如，数字 d 在十位时贡献为 d * 10 * (N-1)，在个位时贡献为 d * 1 * (N-1)，
 * 因此每个数字的总贡献为 d * 11 * (N-1)。所有数字的贡献之和即为答案。
 * 
 * 算法核心逻辑：先累加所有数字之和 sum，然后输出 sum * 11 * (N-1)。
 * 
 * 时间复杂度：O(N)，空间复杂度：O(1)。
 */
import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.io.IOException;

public class Main {
    public static void main(String[] args) throws IOException {
        BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
        // 读取一行输入，按空白字符分割
        String[] parts = br.readLine().trim().split("\\s+");
        int N = Integer.parseInt(parts[0]); // 第一个数字是 N
        int sum = 0;
        // 累加所有给定的个位数字
        for (int i = 1; i <= N; i++) {
            int digit = Integer.parseInt(parts[i]);
            sum += digit;
        }
        // 每个数字在十位和个位各出现 (N-1) 次，总贡献为 sum * 11 * (N-1)
        System.out.println(sum * 11 * (N - 1));
    }
}