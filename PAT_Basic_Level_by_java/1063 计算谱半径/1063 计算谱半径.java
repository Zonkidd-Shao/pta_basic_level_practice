/**
 * 1063 计算谱半径
 * 
 * 题目描述：
 * 给定 N 个复特征值的实部和虚部，计算矩阵的谱半径。
 * 谱半径定义为所有特征值的模的最大值，其中模 = sqrt(实部^2 + 虚部^2)。
 * 结果四舍五入保留 2 位小数。
 * 
 * 实现原理：
 * 解题思路：
 * 1. 遍历每组实部 a 和虚部 b，计算模 sqrt(a² + b²)。
 * 2. 记录所有模中的最大值作为谱半径。
 * 3. 使用 System.out.printf 格式化输出，保留两位小数。
 * 
 * 算法核心逻辑：遍历计算模 → 记录最大值 → 格式化输出。
 * 
 * 时间复杂度：O(N)，空间复杂度：O(1)。
 */
import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.io.IOException;

public class Main {
    public static void main(String[] args) throws IOException {
        BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
        int N = Integer.parseInt(br.readLine().trim());

        double maxRadius = 0;
        // 遍历每组特征值，计算模并更新最大值
        for (int i = 0; i < N; i++) {
            String[] parts = br.readLine().trim().split("\\s+");
            int a = Integer.parseInt(parts[0]); // 实部
            int b = Integer.parseInt(parts[1]); // 虚部
            double radius = Math.sqrt(a * a + b * b); // 计算模
            if (radius > maxRadius) {
                maxRadius = radius; // 更新谱半径最大值
            }
        }

        // 四舍五入保留两位小数输出
        System.out.printf("%.2f\n", maxRadius);
    }
}