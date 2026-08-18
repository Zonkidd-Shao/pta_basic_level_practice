/*
 * 1119 胖达与盆盆奶
 * 
 * 题目描述：
 *     有 N 只胖达排成一排，每只胖达有一个体重。
 *     每只胖达最少喝 200 毫升奶。分配规则：
 *       - 如果一只胖达比旁边的胖达重，则它必须比旁边的胖达多喝至少 100 毫升。
 *       - 体重相同的胖达奶量必须相同。
 *     求满足条件的最小总奶量。
 * 
 * 实现原理：
 *     解题思路：
 *       1. 初始化每只胖达的奶量为 200。
 *       2. 两次遍历（双向贪心）：
 *          (a) 从左到右遍历：若当前胖达比左边重，则奶量至少为左边 + 100；
 *              若与左边等重，则奶量相同。
 *          (b) 从右到左遍历：若当前胖达比右边重，则取 max(当前奶量, 右边 + 100)；
 *              若与右边等重，则取 max(当前奶量, 右边奶量)。
 *       3. 求和输出总奶量。
 *     算法核心逻辑：
 *       - 双向遍历（类似"分发糖果"问题）：左到右保证向右看满足条件，
 *         右到左保证向左看满足条件，取最大值以满足两边的约束。
 *     时间复杂度：O(n)，n 为胖达数量。
 *     空间复杂度：O(n)，用于存储奶量数组。
 */
import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;

public class Main {
    public static void main(String[] args) throws IOException {
        BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
        
        int n = Integer.parseInt(br.readLine());
        String[] weightStr = br.readLine().split(" ");
        int[] weights = new int[n];
        for (int i = 0; i < n; i++) {
            weights[i] = Integer.parseInt(weightStr[i]);
        }
        
        // milk[i] 表示第 i 只胖达的奶量
        int[] milk = new int[n];
        
        // 初始化每只胖达的奶量为 200 毫升（最小值）
        for (int i = 0; i < n; i++) {
            milk[i] = 200;
        }
        
        // 从左到右遍历：保证如果右边比左边重，右边奶量更多
        for (int i = 1; i < n; i++) {
            if (weights[i] > weights[i - 1]) {
                milk[i] = milk[i - 1] + 100;
            } else if (weights[i] == weights[i - 1]) {
                milk[i] = milk[i - 1]; // 等重则奶量相同
            }
            // 比左边轻则维持 200 不变
        }
        
        // 从右到左遍历：保证如果左边比右边重，左边奶量更多
        for (int i = n - 2; i >= 0; i--) {
            if (weights[i] > weights[i + 1]) {
                milk[i] = Math.max(milk[i], milk[i + 1] + 100);
            } else if (weights[i] == weights[i + 1]) {
                milk[i] = Math.max(milk[i], milk[i + 1]); // 等重则取较大值（保持一致）
            }
            // 比右边轻则维持原值
        }
        
        // 计算总奶量
        long total = 0;
        for (int m : milk) {
            total += m;
        }
        
        System.out.println(total);
        br.close();
    }
}
