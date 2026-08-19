import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.io.IOException;

/**
 * 1009 说反话
 *
 * 题目描述：
 * 给定一句英语，要求将句中所有单词的顺序颠倒输出。
 * 单词之间用空格分隔，句首和句尾没有多余空格。
 * 例如输入 "Hello World Here I Come"，输出 "Come I Here World Hello"。
 *
 * 实现原理：
 * 使用 split("\\s+") 按空白字符将句子分割为单词数组，
 * 然后从后向前遍历数组拼接字符串即可。
 * 时间复杂度 O(L)（L 为字符串长度），空间复杂度 O(N)（N 为单词数）。
 */
public class Main {
    public static void main(String[] args) throws IOException {
        BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
        String line = br.readLine();
        if (line == null) return;                     // 处理空输入
        String[] words = line.trim().split("\\s+");   // 按空白字符分割为单词数组
        StringBuilder sb = new StringBuilder();
        // 从后向前遍历，实现单词顺序反转
        for (int i = words.length - 1; i >= 0; i--) {
            if (i < words.length - 1) sb.append(' '); // 单词之间加空格
            sb.append(words[i]);
        }
        System.out.println(sb.toString());
    }
}
