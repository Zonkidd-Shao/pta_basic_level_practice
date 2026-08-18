/**
 * 1091 N-自守数
 * 
 * 题目描述：
 * 如果某个数 K 的平方乘以 N 以后，结果的末尾几位数等于 K，
 * 那么就称这个数为"N-自守数"。给定 K，求最小的 N（1 ≤ N < 10）
 * 使得 N×K² 的末尾几位等于 K。
 * 
 * 实现原理：
 * 解题思路：计算 K 的位数 len，模数 mod = 10^len，枚举 N 从 1 到 9，
 *   检查 N×K² 对 mod 取模的结果是否等于 K。
 * 算法核心逻辑：
 *   1. 计算 K 的位数 len，并计算 mod = 10^len（用于取末尾几位）
 *   2. 循环 N 从 1 到 9，计算 result = N * K * K
 *   3. 若 result % mod == K，则找到解，输出 N 和 result
 *   4. 若 1~9 均不满足，输出 "No"
 * 时间复杂度：O(M)，其中 M 为待检测数字个数（每个数字最多检测 9 次）
 * 空间复杂度：O(1)
 */
import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;

public class Main {
    public static void main(String[] args) throws IOException {
        BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
        int m = Integer.parseInt(br.readLine());
        String[] parts = br.readLine().split(" ");
        
        // 依次处理每个数字 K
        for (int i = 0; i < m; i++) {
            int k = Integer.parseInt(parts[i]);
            // 计算 K 的位数
            int len = String.valueOf(k).length();
            // 计算模数 10^len，用于截取末尾 len 位
            int mod = 1;
            for (int j = 0; j < len; j++) {
                mod *= 10;
            }
            
            // 枚举 N 从 1 到 9，寻找满足条件的 N
            boolean found = false;
            for (int n = 1; n < 10; n++) {
                int result = n * k * k;
                // 检查 result 的末尾 len 位是否等于 K
                if (result % mod == k) {
                    System.out.println(n + " " + result);
                    found = true;
                    break;
                }
            }
            
            // 未找到则输出 No
            if (!found) {
                System.out.println("No");
            }
        }
    }
}