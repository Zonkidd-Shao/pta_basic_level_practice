/*
 * 题目编号：1022 D进制的A+B
 * 题目描述：输入两个非负十进制整数A和B（≤2^30-1）以及一个进制D（1<D≤10），
 *   输出A+B的D进制数。
 * 实现原理：
 *   解题思路：先用long类型计算A+B的和，然后使用"除基取余法"转换为D进制数。
 *   - 如果和为0，直接输出0。
 *   - 否则循环：每次取sum % D作为当前位（最低位），sum /= D，直到sum为0。
 *   - 由于每次取到的是低位到高位的顺序，最后需要反转字符串得到正确结果。
 * 时间复杂度：O(log_D(A+B))，即转换后的D进制数的位数。
 * 空间复杂度：O(log_D(A+B))，用于存储转换结果的字符串。
 */
import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.io.IOException;

/**
 * 1022 D进制的A+B
 * 输出 A+B 的 D 进制数（1 < D <= 10，A、B <= 2^30-1）。
 */
public class Main {
    public static void main(String[] args) throws IOException {
        BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
        String[] parts = br.readLine().trim().split("\\s+");
        long a = Long.parseLong(parts[0]);
        long b = Long.parseLong(parts[1]);
        int d = Integer.parseInt(parts[2]);
        long sum = a + b;
        // 如果和为0，直接输出0
        if (sum == 0) {
            System.out.println(0);
            return;
        }
        // 除基取余法：将十进制数转换为D进制数
        StringBuilder sb = new StringBuilder();
        while (sum > 0) {
            sb.append((int) (sum % d));  // 取余数作为当前最低位
            sum /= d;                     // 除以基数
        }
        // 反转得到正确的D进制表示（高位在前）
        System.out.println(sb.reverse().toString());
    }
}