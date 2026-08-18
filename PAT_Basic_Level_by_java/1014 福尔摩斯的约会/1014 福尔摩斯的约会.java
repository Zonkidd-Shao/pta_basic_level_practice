/*
 * 题目编号：1014 福尔摩斯的约会
 * 题目描述：大侦探福尔摩斯接到一张奇怪的字条："我们约会吧！3485djDkxh4hhGE 2984akDfkkkkggEdsb
 *   s&hgsfdk d&Hyscvnm"。大侦探很快就明白了，字条上奇怪的乱码实际上就是约会的时间"星期四 14:04"。
 *   解码规则：
 *   1. 前两个字符串中，第1对相同的大写英文字母（A~G）代表星期（A=MON, B=TUE, ..., G=SUN）；
 *   2. 前两个字符串中，在第1对相同字母之后，第1对相同的数字字符（0~9）或大写字母（A~N）代表小时
 *      （0~9对应0~9，A~N对应10~23）；
 *   3. 后两个字符串中，第1对相同的英文字母（大小写皆可）出现的位置（从0开始计数）代表分钟。
 * 实现原理：
 *   解题思路：按规则分三步解析。
 *   - 第一步：遍历前两个字符串，找到第一对相同的大写字母（范围A~G），映射到星期数组。
 *   - 第二步：从第一步找到的位置之后继续遍历，找到第一对相同的字符，如果是数字则直接转数字，
 *     如果是A~N则映射为10~23。
 *   - 第三步：遍历后两个字符串，找到第一对相同的英文字母，其下标即为分钟数。
 *   最后按格式"星期 HH:MM"输出，小时和分钟各占2位，不足补0。
 * 时间复杂度：O(len1 + len2 + len3 + len4)，即四个字符串长度之和。
 * 空间复杂度：O(1)，仅使用常量级额外空间。
 */
import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.io.IOException;

/**
 * 1014 福尔摩斯的约会
 * 解码约会时间：前两个字符串第 1 对相同大写字母(A-G)表星期，
 * 之后第 1 对相同字符(0-9/A-N)表小时；后两个字符串第 1 对相同字母的位置表分钟。
 */
public class Main {
    private static final String[] DAY = {"MON", "TUE", "WED", "THU", "FRI", "SAT", "SUN"};

    public static void main(String[] args) throws IOException {
        BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
        String s1 = br.readLine();
        String s2 = br.readLine();
        String s3 = br.readLine();
        String s4 = br.readLine();

        // 第一步：找星期（第一对相同的大写字母，A~G）
        int len = Math.min(s1.length(), s2.length());
        String day = "";
        int dayPos = -1;
        for (int i = 0; i < len; i++) {
            char c1 = s1.charAt(i), c2 = s2.charAt(i);
            if (c1 == c2 && c1 >= 'A' && c1 <= 'G') {
                day = DAY[c1 - 'A'];    // 映射到星期几
                dayPos = i;              // 记录位置，用于第二步
                break;
            }
        }
        // 第二步：找小时（第一对相同的数字0~9或字母A~N）
        int hour = 0;
        for (int i = dayPos + 1; i < len; i++) {
            char c1 = s1.charAt(i), c2 = s2.charAt(i);
            if (c1 == c2) {
                if (c1 >= '0' && c1 <= '9') {
                    hour = c1 - '0';      // 数字直接转换
                    break;
                } else if (c1 >= 'A' && c1 <= 'N') {
                    hour = c1 - 'A' + 10;  // A=10, B=11, ..., N=23
                    break;
                }
            }
        }
        // 第三步：找分钟（后两个字符串中第一对相同英文字母的位置）
        int l3 = Math.min(s3.length(), s4.length());
        int minute = 0;
        for (int i = 0; i < l3; i++) {
            char c3 = s3.charAt(i), c4 = s4.charAt(i);
            if (c3 == c4 && ((c3 >= 'A' && c3 <= 'Z') || (c3 >= 'a' && c3 <= 'z'))) {
                minute = i;               // 位置即为分钟数
                break;
            }
        }
        // 输出格式：星期 HH:MM，小时和分钟各占2位
        System.out.printf("%s %02d:%02d\n", day, hour, minute);
    }
}