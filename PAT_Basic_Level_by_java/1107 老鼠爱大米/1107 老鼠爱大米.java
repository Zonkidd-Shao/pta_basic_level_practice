/*
 * 1107 老鼠爱大米
 * 
 * 题目描述：
 *     N个小组，每组M只老鼠，每只老鼠有一个体重值。
 *     找出每组中体重最重的老鼠（组冠军），再找出所有组冠军中
 *     体重最重的老鼠（总冠军）。
 * 
 * 实现原理：
 *     解题思路：
 *         1. 遍历N个组，对每个组遍历M只老鼠，找出该组最大体重。
 *         2. 将每组最大体重存入数组，同时更新全局最大值。
 *         3. 先输出各组冠军的体重值，再输出总冠军的体重值。
 *     时间复杂度：O(N × M)，空间复杂度：O(N)。
 */
import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;

public class Main {
    public static void main(String[] args) throws IOException {
        BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
        String[] firstLine = br.readLine().split(" ");
        int n = Integer.parseInt(firstLine[0]);  // 组数
        int m = Integer.parseInt(firstLine[1]);  // 每组老鼠数量
        
        int[] groupChamps = new int[n];  // 存储每组冠军的体重
        int overallMax = 0;              // 总冠军的体重
        
        for (int i = 0; i < n; i++) {
            String[] parts = br.readLine().split(" ");
            int max = 0;  // 当前组的最大体重
            for (int j = 0; j < m; j++) {
                int weight = Integer.parseInt(parts[j]);
                if (weight > max) {
                    max = weight;
                }
            }
            groupChamps[i] = max;  // 记录组冠军体重
            // 更新总冠军体重
            if (max > overallMax) {
                overallMax = max;
            }
        }
        
        // 输出各组冠军的体重值，空格分隔
        for (int i = 0; i < n; i++) {
            if (i > 0) {
                System.out.print(" ");
            }
            System.out.print(groupChamps[i]);
        }
        System.out.println();
        
        // 输出总冠军的体重值
        System.out.println(overallMax);
    }
}
