/**
 * 1047 编程团体赛
 * 
 * 题目描述：
 * 编程团体赛的规则是：每个参赛队由若干队员组成，所有队员独立比赛，
 * 参赛队的成绩为所有队员的成绩之和。每个队员的编号格式为"队伍编号-队员编号"（如 1-2 表示第1队第2名队员）。
 * 给定所有 N 个队员的成绩，输出总分最高的队伍编号及其总分。
 * 
 * 实现原理：
 * 解题思路：
 * 1. 使用长度为 1001 的数组 sum 记录各队伍的总分（队伍编号范围隐含不超过 1000）。
 * 2. 遍历每个队员，从其编号中解析出队伍编号（取 '-' 前的部分），累加得分。
 * 3. 同时维护当前最高总分 best 及对应的队伍编号 bestTeam。
 * 4. 最后输出 bestTeam 和 best。
 * 
 * 核心思想：哈希思想（用数组模拟哈希表），将队伍编号直接映射为数组下标，
 * 实现 O(1) 的查找和更新。
 * 
 * 时间复杂度：O(n)，空间复杂度：O(1001) ≈ O(1)
 */
import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.io.IOException;

public class Main {
    public static void main(String[] args) throws IOException {
        BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
        int n = Integer.parseInt(br.readLine().trim());
        int[] sum = new int[1001];        // 队伍编号范围为 1~1000
        int best = 0, bestTeam = 0;       // 最高总分及对应的队伍编号
        for (int i = 0; i < n; i++) {
            String[] p = br.readLine().trim().split("\\s+");
            String teamStr = p[0];        // "队伍编号-队员编号"
            int score = Integer.parseInt(p[1]);
            int team = Integer.parseInt(teamStr.split("-")[0]); // 提取队伍编号
            sum[team] += score;
            // 更新最高总分记录
            if (sum[team] > best) {
                best = sum[team];
                bestTeam = team;
            }
        }
        System.out.println(bestTeam + " " + best);
    }
}
