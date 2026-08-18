/**
 * 1094 谷歌的招聘
 * 
 * 题目描述：
 * 在一个长度为 L 的数字串中，找出最早出现的长度为 K 的连续数字（素数），
 * 如果不存在这样的素数，输出 404。
 * 
 * 实现原理：
 * 解题思路：遍历数字串的所有长度为 K 的连续子串，
 *   将其转换为长整型并判断是否为素数，找到第一个素数即输出。
 * 算法核心逻辑：
 *   1. 外层循环 i 从 0 到 L-K，截取子串 N.substring(i, i+K)
 *   2. 将子串转为 long 型数值，调用 isPrime() 判断是否为素数
 *   3. 若为素数则输出该子串（保持原始数字串中的形式，含前导零），结束
 *   4. 若遍历结束未找到素数，输出 "404"
 *   素数判断优化：只需检查到 sqrt(n)，且跳过偶数以提升效率
 * 时间复杂度：O(L×√K)，其中 L 为数字串长度
 * 空间复杂度：O(1)
 */
import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;

public class Main {
    public static void main(String[] args) throws IOException {
        BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
        
        String[] firstLine = br.readLine().split(" ");
        int L = Integer.parseInt(firstLine[0]);
        int K = Integer.parseInt(firstLine[1]);
        String N = br.readLine();
        
        boolean found = false;
        
        // 遍历所有可能的起始位置，截取长度为 K 的连续子串
        for (int i = 0; i <= L - K; i++) {
            // 取出 K 位连续数字（包括前导零，保持原样输出）
            String sub = N.substring(i, i + K);
            
            // 转换为长整型进行素数判断
            long num = Long.parseLong(sub);
            
            if (isPrime(num)) {
                System.out.println(sub);
                found = true;
                break;
            }
        }
        
        // 未找到 K 位素数
        if (!found) {
            System.out.println("404");
        }
    }
    
    // 判断一个数是否为素数
    private static boolean isPrime(long n) {
        // 1 及以下的数不是素数
        if (n <= 1) {
            return false;
        }
        // 2 是素数
        if (n == 2) {
            return true;
        }
        // 偶数（除 2 外）不是素数
        if (n % 2 == 0) {
            return false;
        }
        
        // 只需检查奇数因子到 sqrt(n) 即可
        for (long i = 3; i * i <= n; i += 2) {
            if (n % i == 0) {
                return false;
            }
        }
        
        return true;
    }
}