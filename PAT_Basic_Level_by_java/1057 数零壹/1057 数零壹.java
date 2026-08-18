/**
 * 1057 数零壹
 * 
 * 题目描述：
 * 给定一串长度不超过 10^5 的字符串，将字符串中所有英文字母的序号（字母 a-z 对应 1-26，
 * 不分大小写）相加得到总和 N。然后将 N 转换为二进制，统计其中 0 和 1 的个数。
 * 
 * 实现原理：
 * 解题思路：
 * 1. 遍历字符串，对每个字符判断是否为英文字母，若是则计算其序号（不区分大小写）并累加。
 * 2. 将累加得到的和通过不断除以 2 取余的方式转换为二进制，同时统计 0 和 1 的个数。
 * 3. 如果没有任何英文字母（和为 0），则直接输出 "0 0"。
 * 
 * 算法核心逻辑：遍历字符串 → 累加字母序号 → 除2取余统计二进制位。
 * 
 * 时间复杂度：O(L)，其中 L 为字符串长度。空间复杂度：O(1)。
 */
import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.io.IOException;

public class Main {
    public static void main(String[] args) throws IOException {
        BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
        String s = br.readLine();
        int sum = 0;
        // 遍历字符串，累加所有英文字母的序号
        for (int i = 0; i < s.length(); i++) {
            char c = s.charAt(i);
            if (c >= 'a' && c <= 'z') {
                sum += c - 'a' + 1; // 小写字母，a=1, b=2, ...
            } else if (c >= 'A' && c <= 'Z') {
                sum += c - 'A' + 1; // 大写字母，A=1, B=2, ...
            }
        }
        // 若没有字母，直接输出 "0 0"
        if (sum == 0) {
            System.out.println("0 0");
            return;
        }
        int count0 = 0;
        int count1 = 0;
        // 将 sum 转换为二进制，统计 0 和 1 的个数
        while (sum > 0) {
            if (sum % 2 == 0) {
                count0++;
            } else {
                count1++;
            }
            sum /= 2;
        }
        System.out.println(count0 + " " + count1);
    }
}