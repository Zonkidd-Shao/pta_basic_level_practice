import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

/**
 * 1077 互评成绩计算
 *
 * 题目描述：
 * 在浙大的计算机专业课中，经常有互评分组活动。这个环节由一个老师给分，
 * 其他同学给分（互评）。计算最终得分时，先去掉一个最高分和一个最低分，
 * 然后计算剩余分数的平均分G1，老师给分为G2，最终成绩为(G1 + G2) / 2，
 * 四舍五入取整后输出。
 * 注意：同学评分必须在[0, M]范围内才有效，超出范围的评分要忽略。
 *
 * 实现原理：
 * 解题思路：
 * 1. 读取学生总数N和评分上限M
 * 2. 对每组（共N组），读取一行数据：第一个是老师给分，后面N-1个是同学互评
 * 3. 过滤掉不在[0, M]范围内的无效评分
 * 4. 对有效评分进行排序，去掉第一个（最低分）和最后一个（最高分）
 * 5. 计算剩余评分的平均值G1
 * 6. 最终得分 = (G1 + 老师给分) / 2，四舍五入取整输出
 *
 * 算法核心逻辑：
 * - 使用ArrayList收集有效评分，支持动态添加
 * - Collections.sort()对评分排序，方便去除最高分和最低分
 * - 计算G1时排除索引0和size()-1的两个极端值
 * - Math.round()实现四舍五入
 *
 * 时间复杂度：O(N log N)，主要耗时在排序操作
 * 空间复杂度：O(N)，存储同学评分列表
 */
public class Main {
    public static void main(String[] args) throws IOException {
        BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
        String[] firstLine = br.readLine().trim().split(" ");
        int N = Integer.parseInt(firstLine[0]);
        int M = Integer.parseInt(firstLine[1]);
        
        for (int i = 0; i < N; i++) {
            String[] parts = br.readLine().trim().split(" ");
            int teacherScore = Integer.parseInt(parts[0]);  // 老师给分

            // 收集有效的同学评分（在[0, M]范围内）
            List<Integer> scores = new ArrayList<>();
            for (int j = 1; j < N; j++) {
                int s = Integer.parseInt(parts[j]);
                if (s >= 0 && s <= M) {  // 只保留有效评分
                    scores.add(s);
                }
            }

            // 排序后去掉一个最高分和一个最低分
            Collections.sort(scores);
            double sum = 0;
            for (int j = 1; j < scores.size() - 1; j++) {  // 排除索引0（最低分）和size-1（最高分）
                sum += scores.get(j);
            }
            double g1 = sum / (scores.size() - 2);  // 同学互评平均分
            double finalScore = (g1 + teacherScore) / 2;  // 最终成绩
            System.out.println((int) Math.round(finalScore));  // 四舍五入取整输出
        }
    }
}
