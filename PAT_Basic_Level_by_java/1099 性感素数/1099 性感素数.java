/**
 * 1099 性感素数
 * 
 * 题目描述：
 * 若一个素数 p 与 p+6 或 p-6 也都是素数，则 p 称为"性感素数"。
 * 给定一个数，判断它是否为性感素数；若不是，输出大于它的最小性感素数。
 * 
 * 实现原理：
 * 解题思路：先用素数判断函数检测输入数是否为素数，
 *   若是则检查 N-6 和 N+6 是否为素数，找到配对输出；
 *   若不是则从 N+1 开始递增寻找最小性感素数。
 * 算法核心逻辑：
 *   1. 若 N 是素数：
 *      - 若 N-6 > 0 且是素数，输出 "Yes" 和 N-6（取较小配对）
 *      - 否则若 N+6 是素数，输出 "Yes" 和 N+6
 *   2. 若 N 不是素数，或 N 是素数但没有性感配对：
 *      - 从 N+1 开始递增遍历，找到第一个素数 x
 *      - 且满足 x-6 或 x+6 也是素数，输出 x 并结束
 *   素数判断：检查到 sqrt(n)，跳过偶数和 <=1 的数
 * 时间复杂度：O(√N + d√d)，其中 d 为寻找到下一个性感素数的跨度
 * 空间复杂度：O(1)
 */
import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;

public class Main {
    public static void main(String[] args) throws IOException {
        BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
        int n = Integer.parseInt(br.readLine());
        
        if (isPrime(n)) {
            // 先检查 N-6 是否是素数（如果是，输出较小的那个）
            if (n - 6 > 0 && isPrime(n - 6)) {
                System.out.println("Yes");
                System.out.println(n - 6);
                return;
            }
            // 再检查 N+6 是否是素数
            if (isPrime(n + 6)) {
                System.out.println("Yes");
                System.out.println(n + 6);
                return;
            }
        }
        
        // N 不是性感素数，找大于 N 的最小性感素数
        System.out.println("No");
        int x = n + 1;
        while (true) {
            if (isPrime(x)) {
                // 检查 x 是否有性感素数配对（x-6 或 x+6）
                if ((x - 6 > 0 && isPrime(x - 6)) || isPrime(x + 6)) {
                    System.out.println(x);
                    break;
                }
            }
            x++;
        }
    }
    
    // 判断是否为素数
    static boolean isPrime(int n) {
        if (n <= 1) {
            return false;
        }
        if (n == 2) {
            return true;
        }
        if (n % 2 == 0) {
            return false;
        }
        // 只需检查奇数因子到 sqrt(n)
        for (int i = 3; i <= Math.sqrt(n); i += 2) {
            if (n % i == 0) {
                return false;
            }
        }
        return true;
    }
}