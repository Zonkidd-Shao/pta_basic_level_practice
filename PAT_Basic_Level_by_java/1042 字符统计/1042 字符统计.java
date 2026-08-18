import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.io.IOException;

/**
 * 1042 字符统计
 *
 * 题目描述：
 * 统计字符串中出现次数最多的英文字母（大小写不敏感）。若存在并列，则取字典序
 * 最小的字母，并输出该字母及其出现次数。
 *
 * 实现原理：
 * 1. 将输入字符串全部转换为小写，方便大小写不敏感的比较。
 * 2. 使用长度为 26 的计数数组，遍历字符串，仅当字符在 'a'~'z' 范围内时，
 *    对应计数加 1。
 * 3. 遍历计数数组找出最大值 max，并记录对应的字母 best。
 *    - 由于从 'a' 到 'z' 顺序遍历，遇到相等计数时不会更新（保持字典序更小的字母）。
 * 4. 输出 best 和 max。
 *
 * 时间复杂度：O(n)，n 为字符串长度
 */
public class Main {
    public static void main(String[] args) throws IOException {
        BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
        String s = br.readLine();
        if (s == null) return;
        // 转换为小写，方便大小写不敏感统计
        s = s.toLowerCase();
        // 统计 26 个英文字母出现次数
        int[] cnt = new int[26];
        for (int i = 0; i < s.length(); i++) {
            char c = s.charAt(i);
            if (c >= 'a' && c <= 'z') cnt[c - 'a']++;
        }
        // 找出出现次数最多的字母（按字典序遍历，并列时自动取小）
        int max = -1;
        char best = 'a';
        for (int i = 0; i < 26; i++) {
            if (cnt[i] > max) {
                max = cnt[i];
                best = (char) ('a' + i);
            }
        }
        System.out.println(best + " " + max);
    }
}
