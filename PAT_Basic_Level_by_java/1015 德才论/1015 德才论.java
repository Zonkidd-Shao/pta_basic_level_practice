/*
 * 题目编号：1015 德才论
 * 题目描述：宋代史学家司马光在《资治通鉴》中有一段著名的"德才论"：
 *   "才德全尽谓之圣人，才德兼亡谓之愚人，德胜才谓之君子，才胜德谓之小人。"
 *   现给定一批考生的德分和才分，按以下规则排序录取：
 *   1. 德分和才分均不低于录取分数线L的考生才有资格被考虑；
 *   2. 考生分为4类（优先级从高到低）：
 *      - 第1类：德分和才分均不低于H（"圣人"）；
 *      - 第2类：德分不低于H但才分低于H（"君子"）；
 *      - 第3类：德分和才分均低于H，但德分不低于才分（"德胜才"）；
 *      - 第4类：其他达到L线的考生。
 *   3. 排序规则：先按类别优先级（1->2->3->4），同类别内按总分（德+才）降序，
 *      总分相同则按德分降序，德分再相同则按准考证号升序。
 * 实现原理：
 *   解题思路：
 *   - 定义Student类存储考生信息，包含cat字段表示类别（1~4）。
 *   - 读取所有考生，仅保留德分和才分均不低于L的考生。
 *   - 根据德分和才分与H的比较结果确定类别：
 *     cat=1（德才均>=H），cat=2（德>=H但才<H），cat=3（德才均<H但德>=才），cat=4（其余）。
 *   - 排序时使用Comparator实现多级排序：先按cat升序，再按total降序，再按de降序，最后按id升序。
 * 时间复杂度：O(n log n)，其中n为考生人数，排序为主要耗时操作。
 * 空间复杂度：O(n)，需要存储所有符合条件的考生信息。
 */
import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;

/**
 * 1015 德才论
 * 按司马光德才理论对考生分类排序：圣人>君子>德胜才>其余，同档按总分降序、
 * 德分降序、准考证号升序。
 */
public class Main {
    // 考生内部类，包含准考证号、德分、才分、总分、类别
    static class Student {
        long id;
        int de, cai, total, cat;
        Student(long id, int de, int cai) {
            this.id = id;
            this.de = de;
            this.cai = cai;
            this.total = de + cai;  // 总分 = 德分 + 才分
        }
    }

    public static void main(String[] args) throws IOException {
        BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
        String[] first = br.readLine().trim().split("\\s+");
        int n = Integer.parseInt(first[0]);  // 考生总数
        int l = Integer.parseInt(first[1]);  // 录取最低分数线
        int h = Integer.parseInt(first[2]);  // 优秀分数线
        ArrayList<Student> list = new ArrayList<>();
        for (int i = 0; i < n; i++) {
            String[] p = br.readLine().trim().split("\\s+");
            long id = Long.parseLong(p[0]);
            int de = Integer.parseInt(p[1]);
            int cai = Integer.parseInt(p[2]);
            if (de < l || cai < l) continue;  // 未达到最低线，排除
            Student s = new Student(id, de, cai);
            // 划分考生类别（1~4，优先级递降）
            if (de >= h && cai >= h) s.cat = 1;       // 圣人：德才兼备
            else if (de >= h) s.cat = 2;               // 君子：德胜才（德高才低）
            else if (de >= cai) s.cat = 3;             // 德胜才：德不低于才
            else s.cat = 4;                             // 其余：才胜德或才德均低
            list.add(s);
        }
        // 多级排序：类别升序 > 总分降序 > 德分降序 > 准考证号升序
        Collections.sort(list, new Comparator<Student>() {
            public int compare(Student a, Student b) {
                if (a.cat != b.cat) return a.cat - b.cat;          // 类别升序
                if (a.total != b.total) return b.total - a.total;  // 总分降序
                if (a.de != b.de) return b.de - a.de;              // 德分降序
                return Long.compare(a.id, b.id);                    // 准考证号升序
            }
        });
        // 构建输出
        StringBuilder sb = new StringBuilder();
        sb.append(list.size()).append('\n');  // 第一行输出录取人数
        for (Student s : list) {
            sb.append(s.id).append(' ').append(s.de).append(' ').append(s.cai).append('\n');
        }
        System.out.print(sb);
    }
}