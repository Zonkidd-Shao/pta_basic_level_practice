/*
 * 题目编号：1026 程序运行时间
 * 
 * 题目描述：
 *   给定两次时钟打点数 C1 和 C2，计算程序运行时间。
 *   时钟每秒打点 CLK_TCK = 100 次，时间 = (C2 - C1) / 100 秒（四舍五入到整数秒），
 *   然后按 hh:mm:ss 格式输出。
 *
 * 实现原理：
 *   解题思路：将两次打点数之差除以 100.0 得到秒数（浮点），用 Math.round() 四舍五入，
 *   再将总秒数换算为 时:分:秒 输出。
 *   算法核心逻辑：
 *     1. 计算差值 diff = C2 - C1。
 *     2. 四舍五入取整秒：total = Math.round(diff / 100.0)。
 *     3. 时间换算：hh = total / 3600，mm = (total % 3600) / 60，ss = total % 60。
 *     4. 按 "%02d:%02d:%02d" 格式输出，保证每位占 2 位，不足补零。
 *   时间复杂度：O(1)，仅常数次运算。
 */

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.io.IOException;

public class Main {
    public static void main(String[] args) throws IOException {
        BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
        String[] parts = br.readLine().trim().split("\\s+");
        long c1 = Long.parseLong(parts[0]);
        long c2 = Long.parseLong(parts[1]);

        // 差值除以 100（浮点），四舍五入取整秒
        long total = Math.round((c2 - c1) / 100.0);

        // 将总秒数换算为时、分、秒
        long hh = total / 3600;
        long mm = (total % 3600) / 60;
        long ss = total % 60;

        // 按 hh:mm:ss 格式输出，各占 2 位，不足补零
        System.out.printf("%02d:%02d:%02d\n", hh, mm, ss);
    }
}
