/*
 * 1102 教超冠军卷
 * 
 * 题目描述：
 *     给定N件商品的编号、单价和销售量，找出：
 *         1. 销量冠军（销售量最高的商品）及其销量。
 *         2. 销售额冠军（销售额 = 单价 × 销售量 最高的商品）及其销售额。
 * 
 * 实现原理：
 *     解题思路：
 *         1. 遍历所有商品，维护两个变量跟踪最大值：
 *            - maxSales：最高销售量
 *            - maxRevenue：最高销售额
 *         2. 对每件商品，计算其销售额 = 单价 × 销售量，注意使用long类型防止溢出。
 *         3. 分别与当前最大值比较并更新。
 *     时间复杂度：O(N)，空间复杂度：O(1)。
 */
import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;

public class Main {
    public static void main(String[] args) throws IOException {
        BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
        int n = Integer.parseInt(br.readLine());
        
        String salesChampId = "";   // 销量冠军的商品编号
        long maxSales = -1;          // 最高销售量
        String revenueChampId = "";  // 销售额冠军的商品编号
        long maxRevenue = -1;        // 最高销售额
        
        for (int i = 0; i < n; i++) {
            String[] parts = br.readLine().split(" ");
            String id = parts[0];
            int price = Integer.parseInt(parts[1]);
            int sales = Integer.parseInt(parts[2]);
            // 计算销售额，使用long防止int乘法溢出
            long revenue = (long) price * sales;
            
            // 更新销量冠军
            if (sales > maxSales) {
                maxSales = sales;
                salesChampId = id;
            }
            
            // 更新销售额冠军
            if (revenue > maxRevenue) {
                maxRevenue = revenue;
                revenueChampId = id;
            }
        }
        
        // 输出结果
        System.out.println(salesChampId + " " + maxSales);
        System.out.println(revenueChampId + " " + maxRevenue);
    }
}
