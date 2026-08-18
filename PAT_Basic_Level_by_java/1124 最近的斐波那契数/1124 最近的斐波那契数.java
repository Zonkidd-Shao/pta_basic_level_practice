/*
 * 1124 最近的斐波那契数
 * 
 * 题目描述：
 *     给定一个正整数 n，找出与 n 最近的斐波那契数。
 *     如果距离相等，则输出较小的那个。
 *     斐波那契数列定义为：F0 = 0, F1 = 1, Fn = F(n-1) + F(n-2)。
 * 
 * 实现原理：
 *     解题思路：
 *       1. 从 F0=0, F1=1 开始，不断生成下一个斐波那契数，直到 b >= n。
 *       2. 此时 a < n <= b，a 和 b 是 n 前后最近的斐波那契数。
 *       3. 分别计算 n 到 a 和 b 的距离，选择距离更近的。
 *       4. 如果距离相等，选择较小的 a。
 *     算法核心逻辑：
 *       - 迭代法生成斐波那契数列，无需存储整个数列。
 *     时间复杂度：O(log n)，斐波那契数列以指数增长。
 *     空间复杂度：O(1)。
 */
import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;

public class Main {
    public static void main(String[] args) throws IOException {
        BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
        
        int n = Integer.parseInt(br.readLine());
        
        // 生成斐波那契数列，直到超过 n
        long a = 0; // F0
        long b = 1; // F1
        
        // 如果 n 是 0，直接返回 0
        if (n == 0) {
            System.out.println(0);
            br.close();
            return;
        }
        
        // 不断生成下一个斐波那契数，直到 b >= n
        while (b < n) {
            long next = a + b;
            a = b;
            b = next;
        }
        
        // 此时 a < n <= b
        // 比较 n 到 a 和 b 的距离，选择更近的
        long diffA = n - a;
        long diffB = b - n;
        
        if (diffA < diffB) {
            System.out.println(a); // a 更近
        } else if (diffB < diffA) {
            System.out.println(b); // b 更近
        } else {
            System.out.println(a); // 距离相等，输出较小的 a
        }
        
        br.close();
    }
}
