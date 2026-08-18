/**
 * 1092 最好吃的月饼
 * 
 * 题目描述：
 * 给出各城市多种月饼的销量数据，统计每种月饼的总销量，
 * 找出销量最大的月饼，并输出所有达到最大销量的月饼编号。
 * 
 * 实现原理：
 * 解题思路：用一维数组累加每种月饼在各城市的销量，
 *   遍历找出最大销量值，再遍历收集所有达到该值的月饼编号。
 * 算法核心逻辑：
 *   1. 创建长度为 n+1 的数组 sales，sales[j] 表示第 j 种月饼的总销量
 *   2. 逐行读取 m 个城市的销量数据，累加到 sales 数组对应位置
 *   3. 遍历 sales 找出最大值 maxSales
 *   4. 再次遍历，收集所有 sales[i] == maxSales 的月饼编号
 *   5. 输出 maxSales，第二行输出所有销量最大的月饼编号（空格分隔）
 * 时间复杂度：O(m×n)，其中 m 为城市数，n 为月饼种类数
 * 空间复杂度：O(n)
 */
import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.util.ArrayList;
import java.util.List;

public class Main {
    public static void main(String[] args) throws IOException {
        BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
        String[] firstLine = br.readLine().split(" ");
        int n = Integer.parseInt(firstLine[0]);
        int m = Integer.parseInt(firstLine[1]);
        
        // 统计每种月饼的总销量，下标从 1 开始
        int[] sales = new int[n + 1];
        
        // 逐行读取每个城市的销量数据并累加
        for (int i = 0; i < m; i++) {
            String[] parts = br.readLine().split(" ");
            for (int j = 0; j < n; j++) {
                sales[j + 1] += Integer.parseInt(parts[j]);
            }
        }
        
        // 找出最大销量值
        int maxSales = 0;
        for (int i = 1; i <= n; i++) {
            if (sales[i] > maxSales) {
                maxSales = sales[i];
            }
        }
        
        // 收集所有销量达到最大值的月饼编号
        List<Integer> winners = new ArrayList<>();
        for (int i = 1; i <= n; i++) {
            if (sales[i] == maxSales) {
                winners.add(i);
            }
        }
        
        // 输出结果
        System.out.println(maxSales);
        for (int i = 0; i < winners.size(); i++) {
            if (i > 0) {
                System.out.print(" ");
            }
            System.out.print(winners.get(i));
        }
        System.out.println();
    }
}