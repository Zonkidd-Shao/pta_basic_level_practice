import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * 1085 PAT单位排行
 * 
 * 题目描述：
 * 给定 N 个考生的准考证号、分数和所属学校，统计每个学校的加权总分和考生人数。
 * 加权总分 = 乙级总分/1.5 + 甲级总分 + 顶级总分×1.5，取整数部分（向下取整）。
 * 输出排名：按加权总分降序，总分相同时按考生人数升序，再相同时按学校名字典序升序。
 * 处理并列排名（同分同名次，后续排名为实际位置）。
 * 
 * 实现原理：
 * 解题思路：
 * - 使用 HashMap 以学校名（小写）为键存储学校信息
 * - 遍历考生信息，根据准考证号首字母判断考试级别（B/A/T），分别累加分数
 * - 最后遍历所有学校，计算加权总分并排序，输出排名信息
 * 
 * 算法核心逻辑：
 * - School 类实现 Comparable 接口，定义三级排序规则
 * - 加权总分为 double 运算后取整（int 类型转换自动截断小数部分）
 * - 排名处理：当前分数与前一分数相同则排名不变，否则排名为当前序号+1
 * 
 * 时间复杂度：O(NlogN)，N为学校数量，排序为主要耗时操作
 * 空间复杂度：O(N)，HashMap 存储所有学校信息
 */
public class Main {
    // 学校信息类，包含三种级别成绩、考生人数和加权总分
    static class School implements Comparable<School> {
        String name;
        double scoreB;  // 乙级总分
        double scoreA;  // 甲级总分
        double scoreT;  // 顶级总分
        int count;      // 考生人数
        int weightedScore;  // 加权总分
        
        public School(String name) {
            this.name = name;
            this.scoreB = 0;
            this.scoreA = 0;
            this.scoreT = 0;
            this.count = 0;
        }
        
        // 计算加权总分：乙级/1.5 + 甲级 + 顶级×1.5，取整数部分
        public void calcWeighted() {
            this.weightedScore = (int) (scoreB / 1.5 + scoreA + scoreT * 1.5);
        }
        
        // 排序规则：加权总分降序 > 考生人数升序 > 学校名字典序升序
        @Override
        public int compareTo(School other) {
            if (this.weightedScore != other.weightedScore) {
                return other.weightedScore - this.weightedScore;
            }
            if (this.count != other.count) {
                return this.count - other.count;
            }
            return this.name.compareTo(other.name);
        }
    }
    
    public static void main(String[] args) throws IOException {
        BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
        int N = Integer.parseInt(br.readLine().trim());
        
        Map<String, School> map = new HashMap<>();
        
        // 遍历考生信息，统计各学校各级别总分和人数
        for (int i = 0; i < N; i++) {
            String[] parts = br.readLine().trim().split(" ");
            String id = parts[0];
            int score = Integer.parseInt(parts[1]);
            String school = parts[2].toLowerCase();  // 学校名统一转为小写
            
            School s = map.getOrDefault(school, new School(school));
            char level = id.charAt(0);  // 准考证号首字母标识考试级别
            if (level == 'B') {
                s.scoreB += score;
            } else if (level == 'A') {
                s.scoreA += score;
            } else if (level == 'T') {
                s.scoreT += score;
            }
            s.count++;
            map.put(school, s);
        }
        
        // 计算所有学校的加权总分并排序
        List<School> list = new ArrayList<>(map.values());
        for (School s : list) {
            s.calcWeighted();
        }
        Collections.sort(list);
        
        // 输出排名信息，处理并列排名
        System.out.println(list.size());
        
        int rank = 1;
        for (int i = 0; i < list.size(); i++) {
            // 如果当前分数与前一分数不同，更新排名为实际位置
            if (i > 0 && list.get(i).weightedScore != list.get(i - 1).weightedScore) {
                rank = i + 1;
            }
            School s = list.get(i);
            System.out.println(rank + " " + s.name + " " + s.weightedScore + " " + s.count);
        }
    }
}
