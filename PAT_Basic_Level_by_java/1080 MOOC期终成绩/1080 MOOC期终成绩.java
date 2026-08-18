import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * 1080 MOOC期终成绩
 * 
 * 题目描述：
 * 合并编程作业、期中考试、期末考试三张成绩单，计算每位学生的总评成绩，
 * 筛选出编程作业分≥200且总评≥60的学生，按总评降序、学号升序输出。
 * 总评计算规则：期中分>期末分时，总评=期中×40%+期末×60%；否则总评=期末分。
 * 
 * 实现原理：
 * 解题思路：
 * - 使用 HashMap 以学号为键存储学生信息，便于快速查找和更新
 * - 依次读取三部分成绩，分别更新各分数段，未参加考试的成绩记为-1
 * - 遍历所有学生，筛选出符合条件（编程分≥200且总评≥60）的学生放入列表
 * - 对合格列表进行排序（总评降序，学号升序），按格式输出
 * 
 * 算法核心逻辑：
 * - 学生类 Student 实现 Comparable 接口，定义排序规则
 * - calcG() 方法根据规则计算总评成绩，使用 Math.round() 四舍五入取整
 * - 利用 HashMap.getOrDefault() 简化代码，避免重复判断 key 是否存在
 * 
 * 时间复杂度：O(P+M+N+KlogK)，P/M/N为三类成绩人数，K为合格学生数，排序耗时O(KlogK)
 * 空间复杂度：O(P+M+N)，HashMap 存储所有出现过的学生信息
 */
public class Main {
    // 学生信息类，包含三门成绩和总评
    static class Student implements Comparable<Student> {
        String id;    // 学号
        int gp;       // 编程作业成绩（-1表示未参加）
        int mid;      // 期中考试成绩（-1表示未参加）
        int fin;      // 期末考试成绩（-1表示未参加）
        int g;        // 计算后的总评成绩
        
        public Student(String id) {
            this.id = id;
            this.gp = -1;
            this.mid = -1;
            this.fin = -1;
        }
        
        // 计算总评成绩：期中>期末时加权计算，否则取期末成绩
        public void calcG() {
            double gFinal;
            if (mid > fin) {
                gFinal = mid * 0.4 + fin * 0.6;
            } else {
                gFinal = fin;
            }
            this.g = (int) Math.round(gFinal);
        }
        
        // 排序规则：总评降序，总分相同学号升序
        @Override
        public int compareTo(Student other) {
            if (this.g != other.g) {
                return other.g - this.g;
            }
            return this.id.compareTo(other.id);
        }
    }
    
    public static void main(String[] args) throws IOException {
        BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
        String[] firstLine = br.readLine().trim().split(" ");
        int P = Integer.parseInt(firstLine[0]);
        int M = Integer.parseInt(firstLine[1]);
        int N = Integer.parseInt(firstLine[2]);
        
        Map<String, Student> map = new HashMap<>();
        
        for (int i = 0; i < P; i++) {
            String[] parts = br.readLine().trim().split(" ");
            String id = parts[0];
            int score = Integer.parseInt(parts[1]);
            Student s = map.getOrDefault(id, new Student(id));
            s.gp = score;
            map.put(id, s);
        }
        
        for (int i = 0; i < M; i++) {
            String[] parts = br.readLine().trim().split(" ");
            String id = parts[0];
            int score = Integer.parseInt(parts[1]);
            Student s = map.getOrDefault(id, new Student(id));
            s.mid = score;
            map.put(id, s);
        }
        
        for (int i = 0; i < N; i++) {
            String[] parts = br.readLine().trim().split(" ");
            String id = parts[0];
            int score = Integer.parseInt(parts[1]);
            Student s = map.getOrDefault(id, new Student(id));
            s.fin = score;
            map.put(id, s);
        }
        
        // 筛选合格学生：编程作业≥200且总评≥60
        List<Student> qualified = new ArrayList<>();
        for (Student s : map.values()) {
            if (s.gp >= 200) {
                s.calcG();
                if (s.g >= 60) {
                    qualified.add(s);
                }
            }
        }
        
        Collections.sort(qualified);
        
        for (Student s : qualified) {
            System.out.println(s.id + " " + s.gp + " " + s.mid + " " + s.fin + " " + s.g);
        }
    }
}
