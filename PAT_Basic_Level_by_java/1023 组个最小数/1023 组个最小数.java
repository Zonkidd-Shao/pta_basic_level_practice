/*
 * 题目编号：1023 组个最小数
 * 
 * 题目描述：
 *   给定数字 0~9 各若干个，所有数字全部要用上，将它们组合成一个尽可能小的数，
 *   且 0 不能放在首位。
 *
 * 实现原理：
 *   解题思路：要组成最小的数，应将最小的非零数字放在最高位（首位不能为 0），
 *   然后将剩余数字按从小到大的顺序依次排列在后面。
 *   算法核心逻辑：
 *     1. 读入 0~9 每个数字的个数，存入数组 cnt[10]。
 *     2. 从 1~9 中找出最小的一个非零数字作为首位，将该数字个数减 1。
 *     3. 再从 0~9 按从小到大的顺序，将每个数字剩余的全部个数依次拼接到结果中。
 *   时间复杂度：O(1) —— 只需遍历固定长度（10）的数组，与输入数字总个数无关。
 */

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.io.IOException;

public class Main {
    public static void main(String[] args) throws IOException {
        BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
        String[] parts = br.readLine().trim().split("\\s+");
        int[] cnt = new int[10];
        // 读取 0~9 每个数字的个数
        for (int i = 0; i < 10; i++) {
            cnt[i] = Integer.parseInt(parts[i]);
        }

        StringBuilder sb = new StringBuilder();

        // 第一步：从 1~9 中找出最小的非零数字作为首位
        for (int i = 1; i <= 9; i++) {
            if (cnt[i] > 0) {
                sb.append(i);
                cnt[i]--;
                break;
            }
        }

        // 第二步：从 0~9 从小到大依次将剩余数字全部拼接
        for (int i = 0; i <= 9; i++) {
            while (cnt[i] > 0) {
                sb.append(i);
                cnt[i]--;
            }
        }

        System.out.println(sb.toString());
    }
}
