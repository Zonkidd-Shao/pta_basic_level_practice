/*
 * 题目编号：1021 个位数统计
 * 题目描述：给定一个不超过1000位的正整数N，统计其中每种个位数字出现的次数。
 *   对每一种不同的个位数字，按D:M的格式在一行中输出该数字D及其在N中出现的次数M，
 *   要求按D的升序输出。
 * 实现原理：
 *   解题思路：由于N可能长达1000位，无法用基本整数类型存储，因此以字符串形式读取。
 *   - 使用长度为10的整型数组cnt统计每个数字（0~9）出现的次数。
 *   - 遍历字符串的每个字符，将字符转为数字后对应位置计数加1。
 *   - 最后遍历cnt数组，按数字升序输出出现次数大于0的数字及其次数。
 * 时间复杂度：O(len(N))，其中len(N)为数字N的位数。
 * 空间复杂度：O(1)，使用固定大小的数组，与输入规模无关。
 */
import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.io.IOException;

/**
 * 1021 个位数统计
 * 统计一个不超过 1000 位的正整数中每种不同个位数字出现的次数，按数字升序输出 D:M。
 */
public class Main {
    public static void main(String[] args) throws IOException {
        BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
        String s = br.readLine().trim();
        int[] cnt = new int[10];  // 统计0~9每个数字出现的次数
        // 遍历字符串，统计每个数字出现的次数
        for (int i = 0; i < s.length(); i++) {
            cnt[s.charAt(i) - '0']++;
        }
        StringBuilder sb = new StringBuilder();
        // 按数字升序输出出现次数大于0的数字
        for (int d = 0; d <= 9; d++) {
            if (cnt[d] > 0) {
                sb.append(d).append(':').append(cnt[d]).append('\n');
            }
        }
        System.out.print(sb);
    }
}