/**
 * 1096 大美数
 * 
 * 题目描述：
 * 若正整数 N 可以整除它的 4 个不同正因数之和，则称 N 为"大美数"。
 * 给定多个正整数，判断每个数是否为大美数。
 * 
 * 实现原理：
 * 解题思路：先找出 N 的所有正因数，再枚举所有 4 个不同因数的组合，
 *   检查是否存在一组因数和能被 N 整除。
 * 算法核心逻辑：
 *   1. 遍历 1 到 sqrt(N)，找出所有正因数存入列表
 *   2. 若因数个数少于 4 个，直接返回 false（无法选出 4 个不同因数）
 *   3. 四重循环枚举所有不同因数的组合，计算和 sum
 *   4. 若 sum % N == 0，返回 true
 *   5. 所有组合均不满足则返回 false
 * 时间复杂度：O(√N + C(m,4))，其中 m 为因数个数
 * 空间复杂度：O(m)
 */
import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.util.ArrayList;
import java.util.List;

public class Main {
    public static void main(String[] args) throws IOException {
        BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
        int k = Integer.parseInt(br.readLine());
        String[] parts = br.readLine().split(" ");
        
        // 依次判断每个数是否为"大美数"
        for (int i = 0; i < k; i++) {
            int n = Integer.parseInt(parts[i]);
            System.out.println(isBeautiful(n) ? "Yes" : "No");
        }
    }
    
    // 判断是否是大美数：N 可以整除它的 4 个不同正因数之和
    static boolean isBeautiful(int n) {
        // 先找出所有正因数
        List<Integer> factors = new ArrayList<>();
        for (int i = 1; i <= Math.sqrt(n); i++) {
            if (n % i == 0) {
                factors.add(i);
                // 避免重复添加平方根
                if (i != n / i) {
                    factors.add(n / i);
                }
            }
        }
        
        // 如果因数少于 4 个，无法选出 4 个不同因数，肯定不是大美数
        if (factors.size() < 4) {
            return false;
        }
        
        // 遍历所有 4 个不同因数的组合，判断是否存在和能被 n 整除
        int size = factors.size();
        for (int a = 0; a < size; a++) {
            for (int b = a + 1; b < size; b++) {
                for (int c = b + 1; c < size; c++) {
                    for (int d = c + 1; d < size; d++) {
                        int sum = factors.get(a) + factors.get(b) + factors.get(c) + factors.get(d);
                        if (sum % n == 0) {
                            return true;
                        }
                    }
                }
            }
        }
        
        return false;
    }
}