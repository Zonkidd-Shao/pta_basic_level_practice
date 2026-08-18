/*
 * 题目编号：1033 旧键盘打字
 * 
 * 题目描述：
 *   给定坏掉的键列表（第一行输入，可能为空）和要打出的文字（第二行），
 *   输出实际能打出的文字。其中 '+' 代表上档键 Shift 坏掉（所有大写字母无法打出），
 *   字母键损坏时大小写均无法打出（大小写不敏感）。
 *
 * 实现原理：
 *   解题思路：用布尔数组 broken[256] 标记所有坏掉的键（统一转为大写标记），
 *   同时用 shiftBroken 标记 Shift 键是否损坏。遍历要打出的文字，
 *   对于每个字符：若 Shift 坏了且是大写字母则跳过；若字符本身（转为大写后）在 broken 中则跳过。
 *   算法核心逻辑：
 *     1. 遍历坏键字符串，将每个字符转为大写后在 broken 数组中标记为 true。
 *        若遇到 '+' 则将 shiftBroken 设为 true。
 *     2. 遍历要输出的文字，对每个字符 c：
 *        - 若 shiftBroken 且 c 为大写字母，跳过。
 *        - 若 broken[Character.toUpperCase(c)] 为 true，跳过。
 *        - 否则将 c 追加到结果中。
 *     3. 输出结果字符串。
 *   时间复杂度：O(len(brokenLine) + len(text))。
 */

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.io.IOException;

public class Main {
    public static void main(String[] args) throws IOException {
        BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
        String brokenLine = br.readLine();
        String text = br.readLine();
        if (brokenLine == null) brokenLine = "";
        if (text == null) text = "";

        boolean[] broken = new boolean[256];
        boolean shiftBroken = false;

        // 遍历坏键列表，标记损坏的键
        for (int i = 0; i < brokenLine.length(); i++) {
            char c = brokenLine.charAt(i);
            broken[Character.toUpperCase(c)] = true; // 统一转为大写标记
            if (c == '+') shiftBroken = true; // Shift 键损坏
        }

        StringBuilder sb = new StringBuilder();
        for (int i = 0; i < text.length(); i++) {
            char c = text.charAt(i);
            // 若 Shift 损坏，则无法输出大写字母
            if (shiftBroken && Character.isUpperCase(c)) continue;
            // 若该键损坏（大小写统一判断），则无法输出
            if (broken[Character.toUpperCase(c)]) continue;
            sb.append(c);
        }

        System.out.println(sb.toString());
    }
}
