/*
 * 题目编号：1032 挖掘机技术哪家强
 * 
 * 题目描述：
 *   给定 N 个学校的参赛成绩（学校编号和对应分数），统计每个学校的总分，
 *   输出总分最高的学校编号及其总分。
 *
 * 实现原理：
 *   解题思路：使用数组 sum[] 以学校编号为索引累加总分（学校编号范围为 1~100000），
 *   同时维护当前最高总分 best 及其对应的学校编号 bestId。
 *   算法核心逻辑：
 *     1. 创建一个大小为 100001 的 long 数组 sum，下标对应学校编号。
 *     2. 遍历每条记录，累加对应学校的总分。
 *     3. 每次累加后，若该学校总分超过当前最高分 best，则更新 best 和 bestId。
 *     4. 输出 bestId 和 best。
 *   时间复杂度：O(N)，N 为参赛记录数。
 */

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.io.IOException;

public class Main {
    public static void main(String[] args) throws IOException {
        BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
        int n = Integer.parseInt(br.readLine().trim());

        // 学校编号 1~100000，使用 long 防止总分溢出
        long[] sum = new long[100001];
        int bestId = 1;
        long best = 0;

        for (int i = 0; i < n; i++) {
            String[] p = br.readLine().trim().split("\\s+");
            int school = Integer.parseInt(p[0]);
            int score = Integer.parseInt(p[1]);

            sum[school] += score;

            // 若该学校总分成为新的最高分，则更新
            if (sum[school] > best) {
                best = sum[school];
                bestId = school;
            }
        }

        System.out.println(bestId + " " + best);
    }
}
