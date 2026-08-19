import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.io.IOException;

/**
 * 1043 输出PATest
 *
 * 题目描述：
 * 给定一个由英文字母构成的字符串，按 "PATest" 的固定顺序循环输出其中包含的
 * 这六个字符（P、A、T、e、s、t），直到所有字符输出完毕。若某字符已用完则跳过。
 *
 * 实现原理：
 * 1. 初始化长度为 6 的计数数组，分别对应 'P','A','T','e','s','t' 的出现次数。
 * 2. 遍历原字符串，统计目标字符的出现次数。
 * 3. 使用 do-while 循环，每轮按固定顺序遍历六个字符：
 *    - 若该字符计数 > 0，则追加到 StringBuilder 并计数减 1
 *    - 若某轮没有任何字符被追加，说明所有字符已用完，退出循环
 * 4. 输出 StringBuilder 中的结果。
 *
 * 时间复杂度：O(n + total) 其中 n 为字符串长度，total 为六个字符的总数
 */
public class Main {
    public static void main(String[] args) throws IOException {
        BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
        String s = br.readLine();
        if (s == null) return;
        // 统计 P,A,T,e,s,t 六个字符的出现次数
        int[] cnt = new int[6];
        for (int i = 0; i < s.length(); i++) {
            char c = s.charAt(i);
            if (c == 'P') cnt[0]++;
            else if (c == 'A') cnt[1]++;
            else if (c == 'T') cnt[2]++;
            else if (c == 'e') cnt[3]++;
            else if (c == 's') cnt[4]++;
            else if (c == 't') cnt[5]++;
        }
        // 按 P A T e s t 顺序循环输出，直到所有字符用完
        char[] order = {'P', 'A', 'T', 'e', 's', 't'};
        StringBuilder sb = new StringBuilder();
        boolean any;
        do {
            any = false;
            for (int i = 0; i < 6; i++) {
                if (cnt[i] > 0) {
                    sb.append(order[i]);
                    cnt[i]--;      // 消耗一个字符
                    any = true;    // 本轮仍有输出
                }
            }
        } while (any);  // 若某轮无任何输出，说明全部用完
        System.out.println(sb.toString());
    }
}
