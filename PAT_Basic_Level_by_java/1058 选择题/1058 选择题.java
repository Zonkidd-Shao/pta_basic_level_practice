/**
 * 1058 选择题
 * 
 * 题目描述：
 * 批改多选题。第一行给出两个正整数 N（学生人数）和 M（题目数量）。
 * 随后 M 行每行按格式给出：题目分值、选项个数、正确选项个数、正确选项。
 * 之后 N 行每行给出一个学生的答题情况，格式如 "(2 a c) (3 b d e)"。
 * 要求统计每个学生的得分，并找出被最多学生做错的题目编号。
 * 
 * 实现原理：
 * 解题思路：
 * 1. 用 Question 类存储每道题的分值和正确选项（用 HashSet 存储以便快速比较）。
 * 2. 对于每个学生的答题记录，逐题解析括号内的内容，提取学生选择的选项。
 * 3. 通过 Set.equals() 比较学生的选项集合与正确答案集合是否完全一致，完全一致才给分。
 * 4. 每道题被答错时，对应题号的错误计数加一。
 * 5. 最后找出错误次数最多的题目（可能有多个并列），若全对则输出 "Too simple"。
 * 
 * 算法核心逻辑：逐题解析 → 集合比较判分 → 统计错误次数 → 找出最多错误题。
 * 
 * 时间复杂度：O(N * M)，空间复杂度：O(M)。
 */
import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

public class Main {
    // 题目类，存储分值和正确选项集合
    static class Question {
        int score;
        Set<Character> correctAnswers;

        Question(int score, Set<Character> correctAnswers) {
            this.score = score;
            this.correctAnswers = correctAnswers;
        }
    }

    public static void main(String[] args) throws IOException {
        BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
        String[] firstLine = br.readLine().trim().split("\\s+");
        int N = Integer.parseInt(firstLine[0]); // 学生人数
        int M = Integer.parseInt(firstLine[1]); // 题目数量

        // 读取每道题的信息
        Question[] questions = new Question[M];
        for (int i = 0; i < M; i++) {
            String[] parts = br.readLine().trim().split("\\s+");
            int score = Integer.parseInt(parts[0]);       // 题目分值
            int optionCount = Integer.parseInt(parts[1]); // 选项个数（本题未使用）
            int correctCount = Integer.parseInt(parts[2]); // 正确选项个数
            Set<Character> correct = new HashSet<>();
            for (int j = 0; j < correctCount; j++) {
                correct.add(parts[3 + j].charAt(0)); // 读取正确选项字母
            }
            questions[i] = new Question(score, correct);
        }

        int[] wrongCount = new int[M]; // 记录每道题的错误次数

        // 逐学生判分
        for (int i = 0; i < N; i++) {
            String line = br.readLine().trim();
            int totalScore = 0;
            int qIdx = 0;   // 当前处理的题目索引
            int pos = 0;    // 字符串解析位置
            // 解析括号内的答题内容
            while (pos < line.length() && qIdx < M) {
                // 找到左括号
                while (pos < line.length() && line.charAt(pos) != '(') {
                    pos++;
                }
                if (pos >= line.length()) break;
                pos++; // 跳过 '('
                // 读取选项个数
                int count = 0;
                while (pos < line.length() && line.charAt(pos) != ' ') {
                    count = count * 10 + (line.charAt(pos) - '0');
                    pos++;
                }
                pos++; // 跳过空格
                // 读取学生选择的选项
                Set<Character> answers = new HashSet<>();
                for (int j = 0; j < count; j++) {
                    answers.add(line.charAt(pos));
                    pos += 2; // 跳过选项字母和后面的空格（或右括号前的空格）
                }
                // 跳过到右括号
                while (pos < line.length() && line.charAt(pos) != ')') {
                    pos++;
                }
                pos++; // 跳过 ')'
                // 判分：完全正确才得分，否则该题错误计数加一
                if (answers.equals(questions[qIdx].correctAnswers)) {
                    totalScore += questions[qIdx].score;
                } else {
                    wrongCount[qIdx]++;
                }
                qIdx++;
            }
            System.out.println(totalScore);
        }

        // 找出最大错误次数
        int maxWrong = 0;
        for (int i = 0; i < M; i++) {
            if (wrongCount[i] > maxWrong) {
                maxWrong = wrongCount[i];
            }
        }

        // 输出结果
        if (maxWrong == 0) {
            System.out.println("Too simple");
        } else {
            // 收集所有错误次数最多的题目编号
            List<Integer> result = new ArrayList<>();
            for (int i = 0; i < M; i++) {
                if (wrongCount[i] == maxWrong) {
                    result.add(i + 1); // 题目编号从 1 开始
                }
            }
            StringBuilder sb = new StringBuilder();
            sb.append(maxWrong);
            for (int num : result) {
                sb.append(" ").append(num);
            }
            System.out.println(sb.toString());
        }
    }
}