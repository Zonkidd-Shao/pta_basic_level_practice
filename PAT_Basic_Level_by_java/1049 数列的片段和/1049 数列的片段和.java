/**
 * 1049 数列的片段和
 * 
 * 题目描述：
 * 给定一个正数数列，我们可以从中截取任意连续的片段（称为片段），
 * 每个片段包含数列中连续的一部分数。例如，给定数列 {0.1, 0.2, 0.3, 0.4}，
 * 所有连续片段共有 10 个。现求所有连续片段中各数字之和的总和。
 * 
 * 实现原理：
 * 解题思路：
 * 1. 统计每个元素在所有连续子段中出现的次数。
 * 2. 对于位置 i（下标从 0 开始）的元素 a[i]：
 *    - 左端点的选择范围：0 到 i，共 (i+1) 种
 *    - 右端点的选择范围：i 到 n-1，共 (n-i) 种
 *    - 因此 a[i] 出现在 (i+1) × (n-i) 个连续子段中
 * 3. 总和 = Σ a[i] × (i+1) × (n-i)
 * 
 * 核心思想：组合数学中的乘法原理，直接计算每个元素对总和的贡献，
 * 避免枚举所有子段（O(n²)），实现 O(n) 时间的高效算法。
 * 
 * 时间复杂度：O(n)，空间复杂度：O(1)
 * 注意事项：需使用 double 类型保证精度，结果保留 2 位小数。
 */
import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.io.IOException;

public class Main {
    public static void main(String[] args) throws IOException {
        BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
        int n = Integer.parseInt(br.readLine().trim());
        String[] parts = br.readLine().trim().split("\\s+");
        double sum = 0;
        for (int i = 0; i < n; i++) {
            double v = Double.parseDouble(parts[i]);
            // a[i] 出现在 (i+1)*(n-i) 个连续子段中，累加其贡献
            sum += v * (i + 1) * (n - i);
        }
        System.out.printf("%.2f\n", sum);
    }
}
