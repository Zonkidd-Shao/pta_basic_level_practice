import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.io.IOException;

/**
 * 1002 写出这个数
 *
 * 题目描述：
 * 读入一个正整数 n（n < 10^100，即最多 100 位），计算其各位数字之和，
 * 用汉语拼音写出和的每一位数字。例如输入 1234567890987654321123456789，
 * 输出 yi san wu。
 *
 * 实现原理：
 * 1. 将输入数字视为字符串，遍历每个字符累加得到各位数字之和。
 * 2. 将和转换为字符串，逐位映射到拼音数组 PINYIN 输出。
 * 注意 n 可能非常大（最多 100 位），远超出 int/long 范围，因此必须用字符串处理。
 * 时间复杂度 O(len(n))，空间复杂度 O(1)。
 */
public class Main {
    // 数字 0~9 对应的汉语拼音
    private static final String[] PINYIN = {
        "ling", "yi", "er", "san", "si", "wu", "liu", "qi", "ba", "jiu"
    };

    public static void main(String[] args) throws IOException {
        BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
        String s = br.readLine().trim();        // 以字符串形式读取大数
        int sum = 0;
        // 遍历每个字符，累加各位数字
        for (int i = 0; i < s.length(); i++) {
            sum += s.charAt(i) - '0';            // 将字符转换为对应的数字值
        }
        String sumStr = Integer.toString(sum);   // 将和转为字符串，以便逐位取数字
        StringBuilder sb = new StringBuilder();
        // 逐位转换为拼音，数字间用空格分隔
        for (int i = 0; i < sumStr.length(); i++) {
            if (i > 0) sb.append(' ');
            sb.append(PINYIN[sumStr.charAt(i) - '0']);
        }
        System.out.println(sb.toString());
    }
}
