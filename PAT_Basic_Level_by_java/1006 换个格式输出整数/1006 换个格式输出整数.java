import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.io.IOException;

/**
 * 1006 换个格式输出整数
 *
 * 题目描述：
 * 用 B 表示"百"、S 表示"十"、123...n 表示个位数字（个位为几就输出 1 到 n 的连续数字），
 * 给定一个不超过 3 位的正整数，按此格式输出。例如输入 234，输出 BBSSS1234。
 *
 * 实现原理：
 * 通过整数除法和取模运算分别提取百位(b)、十位(s)、个位(g)数字，
 * 依次输出 b 个 'B'、s 个 'S'、1 到 g 的连续数字。
 * 时间复杂度 O(b + s + g) 即 O(n)，空间复杂度 O(1)。
 */
public class Main {
    public static void main(String[] args) throws IOException {
        BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
        int n = Integer.parseInt(br.readLine().trim());
        int b = n / 100;                   // 提取百位数字
        int s = (n / 10) % 10;             // 提取十位数字
        int g = n % 10;                    // 提取个位数字
        StringBuilder sb = new StringBuilder();
        // 输出 b 个 'B' 表示百位
        for (int i = 0; i < b; i++) sb.append('B');
        // 输出 s 个 'S' 表示十位
        for (int i = 0; i < s; i++) sb.append('S');
        // 输出 1 到 g 表示个位
        for (int i = 1; i <= g; i++) sb.append(i);
        System.out.println(sb.toString());
    }
}
