/**
 * 1061 判断题
 * 
 * 题目描述：
 * 判断题的评分规则为：每题有固定分值，每道题有唯一正确答案。
 * 给定 N 个学生的答案，统计每个学生的总分。
 * 
 * 实现原理：
 * 解题思路：
 * 1. 先读取每道题的分值数组 scores 和正确答案数组 answers。
 * 2. 对于每个学生，逐题比对答案，若与正确答案一致则累加该题分值。
 * 3. 输出每个学生的总分。
 * 
 * 算法核心逻辑：读取标准答案 → 逐学生逐题比对 → 累加得分。
 * 
 * 时间复杂度：O(N * M)，空间复杂度：O(M)。
 */
import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.io.IOException;

public class Main {
    public static void main(String[] args) throws IOException {
        BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
        String[] firstLine = br.readLine().trim().split("\\s+");
        int N = Integer.parseInt(firstLine[0]); // 学生人数
        int M = Integer.parseInt(firstLine[1]); // 题目数量

        // 读取每道题的分值
        String[] scoreStr = br.readLine().trim().split("\\s+");
        int[] scores = new int[M];
        for (int i = 0; i < M; i++) {
            scores[i] = Integer.parseInt(scoreStr[i]);
        }

        // 读取每道题的正确答案
        String[] answerStr = br.readLine().trim().split("\\s+");
        int[] answers = new int[M];
        for (int i = 0; i < M; i++) {
            answers[i] = Integer.parseInt(answerStr[i]);
        }

        // 逐学生判分
        for (int i = 0; i < N; i++) {
            String[] studentAns = br.readLine().trim().split("\\s+");
            int total = 0;
            for (int j = 0; j < M; j++) {
                // 答案正确则加上该题分值
                if (Integer.parseInt(studentAns[j]) == answers[j]) {
                    total += scores[j];
                }
            }
            System.out.println(total);
        }
    }
}