/*
 * 1108 String复读机
 * 
 * 题目描述：
 *     给定一个字符串，从中提取出所有的'S'、't'、'r'、'i'、'n'、'g'字符
 *     （注意大小写敏感，S大写，其余字母小写），
 *     然后按照"String"的顺序循环输出，直到所有字符被用完。
 *     例如：有2个S、3个t、1个r，则输出"StStrSt..."。
 * 
 * 实现原理：
 *     解题思路：
 *         1. 遍历输入字符串，统计"S"、"t"、"r"、"i"、"n"、"g"每个字符的出现次数。
 *         2. 循环按"S"→"t"→"r"→"i"→"n"→"g"的顺序输出，
 *            每轮只输出该字符还有剩余的部分，直到所有字符都输出完毕。
 *         3. 需要注意：S是大写字母，其余5个字母是小写字母。
 *     时间复杂度：O(len(s) + 输出长度)，空间复杂度：O(1)。
 */
import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;

public class Main {
    public static void main(String[] args) throws IOException {
        BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
        String s = br.readLine();
        
        // 统计"String"中各字符的出现次数（注意大小写：S大写，其余小写）
        int countS = 0, countt = 0, countr = 0, counti = 0, countn = 0, countg = 0;
        
        for (int i = 0; i < s.length(); i++) {
            char c = s.charAt(i);
            if (c == 'S') countS++;
            else if (c == 't') countt++;
            else if (c == 'r') countr++;
            else if (c == 'i') counti++;
            else if (c == 'n') countn++;
            else if (c == 'g') countg++;
            // 其他字符忽略不计
        }
        
        StringBuilder sb = new StringBuilder();
        // 按"String"的顺序循环输出，直到所有字符都被用完
        while (countS > 0 || countt > 0 || countr > 0 || counti > 0 || countn > 0 || countg > 0) {
            if (countS > 0) { sb.append('S'); countS--; }
            if (countt > 0) { sb.append('t'); countt--; }
            if (countr > 0) { sb.append('r'); countr--; }
            if (counti > 0) { sb.append('i'); counti--; }
            if (countn > 0) { sb.append('n'); countn--; }
            if (countg > 0) { sb.append('g'); countg--; }
        }
        
        System.out.println(sb.toString());
    }
}
