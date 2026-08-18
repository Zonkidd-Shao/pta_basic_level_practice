/*
 * 1117 数字之王
 * 
 * 题目描述：
 *     给定区间 [n1, n2]，对区间内的每个整数执行变换：
 *       1. 将该数的各位数字分别立方，然后将所有立方值相乘。
 *       2. 将乘积的各位数字相加，得到一个新的数。
 *       3. 重复上述过程，直到该数变为一位数（0~9）。
 *     统计最终得到的一位数字的出现次数，输出最大出现次数
 *     以及所有达到该次数的数字。
 * 
 * 实现原理：
 *     解题思路：
 *       1. 遍历区间 [n1, n2] 内的每个数。
 *       2. 对每个数循环执行 transform 函数，直到结果 < 10。
 *       3. 用 count[10] 数组统计每个数字出现的次数。
 *       4. 找出最大次数，输出所有达到该次数的数字。
 *     算法核心逻辑：
 *       - transform 函数分两步：
 *         (a) 各位数字立方相乘（若有数字 0，乘积直接为 0）。
 *         (b) 将乘积的各位数字求和。
 *     时间复杂度：O((n2-n1+1) * log(num))，每个数的变换次数约为 log 级别。
 *     空间复杂度：O(1)。
 */
import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.util.ArrayList;
import java.util.List;

public class Main {
    public static void main(String[] args) throws IOException {
        BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
        
        String[] parts = br.readLine().split(" ");
        int n1 = Integer.parseInt(parts[0]);
        int n2 = Integer.parseInt(parts[1]);
        
        // count[i] 统计最终结果为 i 的个数（i 为 0~9 的一位数字）
        int[] count = new int[10];
        
        // 对区间内每个数进行变换，直到变为一位数
        for (int i = n1; i <= n2; i++) {
            int num = i;
            while (num >= 10) {
                num = transform(num);
            }
            count[num]++;
        }
        
        // 找出最大出现次数
        int maxCount = 0;
        for (int i = 0; i < 10; i++) {
            if (count[i] > maxCount) {
                maxCount = count[i];
            }
        }
        
        // 收集所有出现次数等于 maxCount 的数字
        List<Integer> kings = new ArrayList<>();
        for (int i = 0; i < 10; i++) {
            if (count[i] == maxCount) {
                kings.add(i);
            }
        }
        
        // 输出结果
        System.out.println(maxCount);
        for (int i = 0; i < kings.size(); i++) {
            if (i > 0) {
                System.out.print(" ");
            }
            System.out.print(kings.get(i));
        }
        System.out.println();
        
        br.close();
    }
    
    /**
     * 变换函数：各位数字的立方相乘，再将结果的各位数字求和
     * @param num 待变换的整数
     * @return 变换后的结果
     */
    private static int transform(int num) {
        // 第一步：各位数字的立方相乘
        int product = 1;
        boolean hasZero = false;
        
        int temp = num;
        while (temp > 0) {
            int digit = temp % 10;
            if (digit == 0) {
                hasZero = true; // 标记是否有 0 出现
            }
            int cube = digit * digit * digit; // 数字的立方
            product *= cube;
            temp /= 10;
        }
        
        // 如果某一位是 0，乘积就是 0（因为 0 的立方为 0）
        if (hasZero) {
            product = 0;
        }
        
        // 第二步：将乘积的各位数字求和
        int sum = 0;
        if (product == 0) {
            sum = 0;
        } else {
            temp = product;
            while (temp > 0) {
                sum += temp % 10;
                temp /= 10;
            }
        }
        
        return sum;
    }
}
