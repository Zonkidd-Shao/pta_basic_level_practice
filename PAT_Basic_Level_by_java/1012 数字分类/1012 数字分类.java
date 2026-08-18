/*
 * 题目编号：1012 数字分类
 * 题目描述：给定一系列正整数，按照模5的余数进行分类，分别计算以下5类数字：
 *   A1 = 能被5整除的数字中所有偶数的和；
 *   A2 = 将被5除后余1的数字按给出顺序进行交错求和，即计算n1-n2+n3-n4...；
 *   A3 = 被5除后余2的数字的个数；
 *   A4 = 被5除后余3的数字的平均数，精确到小数点后1位；
 *   A5 = 被5除后余4的数字中最大数字。
 *   如果某一类数字不存在，则在对应位置输出"N"。
 * 实现原理：
 *   解题思路：依次读取每个数字，根据其模5的余数(r = x % 5)进行分类处理。
 *   - r == 0：判断是否为偶数，累加到A1
 *   - r == 1：使用sign标志位实现交错求和（正负交替），同时记录个数
 *   - r == 2：计数器A3加1
 *   - r == 3：累加和到A4Sum，计数A4Count，最后计算平均值
 *   - r == 4：记录最大值到A5
 *   最后根据各类是否有数据决定输出具体数值还是"N"。
 * 时间复杂度：O(n)，其中n为数字个数。
 * 空间复杂度：O(1)，仅使用常量级额外空间。
 */
import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.io.IOException;

/**
 * 1012 数字分类
 * 对正整数按模 5 的余数分类计算 A1~A5，某一类无数字则输出 N。
 */
public class Main {
    public static void main(String[] args) throws IOException {
        BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
        String[] parts = br.readLine().trim().split("\\s+");
        int n = Integer.parseInt(parts[0]);
        // A1：能被5整除的偶数之和
        long a1 = 0;
        // A2：交错求和，sign控制正负交替，a2Count记录余1的数字个数
        int a2 = 0, a2Count = 0, sign = 1;
        // A3：余2的数字个数
        int a3 = 0;
        // A4：余3的数字之和与个数，用于计算平均值
        double a4Sum = 0;
        int a4Count = 0;
        // A5：余4的数字中的最大值
        int a5 = 0;
        for (int i = 1; i <= n; i++) {
            int x = Integer.parseInt(parts[i]);
            int r = x % 5;          // 计算模5的余数
            if (r == 0) {
                if (x % 2 == 0) a1 += x;   // 能被5整除且为偶数
            } else if (r == 1) {
                a2 += sign * x;             // 交错求和：正负交替
                sign = -sign;               // 翻转符号
                a2Count++;
            } else if (r == 2) {
                a3++;                       // 统计个数
            } else if (r == 3) {
                a4Sum += x;                 // 累加求和
                a4Count++;
            } else if (r == 4) {
                if (x > a5) a5 = x;         // 取最大值
            }
        }
        StringBuilder sb = new StringBuilder();
        // 根据是否有数据决定输出数值还是"N"
        sb.append(a1 > 0 ? a1 : "N").append(' ');
        sb.append(a2Count > 0 ? a2 : "N").append(' ');
        sb.append(a3 > 0 ? a3 : "N").append(' ');
        sb.append(a4Count > 0 ? String.format("%.1f", a4Sum / a4Count) : "N").append(' ');
        sb.append(a5 > 0 ? a5 : "N");
        System.out.println(sb.toString());
    }
}