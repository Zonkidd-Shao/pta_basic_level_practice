import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.io.IOException;

/**
 * 1004 成绩排名
 *
 * 题目描述：
 * 读入 n 名学生的姓名、学号、成绩，输出成绩最高和最低学生的姓名与学号。
 * 题目保证成绩互不相同，不会出现并列情况。
 *
 * 实现原理：
 * 使用两个变量组分别记录最高分和最低分学生的信息。遍历每一行输入，
 * 解析出姓名、学号、成绩，与当前最高/最低分比较并更新。
 * 遍历完成后按格式输出最高分和最低分学生的姓名与学号。
 * 时间复杂度 O(n)，空间复杂度 O(1)。
 */
public class Main {
    public static void main(String[] args) throws IOException {
        BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
        int n = Integer.parseInt(br.readLine().trim());   // 学生人数
        String maxName = "", maxId = "";                  // 最高分学生信息
        String minName = "", minId = "";                  // 最低分学生信息
        int maxScore = -1, minScore = 101;                // 初始化极值（成绩范围 0~100）
        // 遍历每个学生记录
        for (int i = 0; i < n; i++) {
            String line = br.readLine();
            if (line == null) break;
            String[] parts = line.trim().split("\\s+");  // 按空白字符分割：姓名 学号 成绩
            String name = parts[0];
            String id = parts[1];
            int score = Integer.parseInt(parts[2]);
            // 更新最高分
            if (score > maxScore) {
                maxScore = score;
                maxName = name;
                maxId = id;
            }
            // 更新最低分
            if (score < minScore) {
                minScore = score;
                minName = name;
                minId = id;
            }
        }
        // 输出结果
        System.out.println(maxName + " " + maxId);
        System.out.println(minName + " " + minId);
    }
}
