import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.io.IOException;

/**
 * 1078 字符串压缩与解压
 * 
 * 题目描述：
 * 给定一个字符串，根据指令进行压缩（C）或解压（D）操作。
 * 压缩规则：将连续重复的字符替换为该字符及其出现次数（次数大于1时输出次数）。
 * 解压规则：将数字及其后的字符还原为对应数量的该字符。
 * 
 * 实现原理：
 * 解题思路：
 * - 根据输入的第一个字符（C或D）判断执行压缩还是解压操作
 * - 压缩操作：遍历字符串，统计每个连续字符出现的次数，若次数>1则输出次数+字符，否则只输出字符
 * - 解压操作：遍历字符串，遇到数字字符则解析出完整数字，然后根据数字重复输出后续字符
 * 
 * 算法核心逻辑：
 * - 压缩：双指针遍历，外层指针 i 指向当前字符，内层循环统计连续相同字符个数
 * - 解压：遇到数字时连续读取多位数字构成完整数值，然后输出该数值个数的后续字符
 * 
 * 时间复杂度：O(n)，其中 n 为字符串长度。压缩和解压均只需一次线性遍历。
 * 空间复杂度：O(n)，需要使用 StringBuilder 存储结果字符串。
 */
public class Main {
    public static void main(String[] args) throws IOException {
        BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
        char op = br.readLine().trim().charAt(0);
        String s = br.readLine();
        
        // 根据操作符选择压缩或解压
        if (op == 'C') {
            System.out.println(compress(s));
        } else {
            System.out.println(decompress(s));
        }
    }
    
    // 压缩操作：统计连续相同字符，输出"次数（>1时）+字符"
    private static String compress(String s) {
        StringBuilder sb = new StringBuilder();
        int n = s.length();
        int i = 0;
        while (i < n) {
            char c = s.charAt(i);
            int count = 1;
            // 统计连续相同字符的个数
            while (i + count < n && s.charAt(i + count) == c) {
                count++;
            }
            // 出现次数大于1时才输出数字
            if (count > 1) {
                sb.append(count);
            }
            sb.append(c);
            i += count;
        }
        return sb.toString();
    }
    
    // 解压操作：解析数字并重复输出后续字符
    private static String decompress(String s) {
        StringBuilder sb = new StringBuilder();
        int n = s.length();
        int i = 0;
        while (i < n) {
            // 遇到数字时，解析完整的数值
            if (Character.isDigit(s.charAt(i))) {
                int num = 0;
                while (i < n && Character.isDigit(s.charAt(i))) {
                    num = num * 10 + (s.charAt(i) - '0');
                    i++;
                }
                // 数字后的字符，重复输出 num 次
                char c = s.charAt(i);
                for (int j = 0; j < num; j++) {
                    sb.append(c);
                }
                i++;
            } else {
                // 无数字前缀时，直接输出单个字符
                sb.append(s.charAt(i));
                i++;
            }
        }
        return sb.toString();
    }
}
