/*
 * 1120 买地攻略
 * 
 * 题目描述：
 *     给定 N 块连续的土地价格，预算为 M 元。
 *     求有多少种不同的购买方案（购买连续的一段土地，总价不超过 M）。
 * 
 * 实现原理：
 *     解题思路：
 *       1. 使用滑动窗口（双指针）法。
 *       2. 右指针 right 从左到右扩展窗口，累加价格。
 *       3. 当窗口总和超过 M 时，移动左指针 left 缩小窗口直到总和 ≤ M。
 *       4. 对于每个右端点 right，以 right 结尾的满足条件的子数组数量为
 *          (right - left + 1)，累加到计数中。
 *     算法核心逻辑：
 *       - 滑动窗口 + 前缀和思想。固定右端，调整左端使窗口合法，
 *         窗口内所有以 right 结尾的子数组都满足条件。
 *     时间复杂度：O(n)，每个元素最多被访问两次（左右指针各一次）。
 *     空间复杂度：O(1)，仅使用常数级额外空间。
 */
import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;

public class Main {
    public static void main(String[] args) throws IOException {
        BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
        
        // 读取 N（土地块数）和 M（预算）
        String[] firstLine = br.readLine().split(" ");
        int n = Integer.parseInt(firstLine[0]);
        long m = Long.parseLong(firstLine[1]);
        
        // 读取 N 块土地的价格
        String[] priceStr = br.readLine().split(" ");
        int[] prices = new int[n];
        for (int i = 0; i < n; i++) {
            prices[i] = Integer.parseInt(priceStr[i]);
        }
        
        // 滑动窗口法统计所有总价不超过 M 的连续子数组个数
        long count = 0;
        long currentSum = 0;
        int left = 0; // 窗口左边界
        
        for (int right = 0; right < n; right++) {
            currentSum += prices[right]; // 扩展窗口
            
            // 当窗口总和超过 M 时，移动左指针缩小窗口
            while (currentSum > m && left <= right) {
                currentSum -= prices[left];
                left++;
            }
            
            // 以 right 结尾的满足条件的连续子数组个数 = right - left + 1
            count += (right - left + 1);
        }
        
        System.out.println(count);
        br.close();
    }
}
