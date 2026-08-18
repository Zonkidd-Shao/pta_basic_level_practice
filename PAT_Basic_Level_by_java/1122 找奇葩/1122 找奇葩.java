/*
 * 1122 找奇葩
 * 
 * 题目描述：
 *     给定 N 个整数，其中只有一个奇数出现奇数次，其他奇数都出现偶数次，
 *     偶数可能出现任意次。找出这个出现奇数次的奇数。
 * 
 * 实现原理：
 *     解题思路：
 *       1. 只对奇数进行异或运算。
 *       2. 利用异或的性质：a ^ a = 0，a ^ 0 = a。
 *       3. 出现偶数次的奇数异或后抵消为 0，
 *          出现奇数次的奇数异或后保留自身。
 *     算法核心逻辑：
 *       - 异或运算（XOR）：对所有奇数执行 result ^= num，
 *         最终结果即为出现奇数次的奇数。
 *     时间复杂度：O(n)，n 为整数个数。
 *     空间复杂度：O(1)。
 */
import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;

public class Main {
    public static void main(String[] args) throws IOException {
        BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
        
        int n = Integer.parseInt(br.readLine());
        String[] nums = br.readLine().split(" ");
        
        // 只对奇数进行异或运算
        // 利用异或的性质：一个数异或偶数次结果为 0，异或奇数次结果为自身
        int result = 0;
        for (int i = 0; i < n; i++) {
            int num = Integer.parseInt(nums[i]);
            // 只考虑奇数
            if (num % 2 == 1) {
                result ^= num;
            }
        }
        
        System.out.println(result);
        br.close();
    }
}
