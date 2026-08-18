import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.io.IOException;

/**
 * 1040 有几个PAT
 *
 * 题目描述：
 * 给定一个长度不超过 10^5 的字符串，统计其中 "PAT" 子序列的个数（子序列不要求连续），
 * 结果对 1000000007 取模。
 *
 * 实现原理：
 * 使用动态规划/递推思想，一次遍历即可完成统计：
 * 1. 维护三个计数器：
 *    - countP：当前已遍历的字符中 'P' 的个数
 *    - countPA：当前已遍历的字符中 "PA" 子序列的个数
 *    - countPAT：当前已遍历的字符中 "PAT" 子序列的个数
 * 2. 遍历字符串中的每个字符 c：
 *    - 若 c == 'P'，countP++（一个新的 'P' 可以和后面的 'A'/'T' 组合）
 *    - 若 c == 'A'，countPA += countP（每个 'P' 都可以与这个 'A' 组成 "PA"）
 *    - 若 c == 'T'，countPAT += countPA（每个 "PA" 都可以与这个 'T' 组成 "PAT"）
 * 3. 每一步都对 MOD 取模，防止溢出。
 *
 * 时间复杂度：O(n)，仅需一次线性遍历。空间复杂度：O(1)
 */
public class Main {
    private static final int MOD = 1000000007;

    public static void main(String[] args) throws IOException {
        BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
        String s = br.readLine();
        if (s == null) {
            System.out.println(0);
            return;
        }
        // 递推统计 P、PA、PAT 的组合数
        long countP = 0, countPA = 0, countPAT = 0;
        for (int i = 0; i < s.length(); i++) {
            char c = s.charAt(i);
            if (c == 'P') countP++;                              // 新增一个 P
            else if (c == 'A') countPA = (countPA + countP) % MOD;  // 每个 P 可与当前 A 组成 PA
            else if (c == 'T') countPAT = (countPAT + countPA) % MOD; // 每个 PA 可与当前 T 组成 PAT
        }
        System.out.println(countPAT);
    }
}
