/*
 * 题目编号：1016 部分A+B
 * 题目描述：正整数A的"DA（为1位整数）部分"定义为由A中所有DA组成的新整数PA。
 *   例如：给定A=3862767, DA=6，则A中的"6部分"PA是66，因为A中有2个6。
 *   现给定A、DA、B、DB，请编写程序计算PA + PB。
 * 实现原理：
 *   解题思路：遍历字符串A，将其中所有等于DA的字符提取出来，按顺序"拼接"成新整数PA。
 *   拼接方法：每遇到一个DA，将当前结果乘以10再加上DA的数字值（即(d - '0')）。
 *   同理计算PB，最后输出PA + PB。
 * 时间复杂度：O(len(A) + len(B))，即两个数字字符串的长度之和。
 * 空间复杂度：O(1)，仅使用常量级额外空间。
 */
import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.io.IOException;

/**
 * 1016 部分A+B
 * 由 A 中所有数字 D_A 组成 P_A，计算 P_A + P_B。
 */
public class Main {
    public static void main(String[] args) throws IOException {
        BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
        String[] parts = br.readLine().trim().split("\\s+");
        String a = parts[0];
        char da = parts[1].charAt(0);
        String b = parts[2];
        char db = parts[3].charAt(0);
        long pa = compute(a, da);
        long pb = compute(b, db);
        System.out.println(pa + pb);
    }

    // 从字符串s中提取所有等于d的数字，按顺序拼接成新整数
    private static long compute(String s, char d) {
        long res = 0;
        for (int i = 0; i < s.length(); i++) {
            if (s.charAt(i) == d) res = res * 10 + (d - '0');  // 逐位拼接
        }
        return res;
    }
}