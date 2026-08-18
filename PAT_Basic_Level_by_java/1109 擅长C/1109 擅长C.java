/*
 * 1109 擅长C
 * 
 * 题目描述：
 *     给定26个大写英文字母的7×5字符矩阵表示（每个字母由7行组成，
 *     每行5个字符），再给定一个句子（可能包含大小写字母和非字母字符）。
 *     从句子中提取出所有由连续大写字母组成的单词，
 *     并用给定的字母矩阵将每个单词以图形方式输出。
 *     单词之间用空行分隔。
 * 
 * 实现原理：
 *     解题思路：
 *         1. 读取26个字母的7×5矩阵，存入三维字符数组letters[26][7]。
 *         2. 读取句子，遍历提取所有连续大写字母组成的单词存入List。
 *         3. 对每个单词，按行输出：对于7行中的每一行，将单词中
 *            每个字母对应的矩阵行拼接起来，字母间用空格分隔。
 *         4. 单词之间输出一个空行隔开。
 *     时间复杂度：O(len(句子) + 单词数 × 字母数 × 7)，空间复杂度：O(26×7×5)。
 */
import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.util.ArrayList;
import java.util.List;

public class Main {
    public static void main(String[] args) throws IOException {
        BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
        
        // 读取26个字母的7x5字符矩阵
        String[][] letters = new String[26][7];
        for (int i = 0; i < 26; i++) {
            for (int j = 0; j < 7; j++) {
                letters[i][j] = br.readLine();
            }
        }
        
        // 读取句子
        String sentence = br.readLine();
        
        // 提取句子中由连续大写字母组成的单词
        List<String> words = new ArrayList<>();
        StringBuilder currentWord = new StringBuilder();
        
        for (int i = 0; i < sentence.length(); i++) {
            char c = sentence.charAt(i);
            if (c >= 'A' && c <= 'Z') {
                // 遇到大写字母，追加到当前单词
                currentWord.append(c);
            } else {
                // 遇到非大写字母，当前单词结束
                if (currentWord.length() > 0) {
                    words.add(currentWord.toString());
                    currentWord = new StringBuilder();
                }
            }
        }
        // 处理句子末尾可能存在的单词
        if (currentWord.length() > 0) {
            words.add(currentWord.toString());
        }
        
        // 输出每个单词的图形表示
        for (int w = 0; w < words.size(); w++) {
            if (w > 0) {
                System.out.println(); // 单词之间空一行
            }
            String word = words.get(w);
            // 逐行输出，每个字母矩阵有7行
            for (int row = 0; row < 7; row++) {
                StringBuilder line = new StringBuilder();
                for (int i = 0; i < word.length(); i++) {
                    if (i > 0) {
                        line.append(" "); // 同一行中字母之间用空格分隔
                    }
                    int letterIdx = word.charAt(i) - 'A';  // 字母在数组中的索引
                    line.append(letters[letterIdx][row]);  // 取该字母当前行的5个字符
                }
                System.out.println(line.toString());
            }
        }
    }
}
