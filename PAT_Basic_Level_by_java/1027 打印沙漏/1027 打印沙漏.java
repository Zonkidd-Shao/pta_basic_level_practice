/*
 * 题目编号：1027 打印沙漏
 * 
 * 题目描述：
 *   给定一个正整数 N（<=1000）和一个字符，用该字符打印一个尽可能大的沙漏形状，
 *   沙漏由上下两个三角形组成，每行符号数呈奇数等差数列（1, 3, 5, ...），
 *   要求使用的字符数不超过 N，最后输出剩余未使用的字符数。
 *
 * 实现原理：
 *   解题思路：沙漏的总字符数满足公式 2 * k^2 - 1，其中 k 为沙漏的层数（半边层数）。
 *   先找到最大的 k 使得 2 * k^2 - 1 <= N，然后按 k 从上到下（递减）打印上半部分，
 *   再从第 2 层到第 k 层（递增）打印下半部分。每层先打印空格再打印符号。
 *   算法核心逻辑：
 *     1. 从 k=1 开始递增，找出满足 2*(k+1)^2-1 <= N 的最大 k。
 *     2. 上半部分（含尖端）：从 i=k 到 1，每行空格数为 k-i，符号数为 2*i-1。
 *     3. 下半部分（不含尖端）：从 i=2 到 k，每行空格数为 k-i，符号数为 2*i-1。
 *     4. 输出沙漏后，计算并输出剩余字符数 N - used。
 *   时间复杂度：O(k^2)，其中 k 为沙漏层数，k <= sqrt(N/2) ≈ 22。
 */

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.io.IOException;

public class Main {
    public static void main(String[] args) throws IOException {
        BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
        String[] parts = br.readLine().trim().split("\\s+");
        int n = Integer.parseInt(parts[0]);   // 给定的字符总数
        char c = parts[1].charAt(0);           // 用于打印的字符

        // 找出最大的 k，使得沙漏总字符数 2*k^2-1 <= n
        int k = 1;
        while (2 * (k + 1) * (k + 1) - 1 <= n) k++;

        int used = 2 * k * k - 1; // 实际使用的字符数

        StringBuilder sb = new StringBuilder();

        // 上半部分（含尖端一行）：从 k 行到 1 行，每行符号数递减
        for (int i = k; i >= 1; i--) {
            for (int s = 0; s < k - i; s++) sb.append(' ');      // 前导空格
            for (int s = 0; s < 2 * i - 1; s++) sb.append(c);    // 符号
            sb.append('\n');
        }

        // 下半部分（不含尖端）：从 2 行到 k 行，每行符号数递增
        for (int i = 2; i <= k; i++) {
            for (int s = 0; s < k - i; s++) sb.append(' ');      // 前导空格
            for (int s = 0; s < 2 * i - 1; s++) sb.append(c);    // 符号
            sb.append('\n');
        }

        System.out.print(sb);
        System.out.println(n - used); // 输出剩余字符数
    }
}
