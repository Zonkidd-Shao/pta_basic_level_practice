/*
 * 1114 全素日
 * 
 * 题目描述：
 *     给定一个 8 位数字的日期字符串（如 "2023-01-01" 格式的 8 位数字，
 *     实际上输入是连续 8 位数字），从长度为 8 递减到长度为 1，
 *     分别取以最后一位结尾的后缀子串，判断每个子串对应的数字是否为素数。
 *     如果所有子串都是素数，则输出 "All Prime!"。
 * 
 * 实现原理：
 *     解题思路：
 *       1. 从长度 len = 8 递减到 1，取 date.substring(8 - len) 作为后缀子串。
 *       2. 将子串解析为 long 型整数，调用素数判断函数。
 *       3. 如果所有子串都是素数，最后输出 "All Prime!"。
 *     算法核心逻辑：
 *       - 素数判断：排除 1 及以下的非素数，2 是素数，偶数 >2 都不是素数，
 *         然后从 3 开始只检查奇数因子，上限为 sqrt(n)。
 *     时间复杂度：O(n * sqrt(M))，n=8 为固定长度，M 为最大数值。
 *     空间复杂度：O(1)。
 */
import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;

public class Main {
    public static void main(String[] args) throws IOException {
        BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
        
        String date = br.readLine();
        
        boolean allPrime = true;

        // 从长度 8 递减到 1，依次取以最后一位结尾的后缀子串
        for (int len = date.length(); len >= 1; len--) {
            String subStr = date.substring(date.length() - len);
            long num = Long.parseLong(subStr);
            
            boolean isPrime = isPrime(num);
            
            System.out.println(subStr + " " + (isPrime ? "Yes" : "No"));

            if (!isPrime) {
                allPrime = false;
            }
        }

        if (allPrime) {
            System.out.println("All Prime!");

        }

        br.close();
    }
    
    /**
     * 判断一个数是否为素数
     * @param n 待判断的数
     * @return true 表示是素数，false 表示不是
     */
    private static boolean isPrime(long n) {
        if (n <= 1) {
            return false; // 1 及以下的数不是素数
        }
        if (n == 2) {
            return true; // 2 是素数
        }
        if (n % 2 == 0) {
            return false; // 偶数（除 2 外）不是素数
        }
        // 只检查奇数因子，上限为 sqrt(n)
        for (long i = 3; i * i <= n; i += 2) {
            if (n % i == 0) {
                return false;
            }
        }
        return true;
    }
}
