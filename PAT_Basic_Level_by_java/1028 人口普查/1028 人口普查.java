/*
 * 题目编号：1028 人口普查
 * 
 * 题目描述：
 *   给定 N 个人的姓名和生日，找出所有生日在合法范围 [1814/09/06, 2014/09/06] 内的人，
 *   输出合法人数，以及其中最年长（年龄最大）和最年轻（年龄最小）的姓名。
 *   若没有合法生日，输出 0。
 *
 * 实现原理：
 *   解题思路：将日期作为字符串直接比较（ISO 格式 yyyy/mm/dd，字符串比较即对应日期先后顺序），
 *   遍历每个人，判断生日是否在合法区间内，同时更新最年长（日期最小）和最年轻（日期最大）的人。
 *   算法核心逻辑：
 *     1. 设合法日期下界 minDate = "1814/09/06"，上界 maxDate = "2014/09/06"。
 *     2. 初始化 oldestDate 为最大可能值（大于任何合法日期），youngestDate 为最小可能值。
 *     3. 遍历每个人，若生日在 [minDate, maxDate] 范围内则计数加 1，
 *        同时用字符串 compareTo 更新 oldestDate（取最小日期）和 youngestDate（取最大日期）。
 *     4. 若无合法生日输出 0，否则按 youngestName + " " + oldestName + " " + count 输出。
 *        注意：题目要求先输出最年轻的姓名再输出最年长的姓名。
 *   时间复杂度：O(N)，N 为人数。
 */

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.io.IOException;

public class Main {
    public static void main(String[] args) throws IOException {
        BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
        int n = Integer.parseInt(br.readLine().trim());

        // 合法生日的上下界
        String minDate = "1814/09/06";
        String maxDate = "2014/09/06";

        String oldestName = "", youngestName = "";
        // oldestDate 初始化为比任何合法日期都大的值（即最晚的日期）
        String oldestDate = "2014/09/07";
        // youngestDate 初始化为比任何合法日期都小的值（即最早的日期）
        String youngestDate = "1814/09/05";

        int count = 0; // 合法生日计数

        for (int i = 0; i < n; i++) {
            String line = br.readLine();
            if (line == null) break;
            String[] p = line.trim().split("\\s+");
            String name = p[0];
            String date = p[1];

            // 判断生日是否在合法范围内（字符串比较即日期先后顺序比较）
            if (date.compareTo(minDate) >= 0 && date.compareTo(maxDate) <= 0) {
                count++;
                // 更新最年长者：日期最小（出生最早）
                if (date.compareTo(oldestDate) < 0) {
                    oldestDate = date;
                    oldestName = name;
                }
                // 更新最年轻者：日期最大（出生最晚）
                if (date.compareTo(youngestDate) > 0) {
                    youngestDate = date;
                    youngestName = name;
                }
            }
        }

        if (count == 0) {
            System.out.println(0);
        } else {
            // 注意输出顺序：先最年轻的，再最年长的，然后是合法人数
            System.out.println(youngestName + " " + oldestName + " " + count);
        }
    }
}
