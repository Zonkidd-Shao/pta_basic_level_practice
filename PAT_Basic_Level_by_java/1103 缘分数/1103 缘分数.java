/*
 * 1103 缘分数
 * 
 * 题目描述：
 *     所谓"缘分数"是指存在正整数a和b，满足：
 *         a^3 - (a-1)^3 = c^2  且  b^2 + (b-1)^2 = c
 *     在给定区间[m, n]内找出所有满足条件的a及对应的b，并按a递增输出。
 * 
 * 实现原理：
 *     解题思路：
 *         1. 对区间内的每个a，计算 c^2 = a^3 - (a-1)^3 = 3a^2 - 3a + 1。
 *         2. 判断c^2是否为完全平方数，即c是否为整数。若不是则跳过。
 *         3. 已知c后，需要找b使得 b^2 + (b-1)^2 = c。
 *            展开得 2b^2 - 2b + 1 = c，即 2b^2 - 2b + (1-c) = 0。
 *            使用一元二次方程求根公式：
 *                b = [2 + sqrt(4 - 8(1-c))] / 4 = [2 + sqrt(8c - 4)] / 4
 *         4. 判断判别式是否为完全平方数，且b为正整数，则输出。
 *     时间复杂度：O(n - m)，空间复杂度：O(1)。
 */
import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;

public class Main {
    public static void main(String[] args) throws IOException {
        BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
        String[] parts = br.readLine().split(" ");
        int m = Integer.parseInt(parts[0]);
        int n = Integer.parseInt(parts[1]);
        
        boolean found = false;  // 是否找到至少一组解
        
        for (int a = m; a <= n; a++) {
            // 计算 a^3 - (a-1)^3 = 3a^2 - 3a + 1，即c^2
            long cSquare = 3L * a * a - 3L * a + 1;
            
            // 判断c^2是否是完全平方数，即c是否为整数
            long c = (long) Math.sqrt(cSquare);
            if (c * c != cSquare) {
                continue;  // c不是整数，跳过
            }
            
            // 由 b^2 + (b-1)^2 = c 展开得 2b^2 - 2b + 1 = c
            // 整理得 2b^2 - 2b + (1-c) = 0
            // 由求根公式：b = [2 + sqrt(4 - 8(1-c))] / 4 = [2 + sqrt(8c - 4)] / 4
            // 计算判别式 Δ = 8c - 4
            long discriminant = 8 * c - 4;
            long sqrtDisc = (long) Math.sqrt(discriminant);
            // 判别式必须为完全平方数
            if (sqrtDisc * sqrtDisc != discriminant) {
                continue;
            }
            
            // b 必须为正整数，即 (2 + sqrtDisc) 能被4整除
            if ((2 + sqrtDisc) % 4 != 0) {
                continue;
            }
            
            long b = (2 + sqrtDisc) / 4;
            if (b > 0) {
                System.out.println(a + " " + b);
                found = true;
            }
        }
        
        if (!found) {
            System.out.println("No Solution");
        }
    }
}
