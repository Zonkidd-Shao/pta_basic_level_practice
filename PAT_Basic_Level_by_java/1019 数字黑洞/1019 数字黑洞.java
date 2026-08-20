/*
 * 题目编号：1019 数字黑洞
 * 题目描述：给定任一个各位数字不完全相同的4位正整数，如果我们先把4个数字按非递增排序，
 *   再按非递减排序，然后用第1个数字减第2个数字，将得到一个新的数字。
 *   一直重复这样做，我们很快会停在有"数字黑洞"之称的6174，这个神奇的数字也叫Kaprekar常数。
 *   现给定一个4位正整数，请编写程序演示到达黑洞的过程。
 * 实现原理：
 *   解题思路：
 *   - 使用sortDigits方法将4位数的各位数字取出，排序后按升序或降序重新组合成整数。
 *   - 每次循环中，计算降序排列的数减去升序排列数的差值。
 *   - 按格式"%04d - %04d = %04d"输出每一步，直到差值为6174为止。
 *   - sortDigits方法：将数字的各位存入数组，用选择排序按降序排列；
 *     如果ascending为true，则按降序数组正序组成升序数；
 *     如果ascending为false，则按降序数组逆序组成降序数。
 *     注意：不足4位时高位补0，以保证总是4位数运算。
 * 时间复杂度：O(1)，最多循环次数固定（Kaprekar过程最多7步到达6174）。
 * 空间复杂度：O(1)，仅使用常量级额外空间。
 */
import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.io.IOException;

/**
 * 1019 数字黑洞
 * 对任意 4 位正整数反复做 递减排序 - 递增排序，直到得到 6174，按 4 位格式演示过程。
 */
public class Main {
    public static void main(String[] args) throws IOException {
        BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
        int n = Integer.parseInt(br.readLine().trim());
        StringBuilder sb = new StringBuilder();
        while (true) {
            int inc = sortDigits(n, true);   // 降序排列（构成大数）
            int dec = sortDigits(n, false);  // 升序排列（构成小数）
            int diff = inc - dec;             // 计算差值
            sb.append(String.format("%04d - %04d = %04d\n", inc, dec, diff));
            if (diff == 6174 || diff == 0) break;
            n = diff;                         // 以差值继续迭代
        }
        System.out.print(sb);
    }

    // 将数字n的4位数字排序后重新组合为整数
    // ascending=true时返回升序排列的数，否则返回降序排列的数
    private static int sortDigits(int n, boolean ascending) {
        int[] d = new int[4];
        // 提取4位数字（含前导0）
        for (int i = 0; i < 4; i++) {
            d[i] = n % 10;
            n /= 10;
        }
        // 选择排序：按降序排列（d[0] >= d[1] >= d[2] >= d[3]）
        for (int i = 0; i < 4; i++) {
            for (int j = i + 1; j < 4; j++) {
                if (d[j] > d[i]) {
                    int t = d[i];
                    d[i] = d[j];
                    d[j] = t;
                }
            }
        }
        int res = 0;
        if (ascending) {
            // 升序：取降序数组的最低位到最高位
            for (int i = 0; i < 4; i++) res = res * 10 + d[i];
        } else {
            // 降序：取降序数组的最高位到最低位
            for (int i = 3; i >= 0; i--) res = res * 10 + d[i];
        }
        return res;
    }
}
