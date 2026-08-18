/**
 * 1064 朋友数
 * 
 * 题目描述：
 * 如果两个数的各位数字之和相同，则称这两个数互为"朋友数"，该和称为"朋友证号"。
 * 给定 N 个正整数，统计其中所有不同的朋友证号，并按升序输出。
 * 
 * 实现原理：
 * 解题思路：
 * 1. 对每个数，通过不断取余和整除 10 的方式计算其各位数字之和。
 * 2. 用 HashSet 存储所有不同的朋友证号，自动去重。
 * 3. 将结果转为 List 后排序，按格式输出个数和具体数值。
 * 
 * 算法核心逻辑：逐数计算各位和 → HashSet 去重 → 排序输出。
 * 
 * 时间复杂度：O(N * log₁₀(maxNum))，空间复杂度：O(N)。
 */
import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Collections;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

public class Main {
    public static void main(String[] args) throws IOException {
        BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
        int N = Integer.parseInt(br.readLine().trim());
        String[] parts = br.readLine().trim().split("\\s+");

        // 用集合存储不同的朋友证号（自动去重）
        Set<Integer> friendIds = new HashSet<>();
        for (int i = 0; i < N; i++) {
            int num = Integer.parseInt(parts[i]);
            int sum = 0;
            // 计算各位数字之和
            while (num > 0) {
                sum += num % 10; // 取个位
                num /= 10;       // 去掉个位
            }
            friendIds.add(sum);
        }

        // 排序
        List<Integer> sortedIds = new ArrayList<>(friendIds);
        Collections.sort(sortedIds);

        // 输出：第一行为个数，第二行为升序序列
        System.out.println(sortedIds.size());
        StringBuilder sb = new StringBuilder();
        for (int i = 0; i < sortedIds.size(); i++) {
            if (i > 0) {
                sb.append(" ");
            }
            sb.append(sortedIds.get(i));
        }
        System.out.println(sb.toString());
    }
}