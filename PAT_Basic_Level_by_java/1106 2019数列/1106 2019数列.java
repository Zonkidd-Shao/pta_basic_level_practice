/*
 * 1106 2019数列
 * 
 * 题目描述：
 *     把数字2、0、1、9作为数列的前4项，从第5项开始，
 *     每一项都是它前面4项之和的个位数字。
 *     输出这个数列的前N项（连成一个数字字符串）。
 * 
 * 实现原理：
 *     解题思路：
 *         1. 初始化数组前4项为2、0、1、9。
 *         2. 从第5项（索引4）开始，每一项 = (前四项之和) % 10。
 *         3. 使用StringBuilder将所有数字拼接后输出。
 *     时间复杂度：O(N)，空间复杂度：O(N)。
 */
import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;

public class Main {
    public static void main(String[] args) throws IOException {
        BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
        int n = Integer.parseInt(br.readLine());
        
        int[] seq = new int[n];
        // 前4项固定为2、0、1、9
        seq[0] = 2;
        if (n >= 2) seq[1] = 0;
        if (n >= 3) seq[2] = 1;
        if (n >= 4) seq[3] = 9;
        
        // 从第5项开始递推：每一项等于前四项之和的个位数字
        for (int i = 4; i < n; i++) {
            seq[i] = (seq[i-1] + seq[i-2] + seq[i-3] + seq[i-4]) % 10;
        }
        
        // 将数列拼接成字符串输出
        StringBuilder sb = new StringBuilder();
        for (int i = 0; i < n; i++) {
            sb.append(seq[i]);
        }
        System.out.println(sb.toString());
    }
}
