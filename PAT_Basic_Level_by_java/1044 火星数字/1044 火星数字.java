import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.io.IOException;

/**
 * 1044 火星数字
 *
 * 题目描述：
 * 实现十进制数（范围 [0, 169)）与火星十三进制表示之间的相互转换。火星文使用
 * 两个词表：低位词（"tret", "jan", "feb", ... 对应 0~12）和高位词（"tam",
 * "hel", ... 对应 13~12×13）。
 *
 * 实现原理：
 * 1. 十进制 → 火星文：
 *    - 0 特殊处理返回 "tret"
 *    - 按 13 进制分解为高位 (num/13) 和低位 (num%13)
 *    - 高位为 0 只输出低位词，低位为 0 只输出高位词，否则输出 "高位词 低位词"
 * 2. 火星文 → 十进制：
 *    - 按空格分割，对每个 token 分别在 HIGH 和 LOW 词表中查找
 *    - 在高位词表中找到则累加 13*h，在低位词表中找到则累加 l
 * 3. indexOf 方法实现线性查找词表。
 *
 * 时间复杂度：O(N)，N 为查询次数。每次转换 O(1)
 */
public class Main {
    private static final String[] LOW = {"tret", "jan", "feb", "mar", "apr", "may", "jun",
            "jly", "aug", "sep", "oct", "nov", "dec"};
    private static final String[] HIGH = {"", "tam", "hel", "maa", "huh", "tou", "kes",
            "hei", "elo", "syy", "lok", "mer", "jou"};

    public static void main(String[] args) throws IOException {
        BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
        int n = Integer.parseInt(br.readLine().trim());
        StringBuilder sb = new StringBuilder();
        for (int i = 0; i < n; i++) {
            String line = br.readLine().trim();
            if (Character.isDigit(line.charAt(0))) {
                sb.append(toMars(Integer.parseInt(line))).append('\n');
            } else {
                sb.append(toNum(line)).append('\n');
            }
        }
        System.out.print(sb);
    }

    // 十进制 → 火星文：按 13 进制分解为高位和低位，查表转换
    private static String toMars(int num) {
        if (num == 0) return "tret";
        int high = num / 13;   // 高位（13的倍数）
        int low = num % 13;    // 低位（0~12）
        if (high == 0) return LOW[low];         // 只有低位
        if (low == 0) return HIGH[high];        // 只有高位（整十位）
        return HIGH[high] + " " + LOW[low];     // 高位 + 低位
    }

    // 火星文 → 十进制：按空格分割后分别在 HIGH 和 LOW 词表中查找
    private static int toNum(String s) {
        String[] parts = s.split("\\s+");
        int val = 0;
        for (String p : parts) {
            int h = indexOf(HIGH, p);
            if (h > 0) val += h * 13;   // 在高位词表中找到
            else val += indexOf(LOW, p); // 在低位词表中找到
        }
        return val;
    }

    // 在字符串数组中线性查找指定值，返回下标
    private static int indexOf(String[] arr, String s) {
        for (int i = 0; i < arr.length; i++) {
            if (arr[i].equals(s)) return i;
        }
        return -1;
    }
}
