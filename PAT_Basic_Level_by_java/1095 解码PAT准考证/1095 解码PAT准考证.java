/**
 * 1095 解码PAT准考证
 * 
 * 题目描述：
 * 对 PAT 准考证信息进行多种查询：
 *   - 类型1：按分数非升序输出某个指定级别的考生成绩
 *   - 类型2：统计某指定考场的考生人数和总分
 *   - 类型3：统计某指定日期的考生人数分考场
 * 
 * 实现原理：
 * 解题思路：解析准考证号得到等级、考场、日期、编号等信息，
 *   对不同类型的查询分别处理。
 * 算法核心逻辑：
 *   1. 定义 Student 类存储考生信息，构造时从准考证号解析各字段
 *   2. 类型1：按等级筛选，按分数降序（同分按准考证号升序）排序输出
 *   3. 类型2：按考场筛选，统计人数和总分
 *   4. 类型3：按日期筛选，用 HashMap 统计各考场人数，
 *      按人数降序（同人数按考场号升序）排序输出
 * 时间复杂度：类型1 O(n log n)，类型2 O(n)，类型3 O(n log n)，n 为考生总数
 * 空间复杂度：O(n)
 */
import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class Main {
    // 考生信息类，准考证号包含等级、考场、日期、编号等信息
    static class Student {
        String id;
        int score;
        char level;      // 等级（第1位字符）
        String room;     // 考场（第2~4位）
        String date;     // 日期（第5~10位）
        String num;      // 编号（第11~13位）
        
        Student(String id, int score) {
            this.id = id;
            this.score = score;
            // 从准考证号解析各字段
            this.level = id.charAt(0);
            this.room = id.substring(1, 4);
            this.date = id.substring(4, 10);
            this.num = id.substring(10, 13);
        }
    }
    
    public static void main(String[] args) throws IOException {
        BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
        String[] firstLine = br.readLine().split(" ");
        int n = Integer.parseInt(firstLine[0]);
        int m = Integer.parseInt(firstLine[1]);
        
        // 读取所有考生信息
        List<Student> students = new ArrayList<>();
        for (int i = 0; i < n; i++) {
            String[] parts = br.readLine().split(" ");
            students.add(new Student(parts[0], Integer.parseInt(parts[1])));
        }
        
        // 处理每个查询
        for (int caseNum = 1; caseNum <= m; caseNum++) {
            String[] query = br.readLine().split(" ");
            int type = Integer.parseInt(query[0]);
            String term = query[1];
            
            System.out.println("Case " + caseNum + ": " + type + " " + term);
            
            if (type == 1) {
                // 类型1：按分数非升序输出某个指定级别的考生成绩
                char level = term.charAt(0);
                List<Student> list = new ArrayList<>();
                for (Student s : students) {
                    if (s.level == level) {
                        list.add(s);
                    }
                }
                if (list.isEmpty()) {
                    System.out.println("NA");
                } else {
                    // 按分数降序排序，分数相同则按准考证号升序
                    Collections.sort(list, new Comparator<Student>() {
                        public int compare(Student a, Student b) {
                            if (a.score != b.score) {
                                return b.score - a.score;
                            }
                            return a.id.compareTo(b.id);
                        }
                    });
                    for (Student s : list) {
                        System.out.println(s.id + " " + s.score);
                    }
                }
            } else if (type == 2) {
                // 类型2：统计某指定考场的考生人数和总分
                int count = 0;
                int total = 0;
                for (Student s : students) {
                    if (s.room.equals(term)) {
                        count++;
                        total += s.score;
                    }
                }
                if (count == 0) {
                    System.out.println("NA");
                } else {
                    System.out.println(count + " " + total);
                }
            } else if (type == 3) {
                // 类型3：统计某指定日期的考生人数分考场
                Map<String, Integer> roomCount = new HashMap<>();
                for (Student s : students) {
                    if (s.date.equals(term)) {
                        roomCount.put(s.room, roomCount.getOrDefault(s.room, 0) + 1);
                    }
                }
                if (roomCount.isEmpty()) {
                    System.out.println("NA");
                } else {
                    // 按人数降序排序，人数相同则按考场号升序
                    List<Map.Entry<String, Integer>> list = new ArrayList<>(roomCount.entrySet());
                    Collections.sort(list, new Comparator<Map.Entry<String, Integer>>() {
                        public int compare(Map.Entry<String, Integer> a, Map.Entry<String, Integer> b) {
                            if (!a.getValue().equals(b.getValue())) {
                                return b.getValue() - a.getValue();
                            }
                            return a.getKey().compareTo(b.getKey());
                        }
                    });
                    for (Map.Entry<String, Integer> entry : list) {
                        System.out.println(entry.getKey() + " " + entry.getValue());
                    }
                }
            }
        }
    }
}