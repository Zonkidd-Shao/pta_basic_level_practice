/*
 * 1104 天长地久
 * 
 * 题目描述：
 *     "天长地久数"是指一个K位正整数A，满足：
 *         1. A的各位数字之和为m。
 *         2. A+1的各位数字之和为n。
 *         3. m和n的最大公约数g = gcd(m, n)是一个大于2的素数。
 *     给定K和m，找出所有满足条件的K位数A，结果按n递增排序，
 *     n相同则按A递增排序。
 * 
 * 实现原理：
 *     解题思路：
 *         1. 使用DFS生成K位数字的所有排列（首位不能为0）。
 *         2. 剪枝优化：如果当前数字和加上剩余位数的最大可能和（每位9）
 *            仍小于m，或当前数字和已经大于m，则提前回溯。
 *         3. 当生成了完整的K位数后，检查其各位和是否为m。
 *         4. 若是，计算A+1的各位和n，然后计算gcd(m, n)并判断是否为大于2的素数。
 *         5. 符合条件的存入列表，最后按n和A排序输出。
 *     时间复杂度：O(10^K) 但通过剪枝大幅优化。
 *     关键数学性质：当A的末位不是9时，各位和增加1（即n=m+1），
 *       此时gcd(m, m+1)=1，不满足条件（需要>2的素数），
 *       因此A的末位必须是9才能使A+1产生进位，导致n < m。
 */
import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.List;

public class Main {
    static class Result {
        int n;
        long a;
        Result(int n, long a) {
            this.n = n;
            this.a = a;
        }
    }
    
    static List<Result> results;
    static int K;
    static int m;
    
    public static void main(String[] args) throws IOException {
        BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
        int n = Integer.parseInt(br.readLine());
        
        // 处理每组测试用例
        for (int caseNum = 1; caseNum <= n; caseNum++) {
            String[] parts = br.readLine().split(" ");
            K = Integer.parseInt(parts[0]);  // 位数
            m = Integer.parseInt(parts[1]);  // 各位数字之和
            
            results = new ArrayList<>();
            dfs(0, 0, 0);  // 从第0位开始DFS搜索
            
            System.out.println("Case " + caseNum);
            if (results.isEmpty()) {
                System.out.println("No Solution");
            } else {
                // 按n递增序，n相同按A递增序
                Collections.sort(results, new Comparator<Result>() {
                    public int compare(Result r1, Result r2) {
                        if (r1.n != r2.n) {
                            return r1.n - r2.n;
                        }
                        return Long.compare(r1.a, r2.a);
                    }
                });
                for (Result r : results) {
                    System.out.println(r.n + " " + r.a);
                }
            }
        }
    }
    
    // DFS生成K位数字
    // pos: 当前处理的位数（0-indexed）
    // sumOfDigits: 当前数字和
    // num: 当前已生成的数字
    static void dfs(int pos, int sumOfDigits, long num) {
        if (pos == K) {
            // 已生成完整的K位数，检查各位和是否为m
            if (sumOfDigits == m) {
                // 计算A+1的各位数字之和n
                long aPlus1 = num + 1;
                int n = sumOfDigitsOf(aPlus1);
                int g = gcd(m, n);
                // 条件：gcd(m, n)是大于2的素数
                if (isPrime(g) && g > 2) {
                    results.add(new Result(n, num));
                }
            }
            return;
        }
        
        // 剪枝：剩余位数全填9也达不到m，或当前和已超过m，提前返回
        int remaining = K - pos;
        if (sumOfDigits + remaining * 9 < m || sumOfDigits > m) {
            return;
        }
        
        // 首位不能为0，之后各位可为0-9
        int start = (pos == 0) ? 1 : 0;
        for (int d = start; d <= 9; d++) {
            dfs(pos + 1, sumOfDigits + d, num * 10 + d);
        }
    }
    
    // 计算一个数的各位数字之和
    static int sumOfDigitsOf(long x) {
        int sum = 0;
        while (x > 0) {
            sum += x % 10;  // 取末位数字
            x /= 10;        // 去掉末位
        }
        return sum;
    }
    
    // 辗转相除法求最大公约数
    static int gcd(int a, int b) {
        while (b != 0) {
            int temp = b;
            b = a % b;
            a = temp;
        }
        return a;
    }
    
    // 判断素数
    static boolean isPrime(int n) {
        if (n <= 1) {
            return false;
        }
        if (n == 2) {
            return true;
        }
        if (n % 2 == 0) {
            return false;  // 偶数排除
        }
        // 只需检查奇数因子，上限为sqrt(n)
        for (int i = 3; i <= Math.sqrt(n); i += 2) {
            if (n % i == 0) {
                return false;
            }
        }
        return true;
    }
}
