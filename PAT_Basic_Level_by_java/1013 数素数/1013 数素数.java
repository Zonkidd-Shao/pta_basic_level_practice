/*
 * 题目编号：1013 数素数
 * 题目描述：令Pi表示第i个素数。现任给两个正整数M≤N≤10^4，请输出PM到PN的所有素数。
 * 输入格式：输入在一行中给出M和N，其间以空格分隔。
 * 输出格式：输出从PM到PN的所有素数，每10个数字占一行，其间以空格分隔，但行末不得有多余空格。
 * 实现原理：
 *   解题思路：从2开始逐个判断素数，使用计数器count记录当前是第几个素数。
 *   当count >= M时开始收集输出，直到count == N为止。
 *   核心算法：判断素数采用试除法，只需检查2到√x之间的整数是否能整除x。
 *   输出格式控制：每输出10个数字换行，行内数字之间用空格分隔。
 * 时间复杂度：O(N * √M)，其中N为素数个数上限，M为最大素数大小。
 * 空间复杂度：O(1)，仅使用常量级额外空间。
 */
import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.io.IOException;

/**
 * 1013 数素数
 * 输出第 M 到第 N 个素数（M<=N<=10^4），每 10 个一行。
 */
public class Main {
    public static void main(String[] args) throws IOException {
        BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
        String[] parts = br.readLine().trim().split("\\s+");
        int m = Integer.parseInt(parts[0]);
        int n = Integer.parseInt(parts[1]);
        // count：当前找到的素数个数；num：当前检查的数字；printed：已输出的素数个数
        int count = 0, num = 1, printed = 0;
        StringBuilder sb = new StringBuilder();
        // 循环直到找到第N个素数
        while (count < n) {
            num++;
            if (isPrime(num)) {
                count++;
                if (count >= m) {           // 从第M个素数开始输出
                    if (printed % 10 != 0) sb.append(' ');  // 行内数字间加空格
                    sb.append(num);
                    printed++;
                    if (printed % 10 == 0) sb.append('\n');  // 每10个换行
                }
            }
        }
        System.out.print(sb.toString());
    }

    // 判断x是否为素数（试除法，只需检查到√x）
    private static boolean isPrime(int x) {
        if (x < 2) return false;
        for (int i = 2; i * i <= x; i++) {
            if (x % i == 0) return false;
        }
        return true;
    }
}