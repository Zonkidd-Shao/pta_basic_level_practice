/*
 * 题目编号：1029 旧键盘
 * 
 * 题目描述：
 *   给定两个字符串：应输入的文字（expected）和实际输出的文字（actual），
 *   找出肯定坏掉的键（即 expected 中有但 actual 中没有的字符），
 *   按 expected 中的出现顺序输出，大写显示，每个坏键只输出一次（去重）。
 *
 * 实现原理：
 *   解题思路：先遍历实际输出字符串 actual，用布尔数组标记所有出现过的字符（转为小写比较）。
 *   再遍历应输入字符串 expected，若某个字符在 actual 中未出现且尚未被输出过，
 *   则判定为坏键并输出（转为大写）。
 *   算法核心逻辑：
 *     1. 遍历 actual，将每个字符转为小写后在布尔数组 seen[256] 中标记为 true。
 *     2. 遍历 expected，将每个字符转为小写后检查 seen 数组；
 *        若为 false（实际未输出）且 printed 数组中未标记（未输出过），
 *        则作为坏键输出，并在 printed 中标记。
 *     3. 所有坏键以大写形式输出。
 *   时间复杂度：O(len(expected) + len(actual))。
 */

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.io.IOException;

public class Main {
    public static void main(String[] args) throws IOException {
        BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
        String expected = br.readLine();
        String actual = br.readLine();
        if (expected == null) expected = "";
        if (actual == null) actual = "";

        // seen 数组标记实际输出中出现的字符（忽略大小写）
        boolean[] seen = new boolean[256];
        for (int i = 0; i < actual.length(); i++) {
            seen[Character.toLowerCase(actual.charAt(i))] = true;
        }

        // printed 数组记录已经输出的坏键，用于去重
        boolean[] printed = new boolean[256];
        StringBuilder sb = new StringBuilder();

        // 遍历应输入的文字，找出实际未输出的字符
        for (int i = 0; i < expected.length(); i++) {
            char ch = Character.toLowerCase(expected.charAt(i));
            if (!seen[ch] && !printed[ch]) {
                printed[ch] = true;
                sb.append(Character.toUpperCase(expected.charAt(i)));
            }
        }

        System.out.println(sb.toString());
    }
}
