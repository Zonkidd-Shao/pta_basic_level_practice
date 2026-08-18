import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.io.IOException;
import java.util.HashSet;
import java.util.Set;

/**
 * 1087 有多少不同的值
 * 
 * 题目描述：
 * 对于给定的正整数 N，计算当 n 从 1 到 N 时，算式 floor(n/2) + floor(n/3) + floor(n/5)
 * 的不同值的个数。其中 floor(x) 表示对 x 向下取整（即整数除法）。
 * 
 * 实现原理：
 * 解题思路：
 * - 遍历 n 从 1 到 N，计算每个 n 对应的算式值
 * - 利用 HashSet 自动去重的特性，存储所有计算出的值
 * - 最后输出 HashSet 的大小即为不同值的个数
 * 
 * 算法核心逻辑：
 * - Java 中整数除法自动向下取整，符合 floor 要求
 * - HashSet 保证元素唯一性，size() 输出不同值的数量
 * 
 * 时间复杂度：O(N)，需遍历 1 到 N 的所有整数
 * 空间复杂度：O(N)，最坏情况下所有值均不同，Set 中存储 N 个元素
 */
public class Main {
    public static void main(String[] args) throws IOException {
        BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
        int N = Integer.parseInt(br.readLine().trim());
        
        Set<Integer> set = new HashSet<>();
        
        // 遍历 n 从 1 到 N，计算结果并用 HashSet 去重
        for (int n = 1; n <= N; n++) {
            int val = n / 2 + n / 3 + n / 5;
            set.add(val);
        }
        
        // 输出不同值的个数
        System.out.println(set.size());
    }
}
