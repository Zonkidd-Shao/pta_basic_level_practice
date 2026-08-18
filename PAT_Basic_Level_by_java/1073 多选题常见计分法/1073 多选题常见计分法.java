import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

/**
 * 1073 多选题常见计分法
 *
 * 题目描述：
 * 批改多选题，并统计学生答错最多的题目选项。评分规则：
 * - 全对得满分
 * - 部分正确（选对部分选项，没有选错选项）得一半分
 * - 有选错选项得0分
 * 统计每题每个选项被选错（包括多选和漏选）的次数，找出错误次数最多的选项。
 *
 * 实现原理：
 * 解题思路：
 * 1. 读取每道题的信息：满分、选项数、正确选项，存入数组
 * 2. 使用二维数组wrongCount[M][5]统计每题每个选项（a~e）的错误次数
 * 3. 解析每个学生的答题字符串，提取每道题的作答选项
 * 4. 对每道题，比较学生的作答与正确答案：
 *    - 全对：满分
 *    - 部分对（无错选）：一半分
 *    - 有错选：0分
 * 5. 对每个选项，若学生选择不等于正确答案，则该选项错误计数+1
 * 6. 遍历wrongCount找出最大错误次数，输出对应选项
 *
 * 算法核心逻辑：
 * - 使用boolean数组correct[i][j]表示第i题选项j是否为正确答案
 * - 使用selected数组记录学生选择的选项，与correct逐项比较
 * - hasWrong标记是否有错选（选了一个错误选项）
 * - allCorrect标记是否完全正确（所有选项都匹配）
 * - 解析字符串时，通过括号()定位每道题的作答区域
 *
 * 时间复杂度：O(N×M×C)，其中C为每个题的选项数
 * 空间复杂度：O(M×5)，存储每题的正确选项信息和错误统计
 */
public class Main {
    public static void main(String[] args) throws IOException {
        BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
        String[] firstLine = br.readLine().trim().split(" ");
        int N = Integer.parseInt(firstLine[0]);
        int M = Integer.parseInt(firstLine[1]);
        
        int[] fullScore = new int[M];    // 每道题的满分
        int[] optionCount = new int[M];   // 每道题的选项数
        boolean[][] correct = new boolean[M][5];  // correct[i][j]表示第i题选项j是否为正确答案

        // 读取每道题的配置信息
        for (int i = 0; i < M; i++) {
            String[] parts = br.readLine().trim().split(" ");
            fullScore[i] = Integer.parseInt(parts[0]);      // 满分
            optionCount[i] = Integer.parseInt(parts[1]);    // 选项个数
            int correctCount = Integer.parseInt(parts[2]);  // 正确选项个数
            for (int j = 0; j < correctCount; j++) {
                char c = parts[3 + j].charAt(0);
                correct[i][c - 'a'] = true;  // 标记正确选项
            }
        }

        // wrongCount[i][j] 记录第i题选项j（a~e）的错误次数
        int[][] wrongCount = new int[M][5];

        // 逐名学生批改试卷
        for (int i = 0; i < N; i++) {
            String line = br.readLine().trim();
            double score = 0.0;  // 该学生总分
            int pos = 0;  // 字符串解析位置指针

            for (int j = 0; j < M; j++) {
                // 定位到左括号，开始解析第j题的学生作答
                while (line.charAt(pos) != '(') {
                    pos++;
                }
                pos++;  // 跳过左括号
                // 解析学生选择的选项个数k
                int k = 0;
                while (line.charAt(pos) != ' ') {
                    k = k * 10 + (line.charAt(pos) - '0');
                    pos++;
                }
                pos++;  // 跳过空格

                // 解析学生具体选择了哪些选项
                boolean[] selected = new boolean[5];
                for (int l = 0; l < k; l++) {
                    char c = line.charAt(pos);
                    selected[c - 'a'] = true;
                    pos++;
                    if (l < k - 1) {
                        pos++;  // 跳过选项间的空格
                    }
                }
                // 定位到右括号
                while (line.charAt(pos) != ')') {
                    pos++;
                }
                pos++;  // 跳过右括号

                // 逐项比较学生作答与正确答案
                boolean hasWrong = false;   // 是否有选错选项
                boolean allCorrect = true;  // 是否全部正确

                for (int c = 0; c < optionCount[j]; c++) {
                    if (selected[c] != correct[j][c]) {
                        // 学生选择与正确答案不一致，该选项错误计数+1
                        wrongCount[j][c]++;
                        if (selected[c]) {  // 学生选了错误选项（多选）
                            hasWrong = true;
                        }
                        // 漏选正确选项时，allCorrect为false但hasWrong不变
                        allCorrect = false;
                    }
                }

                // 评分：全对满分，部分对（无错选）得一半分，有错选得0分
                if (allCorrect) {
                    score += fullScore[j];
                } else if (!hasWrong) {
                    score += fullScore[j] * 0.5;
                }
            }

            System.out.printf("%.1f\n", score);  // 输出该学生总分
        }

        // 找出错误次数最多的选项
        int maxWrong = 0;
        for (int i = 0; i < M; i++) {
            for (int j = 0; j < 5; j++) {
                if (wrongCount[i][j] > maxWrong) {
                    maxWrong = wrongCount[i][j];
                }
            }
        }
        
        if (maxWrong == 0) {
            System.out.println("Too simple");
        } else {
            for (int i = 0; i < M; i++) {
                for (int j = 0; j < 5; j++) {
                    if (wrongCount[i][j] == maxWrong) {
                        System.out.println(maxWrong + " " + (i + 1) + "-" + (char) ('a' + j));
                    }
                }
            }
        }
    }
}
