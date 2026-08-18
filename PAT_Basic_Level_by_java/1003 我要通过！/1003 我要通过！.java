import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.io.IOException;

/**
 * 1003 我要通过！
 *
 * 题目描述：
 * 判定字符串是否满足 PAT "答案正确"的规则。
 * 条件：
 * 1. 字符串中仅含 P、A、T 三种字符，且 P、T 各出现一次；
 * 2. 设 P 之前 A 的个数为 a，P 与 T 之间 A 的个数为 b，T 之后 A 的个数为 c，
 *    则必须满足 b >= 1 且 a * b == c。
 * 本质上是检查形如 "A...APA...T A...A" 的模式，其中前后 A 的数量满足乘积关系。
 *
 * 实现原理：
 * 首先统计各类字符数量做初步筛选（只能有 1 个 P、1 个 T、至少 1 个 A、无其他字符）。
 * 然后通过 indexOf 找到 P 和 T 的位置，分别计算 before（P 前 A 数）、between（P 与 T 间 A 数）、
 * after（T 后 A 数），最后验证 between >= 1 且 before * between == after。
 * 时间复杂度 O(len(s))，空间复杂度 O(1)。
 */
public class Main {
    public static void main(String[] args) throws IOException {
        BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
        int n = Integer.parseInt(br.readLine().trim());   // 测试用例个数
        StringBuilder sb = new StringBuilder();
        // 逐条判断每个字符串是否"答案正确"
        for (int i = 0; i < n; i++) {
            String s = br.readLine();
            sb.append(isValid(s) ? "YES" : "NO").append('\n');
        }
        System.out.print(sb);
    }

    // 判断字符串是否符合 PAT 答案正确的规则
    private static boolean isValid(String s) {
        int p = 0, t = 0, a = 0, other = 0;  // 统计各字符出现次数
        for (int i = 0; i < s.length(); i++) {
            char c = s.charAt(i);
            if (c == 'P') p++;
            else if (c == 'T') t++;
            else if (c == 'A') a++;
            else other++;                      // 出现非法字符
        }
        // 初步筛选：P 和 T 各一个，至少有一个 A，无其他字符
        if (p != 1 || t != 1 || a == 0 || other != 0) return false;

        int posP = s.indexOf('P');              // P 的位置
        int posT = s.indexOf('T');              // T 的位置
        int before = posP;                      // P 之前 A 的个数
        int between = posT - posP - 1;          // P 与 T 之间 A 的个数
        int after = s.length() - posT - 1;      // T 之后 A 的个数

        // 中间必须有 A，且满足 a * b == c 的乘积关系
        if (between < 1) return false;
        return before * between == after;
    }
}
