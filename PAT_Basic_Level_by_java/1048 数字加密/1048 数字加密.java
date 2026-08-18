/**
 * 1048 数字加密
 * 
 * 题目描述：
 * 给定两个正整数 A 和 B，从个位开始按照奇数位和偶数位进行加密：
 * 奇数位（个位为第1位，即奇数位）：将 A 和 B 对应位数字相加后对 10 取模。
 * 偶数位：用 B 的数字减去 A 的数字，若结果为负则加 10（即取差值绝对值后模 10）。
 * 如果两个数位数不同，较短的数在左侧补 0 后再进行配对加密。
 * 输出加密后的结果数字。
 * 
 * 实现原理：
 * 解题思路：
 * 1. 将两个数字字符串反转，使个位对齐到下标 0，方便从低位开始处理。
 * 2. 较短的字符串在末尾补 '0'（反转后补在尾部相当于原数的左侧补 0），使长度相等。
 * 3. 遍历每一位，按下标奇偶性判断位次：
 *    - 奇数位（i % 2 == 0）：(x + y) % 10
 *    - 偶数位（i % 2 == 1）：(y - x + 10) % 10（等价于 |x - y| % 10）
 * 4. 将结果反转回正常顺序输出。
 * 
 * 核心思想：字符串反转使个位对齐，简化奇偶位判断和补零操作。
 * 
 * 时间复杂度：O(max(lenA, lenB))，空间复杂度：O(max(lenA, lenB))
 */
import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.io.IOException;

public class Main {
    public static void main(String[] args) throws IOException {
        BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
        String[] parts = br.readLine().trim().split("\\s+");
        String a = parts[0];
        String b = parts[1];
        // 反转字符串使个位对齐到下标 0
        StringBuilder ra = new StringBuilder(a).reverse();
        StringBuilder rb = new StringBuilder(b).reverse();
        int max = Math.max(ra.length(), rb.length());
        // 较短的数补 '0'（原数左侧补 0）
        while (ra.length() < max) ra.append('0');
        while (rb.length() < max) rb.append('0');
        StringBuilder res = new StringBuilder();
        for (int i = 0; i < max; i++) {
            int x = ra.charAt(i) - '0';
            int y = rb.charAt(i) - '0';
            int c;
            if (i % 2 == 0) c = (x + y) % 10;       // 奇数位（个位为第1位，下标0）
            else c = (y - x + 10) % 10;               // 偶数位：B-A，负则+10
            res.append(c);
        }
        // 反转回正常顺序输出
        System.out.println(res.reverse().toString());
    }
}
